<%@ page import="com.springmvc.entity.Role" %>
<%@ page import="java.util.List" %>
<%@ page import="com.springmvc.service.RoleTable" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 工业
  Date: 2018/3/24
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>角色管理</title>
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
    <style>
        .mytitle{
            font-size: 20px;
            font-family: 华文宋体;
            color:#0b6cbc;
            position: relative;
            left: 30px;
            top:20px;
        }


    </style>
</head>
<!--header start-->
<script>
    function search(){
        var searchContent=document.getElementById("serachAll").value;
        window.location.href='/includes/search_all.html?title='+escape(searchContent);
    }
    function search2(e){
        window.location.href='/includes/search_all.html?title='+escape(e);
    }
</script>
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
    String userid = null;
    int rank = 0;
%>
<%
    String id = request.getParameter("id");
    userid = id;
    String a = request.getParameter("rank");
    rank = Integer.parseInt(a);
%>
<div class="nav-box">
    <ul class="container nav">
        <li><a href="provincehome.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">首页</a></li>
        <li><a href="province2.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">企业信息</a></li>
        <li><a href="province3.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0">岗位数据</a></li>
        <li><a href="allUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">系统管理</a></li>
        <li><a href="bingtu.jsp?id=<%=request.getParameter("id") %>&rank=<%=request.getParameter("rank")%>">取样分析</a></li>
        <li><a href="trend.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" >趋势分析</a></li>
        <li><a href="/">退出</a></li>
    </ul>
</div>
<!--nav end-->
<!--leftnav start-->
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


<body>
    <div>
        <ul class="mytitle">企业角色</ul>
        <ul class="mytitle">市角色</ul>
        <ul class="mytitle">省角色</ul>
        <%
            RoleTable table = new RoleTable();
            List<Role> RoleList = new ArrayList<Role>();
            String sql = "SELECT * FROM roletable where rank = 3 ";
            System.out.println(sql);
        try{
            Connection conn = table.getConnection();
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
            Statement stmt = (Statement) conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()){
            Role myrole = new Role();
            myrole.RoleNum = rs.getInt("RoleNum");
            myrole.SearchCompany=rs.getInt("SearchCompany");
            myrole.SearchData=rs.getInt("SearchData");
            myrole.SetDate=rs.getInt("SetDate");
            myrole.SetRole=rs.getInt("SetRole");
            myrole.SetSystem=rs.getInt("SetSystem");
            myrole.SetUser=rs.getInt("SetUser");
            myrole.CreateNews=rs.getInt("CreateNews");
            myrole.ifroot = rs.getInt("ifroot");
            myrole.id = rs.getInt("id");
            RoleList.add(myrole);
            }
        %>
            <table border="2" align="center" width="1000">
                    <tr>
                        <td>角色编号</td>
                        <td>查询企业</td>
                        <td>查询数据</td>
                        <td>发布通知</td>
                        <td>设置调查期</td>
                        <td>设置角色</td>
                        <td>系统监控</td>
                        <td>用户管理</td>
                    </tr>
            <%
                for (Role myrole:RoleList){
            %>
            <tr>
                <td><%=myrole.RoleNum%></td>
                <td><%=myrole.SearchCompany%></td>
                <td><%=myrole.SearchData%></td>
                <td><%=myrole.CreateNews%></td>
                <td><%=myrole.SetDate%></td>
                <td><%=myrole.SetRole%></td>
                <td><%=myrole.SetSystem%></td>
                <td><%=myrole.SetUser%></td>
            </tr>
                <%}%>
        </table>
        <%
            }catch (Exception e){
            e.printStackTrace();
            }
        %>
    </div>
</body>
</html>