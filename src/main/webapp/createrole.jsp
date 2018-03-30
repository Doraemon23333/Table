<%--
  Created by IntelliJ IDEA.
  User: 工业
  Date: 2018/3/30
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>创建角色</title>
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
        .RoleText{
            top: 20px;
            font-size: 30px;
            font-family: "微软雅黑 Light";
            text-align: center;
            color: #1e347b;
            position: relative;
            height: 50px;
        }
        .MyRole{
            top: 20px;
            font-size: 15px;
            font-family: "微软雅黑 Light";
            text-align: center;
            position: relative;
            height: 50px;
        }
    </style>
</head>

<div class="header-box">
    <div class="container">
        <a class="logo" ></a>
        <div class="header-tool mr30 pt15">
            <div class="top_test"><img src="images/top_test.gif" width="280" height="110" alt=""/></div>
        </div>
    </div>
</div>

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
        <li><a href="province2.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0">企业信息</a></li>
        <li><a href="province3.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0">岗位数据</a></li>
        <li><a href="allUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">系统管理</a></li>
        <li><a href="/com/springmvc/controller/BingtuServlet?id=<%=request.getParameter("id") %>&rank=<%=request.getParameter("rank")%>">取样分析</a></li>
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
                <li><a href="createrole.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">创建角色</a></li>
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
<form action="com/springmvc/controller/RegisterServlet?id=<%=request.getParameter("id")%>&rank=<%=rank%>&rank2=3" method="post">
    <div class="RoleText"><td>请选择您赋予的权限</td></div>
    <div class="MyRole">
        <td>默认密码：</td>
        <td><input type="password" id="password" name="password" value=""></td>

        <td>查询企业</td>
        <select class="SearchCompany" name="SearchCompany" id="sc" >
            <option value="0" >否</option>
            <option value="1" >是</option>
        </select>

        <td>&nbsp;&nbsp;&nbsp;&nbsp;查询数据</td>
        <select class="SearchData" name="SearchData" id="sd" >
            <option value="0" >否</option>
            <option value="1" >是</option>
        </select>

        <td>&nbsp;&nbsp;&nbsp;&nbsp;发布通知</td>
        <select class="CreateNews" name="CreateNews" id="cn" >
            <option value="0" >否</option>
            <option value="1" >是</option>
        </select>

        <td>&nbsp;&nbsp;&nbsp;&nbsp;设置调查期</td>
        <select class="SetDate" name="SetDate" id="sdate" >
            <option value="0" >否</option>
            <option value="1" >是</option>
        </select>

        <td>&nbsp;&nbsp;&nbsp;&nbsp;设置用户</td>
        <select class="SetRole" name="SetUser" id="sr" >
            <option value="0" >否</option>
            <option value="1" >是</option>
        </select>

        <td>&nbsp;&nbsp;&nbsp;&nbsp;系统监控</td>
        <select class="SetSystem" name="SetSystem" id="ss" >
            <option value="0" >否</option>
            <option value="1" >是</option>
        </select>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <button class="btn btn-primary">创建</button>
    </div>
</form>
</body>
</html>
