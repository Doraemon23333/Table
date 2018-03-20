<%@ page import="com.springmvc.entity.Company" %>
<%@ page import="com.springmvc.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.springmvc.service.userTable" %>
<%@ page import="com.springmvc.service.companyTable" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: cheyl
  Date: 2018/3/18 0018
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看用户信息</title>

    <meta name="viewpoint" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/tool.css" type="text/css">
    <link rel="stylesheet" href="css/communal.css" type="text/css">
    <link rel="stylesheet" href="css/index.css" type="text/css">
    <link rel="stylesheet" href="css/index_3.8.css" type="text/css">
    <link rel="stylesheet" href="css/index_10.14.css" type="text/css">
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/jquery.placehold.min.js"></script>
    <script type="text/javascript" src="js/koala.min.1.5.js"></script>

    <link rel="stylesheet" href="css/systemNav.css" media="screen" type="text/css">
    <link href="css/companyRecord4.css" type="text/css" rel="stylesheet" media="screen, projection" />
</head>
<body>
<div class="header-box">
    <div class="container">
        <a class="logo" ></a>
        <div class="header-tool mr30 pt15">
            <div class="top_test"><img src="images/top_test.gif" width="280" height="110" alt=""/></div>
        </div>
    </div>
</div>
<!--header end-->
<!--nav start-->
<%!
    String rank = null;
    String userid = null;
%>
<%
    String id = request.getParameter("id");
    userid = id;
    rank = request.getParameter("rank");
%>
<div class="nav-box">
    <ul class="container nav">
        <li><a href="provincehome.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">首页</a></li>
        <li><a href="province2.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">企业信息</a></li>
        <li><a href="/">岗位数据</a></li>
        <li><a href="allUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" >系统管理</a></li>
    </ul>
</div>
<!--nav end-->
<!--leftnav start-->
<!--<div style="text-align:center;clear:both">
    <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
    <script src="/follow.js" type="text/javascript"></script>
</div>-->
<!-- Contenedor -->
<div style="float:left;margin-left: 150px;">
    <ul id="accordion" class="accordion">
        <li>
            <div class="link">上报时限</div>
            <ul class="submenu">
                <li><a href="systemNewTime.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">新增调查期</a></li>
                <li><a href="systemAlterTime.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">修改调查期</a></li>
            </ul>
        </li>
        <li>
            <div class="link">用户管理</div>
            <ul class="submenu">
                <li><a href="allUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">所有用户信息</a></li>
                <li><a href="newUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">新增用户信息</a></li>
                <li><a href="deleteUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">删除用户信息</a></li>
                <li><a href="alterUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">修改用户信息</a></li>
            </ul>
        </li>
        <li>
            <div class="link">角色管理</div>
            <ul class="submenu">
                <li><a href="#">定义角色</a></li>
                <li><a href="#">修改角色</a></li>
                <li><a href="#">删除角色</a></li>
            </ul>
        </li>
        <li><div class="link">系统监控</div>
            <ul class="submenu">
                <li><a href="systemInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">系统信息</a></li>
                <li><a href="systemOnlineInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">当前使用情况</a></li>
            </ul>
        </li>
    </ul>
</div>
<script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>
<script src="js/systemNav.js"></script>
<!--leftnav end-->
<div class="div2">
    <!--数据库返回所有信息-->
    <%!
        int show = 0;
        User user = new User();
        Company company = new Company();
        List<Company> companies = new ArrayList<Company>();
    %>
    <%
        userTable table = new userTable();
        companyTable table2 = new companyTable();
        table.findById(Integer.parseInt(request.getParameter("id")), user);
        company.id = Integer.parseInt(request.getParameter("id"));
        table2.show(company);
        if (user.rank == 3){
            Connection conn = table.getConnection();
            String sql = "select * from companyTable";
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
            Statement stmt = (Statement) conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                Company com = new Company();
                User userC = new User();
                com.originalArea = rs.getString("originalArea");
                com.id = rs.getInt("id");
                table.findById(com.id, userC);
                com.name = rs.getString("name");
                com.nameCode = rs.getString("nameCode");
                com.enterprisesNature = rs.getString("enterprisesNature");
                com.industry = rs.getString("industry");
                com.mainBusiness = rs.getString("mainBusiness");
                com.People = rs.getString("People");
                com.Address = rs.getString("Address");
                com.postalCode = rs.getString("postalCode");
                com.telephone = rs.getString("telephone");
                com.fax = rs.getString("fax");
                com.email = rs.getString("email");
                if (userC.rank == 1 && show == 0)
                    companies.add(com);
            }
            show = 1;
        }else if (user.rank == 2){
            Connection conn = table.getConnection();
            String sql = "select * from companyTable";
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
            Statement stmt = (Statement) conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                Company com = new Company();
                com.originalArea = rs.getString("originalArea");
                com.id = rs.getInt("id");
                User userC = new User();
                table.findById(com.id, userC);
                com.name = rs.getString("name");
                com.nameCode = rs.getString("nameCode");
                com.enterprisesNature = rs.getString("enterprisesNature");
                com.industry = rs.getString("industry");
                com.mainBusiness = rs.getString("mainBusiness");
                com.People = rs.getString("People");
                com.Address = rs.getString("Address");
                com.postalCode = rs.getString("postalCode");
                com.telephone = rs.getString("telephone");
                com.fax = rs.getString("fax");
                com.email = rs.getString("email");
                if (userC.rank == 1 && com.originalArea.equals(company.originalArea) && show == 0)
                    companies.add(com);
            }
            show = 1;
        }else {

        }
    %>



    <table border="2" align="center" width="1000">
        <tr>
            <td>城市</td>
            <td>企业性质</td>
            <td>所属行业</td>
            <td>企业名称</td>
            <td>企业编码</td>
        </tr>
        <%
            for (Company company1: companies){
        %>
        <tr>
            <td><%=company1.originalArea%></td>
            <td><%=company1.enterprisesNature%></td>
            <td><%=company1.industry%></td>
            <td><%=company1.name%></td>
            <td><%=company1.nameCode%></td>
        </tr>
        <%}%>
    </table>
</div>

<!--footer start-->
<div class="footer-box">
    <!--<div class="footer-link clearfix">
    </div>-->
    <div class="copyright">
        <div class="container" style="overflwo:hidden;height:95px;">
            <div style="float:left;margin-left:200px;display:inline;width:110px; text-align:center; overflow:hidden;padding-top:12px;">
            </div>
            <div style="float:left;display:inline;width:500px; text-align:center; overflow:hidden;">
                <p>系统名称：山东省人力资源市场数据采集系统 版权所有：宫烨的组</p>
                <p>技术支持：宫烨的组</p>
                <p>编号123456789</p>
            </div>
        </div>
    </div>
</div>
<!--footer end-->
</body>
</html>
