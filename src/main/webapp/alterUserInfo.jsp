<%--
  Created by IntelliJ IDEA.
  User: cheyl
  Date: 2018/3/18 0018
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户信息</title>

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
<div class="nav-box">
    <ul class="container nav">
        <li><a href="provincehome.jsp?id=<%=request.getParameter("id")%>">首页</a></li>
        <li><a href="province2.jsp?id=<%=request.getParameter("id")%>">企业信息</a></li>
        <li><a href="/">岗位数据</a></li>
        <li><a href="/" >系统管理</a></li>
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
                <li><a href="systemNewTime.jsp">新增调查期</a></li>
                <li><a href="systemAlterTime.jsp">修改调查期</a></li>
            </ul>
        </li>
        <li>
            <div class="link">用户管理</div>
            <ul class="submenu">
                <li><a href="allUserInfo.jsp">所有用户信息</a></li>
                <li><a href="newUserInfo.jsp">新增用户信息</a></li>
                <li><a href="deleteUserInfo.jsp">删除用户信息</a></li>
                <li><a href="alterUserInfo.jsp">修改用户信息</a></li>
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
                <li><a href="systemInfo.jsp">系统信息</a></li>
                <li><a href="systemOnlineInfo.jsp">当前使用情况</a></li>
            </ul>
        </li>
    </ul>
</div>
<script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>
<script src="js/systemNav.js"></script>
<!--leftnav end-->

<div class="div2">
    <table>
        <tr>
            <td style="color: #0e90d2">修改前：</td>
        </tr>
        <tr>
            <td>用户名：</td>
            <td><input type="text" id="beforename" value=""></td>
            <td><button style="
            text-align: center;color: #ffffff;background-color: #0e90d2;">查询</button></td>
        </tr>
        <tr>
            <!--返回信息-->
        </tr>
        <tr>
            <td style="color: #0e90d2">修改后：</td>
        </tr>
        <tr>
            <td>用户名：</td>
            <td><input type="text" id="aftername" value=""></td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input type="text" id="afterpwd" value=""></td>
        </tr>
        <tr>
            <td>企业代号：</td>
            <td><input type="text" id="afterid" value=""></td>
        </tr>
    </table>
    <div class="form-actions" style="margin: 20px 100px ;">

        <button type="submit" class="btn btn-primary">
            修改
        </button>
    </div>
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
