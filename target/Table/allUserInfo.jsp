<%@ page import="com.springmvc.entity.Company" %>
<%@ page import="com.springmvc.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.springmvc.service.userTable" %>
<%@ page import="com.springmvc.service.companyTable" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.springmvc.service.cityTable" %>
<%@ page import="com.springmvc.entity.Role" %>
<%@ page import="com.springmvc.service.RoleTable" %>
<
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
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
        <li><a href="province3.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0">岗位数据</a></li>
        <li><a href="allUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" >系统管理</a></li>
        <li><a href="bingtu.jsp?id=<%=request.getParameter("id") %>&rank=<%=request.getParameter("rank")%>">取样分析</a></li>
        <li><a href="trend.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" >趋势分析</a></li>
        <li><a href="/">退出</a></li>
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
                <li><a href="alterUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0">修改用户信息</a></li>
            </ul>
        </li>
        <li>
            <div class="link">角色管理</div>
            <ul class="submenu">
                <li><a href="role.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">系统角色</a></li>
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
    User user = new User();
    List <User> users;
%>
<%
    if (rank.equals("3")){
        RoleTable roleTable = new RoleTable();
        Role role = new Role();
        userTable tableU = new userTable();
        User user = new User();
        tableU.findById(Integer.parseInt(id), user);
        role.id = user.id;
        roleTable.findbyId(role);
        if (role.ifroot == 1 || role.SearchCompany == 1){
            userTable table = new userTable();
            companyTable table1 = new companyTable();
            users = new ArrayList<User>();
            Connection conn = table.getConnection();
            String sql = "select * from userTable";
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
            Statement stmt = (Statement) conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                User userC = new User();
                userC.id = rs.getInt("id");
                userC.account = rs.getString("account");
                userC.accompanyName = rs.getString("accompanyName");
                userC.password = rs.getString("password");
                userC.usingCondition = rs.getString("usingCondition");
                userC.registerYear = rs.getInt("registerYear");
                userC.registerMonth = rs.getInt("registerMonth");
                userC.registerDay = rs.getInt("registerDay");
                userC.unregisterYear = rs.getInt("unregisterYear");
                userC.unregisterMonth = rs.getInt("unregisterMonth");
                userC.unregisterDay = rs.getInt("unregisterDay");
                userC.rank = rs.getInt("rank");
                Company company = new Company();
                company.id = userC.id;
                table1.findbyId(company);
                userC.area = company.originalArea;
                users.add(userC);
            }
            rs.close();
            stmt.close();
            ps.close();
            conn.close();

            Connection conn1 = table.getConnection();
            String sql1 = "select * from cityTable";
            PreparedStatement ps1 = (PreparedStatement) conn1.prepareStatement(sql1);
            Statement stmt1 = (Statement) conn1.createStatement();
            ResultSet rs1 = stmt1.executeQuery(sql1);
            while(rs1.next()){
                User userC = new User();
                userC.id = rs1.getInt("id");
                userC.account = rs1.getString("account");
                userC.accompanyName = rs1.getString("accompanyName");
                userC.password = rs1.getString("password");
                userC.usingCondition = rs1.getString("usingCondition");
                userC.registerYear = rs1.getInt("registerYear");
                userC.registerMonth = rs1.getInt("registerMonth");
                userC.registerDay = rs1.getInt("registerDay");
                userC.unregisterYear = rs1.getInt("unregisterYear");
                userC.unregisterMonth = rs1.getInt("unregisterMonth");
                userC.unregisterDay = rs1.getInt("unregisterDay");
                userC.rank = rs1.getInt("rank");
                userC.area = rs1.getString("area");
                users.add(userC);
            }
            rs1.close();
            stmt1.close();
            ps1.close();
            conn1.close();

            Connection conn2 = table.getConnection();
            String sql2 = "select * from provinceTable";
            PreparedStatement ps2 = (PreparedStatement) conn2.prepareStatement(sql2);
            Statement stmt2 = (Statement) conn2.createStatement();
            ResultSet rs2 = stmt2.executeQuery(sql2);
            while(rs2.next()){
                User userC = new User();
                userC.id = rs2.getInt("id");
                userC.account = rs2.getString("account");
                userC.accompanyName = rs2.getString("accompanyName");
                userC.password = rs2.getString("password");
                userC.usingCondition = rs2.getString("usingCondition");
                userC.registerYear = rs2.getInt("registerYear");
                userC.registerMonth = rs2.getInt("registerMonth");
                userC.registerDay = rs2.getInt("registerDay");
                userC.unregisterYear = rs2.getInt("unregisterYear");
                userC.unregisterMonth = rs2.getInt("unregisterMonth");
                userC.unregisterDay = rs2.getInt("unregisterDay");
                userC.rank = rs2.getInt("rank");
                userC.area = "山东省";
                users.add(userC);
            }
            rs2.close();
            stmt2.close();
            ps2.close();
            conn2.close();
        }else {

        }
    }else if (rank.equals("2")){
        users = new ArrayList<User>();
        userTable table = new userTable();
        cityTable table2 = new cityTable();
        table2.findById(Integer.parseInt(id), user);
        companyTable table1 = new companyTable();
        Connection conn = table.getConnection();
        String sql = "select * from userTable";
        PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
        Statement stmt = (Statement) conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        while(rs.next()){
            User userC = new User();
            userC.id = rs.getInt("id");
            userC.account = rs.getString("account");
            userC.accompanyName = rs.getString("accompanyName");
            userC.password = rs.getString("password");
            userC.usingCondition = rs.getString("usingCondition");
            userC.registerYear = rs.getInt("registerYear");
            userC.registerMonth = rs.getInt("registerMonth");
            userC.registerDay = rs.getInt("registerDay");
            userC.unregisterYear = rs.getInt("unregisterYear");
            userC.unregisterMonth = rs.getInt("unregisterMonth");
            userC.unregisterDay = rs.getInt("unregisterDay");
            userC.rank = rs.getInt("rank");
            Company company = new Company();
            company.id = userC.id;
            table1.findbyId(company);
            if (userC.rank == 1 && company.originalArea.equals(user.area)){
                users.add(userC);
            }
        }
        rs.close();
        stmt.close();
        ps.close();
        conn.close();

        Connection conn1 = table.getConnection();
        String sql1 = "select * from cityTable";
        PreparedStatement ps1 = (PreparedStatement) conn1.prepareStatement(sql1);
        Statement stmt1 = (Statement) conn1.createStatement();
        ResultSet rs1 = stmt1.executeQuery(sql1);
        while(rs1.next()){
            User userC = new User();
            userC.id = rs1.getInt("id");
            userC.account = rs1.getString("account");
            userC.accompanyName = rs1.getString("accompanyName");
            userC.password = rs1.getString("password");
            userC.usingCondition = rs1.getString("usingCondition");
            userC.registerYear = rs1.getInt("registerYear");
            userC.registerMonth = rs1.getInt("registerMonth");
            userC.registerDay = rs1.getInt("registerDay");
            userC.unregisterYear = rs1.getInt("unregisterYear");
            userC.unregisterMonth = rs1.getInt("unregisterMonth");
            userC.unregisterDay = rs1.getInt("unregisterDay");
            userC.rank = rs1.getInt("rank");
            userC.area = rs1.getString("area");
            if (userC.area.equals(user.area)){
                users.add(userC);
            }
        }
        rs1.close();
        stmt1.close();
        ps1.close();
        conn1.close();
    }else {

    }
%>



<table border="2" align="center" width="1000">
    <tr>
        <td>地区</td>
        <td>名称</td>
        <td>等级</td>
        <td>注册时间</td>
        <td>在线情况</td>
        <td>详细信息</td>
    </tr>
    <%
        for (User userC: users){
            String usingCondition = null, rank1 = null;
            if (userC.usingCondition.equals("online")){
                usingCondition = "在线";
            }else {
                usingCondition = "已注销";
            }
            if (userC.rank == 1){
                rank1 = "企业";
            }else if (userC.rank == 2){
                rank1 = "市";
            }else if (userC.rank == 3){
                rank1 = "省";
            }
    %>
    <tr>
        <td><%=userC.area%></td>
        <td><%=userC.accompanyName%></td>
        <td><%=rank1%></td>
        <td><%=userC.registerYear%>-<%=userC.registerMonth%>-<%=userC.registerDay%></td>
        <td><%=usingCondition%></td>
        <%
            if (userC.rank == 1){
        %>
        <td><a href="/province1.jsp?id=<%=userid%>&rank=<%=rank%>&companyid=<%=userC.id%>">查看</a></td>
        <%
        }else{%>
                <td></td>
        <%}%>
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
