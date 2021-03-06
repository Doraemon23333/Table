<%@ page import="com.springmvc.service.browserTable" %>
<%@ page import="com.springmvc.entity.Browser" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.springmvc.service.userTable" %>
<%@ page import="com.springmvc.entity.User" %>
<%@ page import="com.springmvc.service.cityTable" %>
<%@ page import="com.springmvc.service.provinceTable" %>
<%@ page import="java.util.Collections" %><%--
  Created by IntelliJ IDEA.
  User: cheyl
  Date: 2018/3/18 0018
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>系统信息</title>

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
    int rank = 0;
    String userid = null;
%>
<%
    String id = request.getParameter("id");
    userid = id;
    String a = request.getParameter("rank");
    rank = Integer.parseInt(a);
%>
<div class="nav-box">
    <ul class="container nav">
        <li><a href="provincehome.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>">首页</a></li>
        <li><a href="province2.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>&choose=0">企业信息</a></li>
        <li><a href="province3.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0">岗位数据</a></li>
        <li><a href="allUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>" >系统管理</a></li>
        <li><a href="/com/springmvc/controller/BingtuServlet?id=<%=request.getParameter("id") %>&rank=<%=request.getParameter("rank")%>">取样分析</a></li>
        <li><a href="trend.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0" >趋势分析</a></li>
        <li><a href="compareAnalysis.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0" >对比分析</a></li>
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
                <li><a href="systemNewTime.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>">新增调查期</a></li>
                <li><a href="systemAlterTime.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>">修改调查期</a></li>
            </ul>
        </li>
        <li>
            <div class="link">用户管理</div>
            <ul class="submenu">
                <li><a href="allUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>">所有用户信息</a></li>
                <li><a href="newUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>">新增用户信息</a></li>
                <li><a href="deleteUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>">删除用户信息</a></li>
                <li><a href="alterUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>&choose=0">修改用户信息</a></li>
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
                <li><a href="systemInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>">系统信息</a></li>
                <li><a href="systemOnlineInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>">当前使用情况</a></li>
            </ul>
        </li>
    </ul>
</div>
<script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>
<script src="js/systemNav.js"></script>
<!--leftnav end-->
<%
    browserTable table = new browserTable();
    List<Browser> browsers = new ArrayList<Browser>();
    table.find(browsers);
%>
<table border="2" align="center" width="1000">
    <tr>
        <td>名称</td>
        <td>用户等级</td>
        <td>时间</td>
        <td>内容</td>
    </tr>
<%
    if (rank == 3){
    Collections.reverse(browsers);
    for (Browser browser: browsers){
        String name = null, time = null, rank = null;
        if (browser.rank == 1){
            rank = "企业";
            time = browser.broswerYear + "-" + browser.broswerMonth + "-" + browser.broswerDay;
            userTable table1 = new userTable();
            User user = new User();
            table1.findById(browser.id, user);
            name = user.accompanyName;
        }else if (browser.rank == 2){
            rank = "市";
            time = browser.broswerYear + "-" + browser.broswerMonth + "-" + browser.broswerDay;
            cityTable table1 = new cityTable();
            User user = new User();
            table1.findById(browser.id, user);
            name = user.accompanyName;
        }else if (browser.rank == 3){
            rank = "省";
            time = browser.broswerYear + "-" + browser.broswerMonth + "-" + browser.broswerDay;
            provinceTable table1 = new provinceTable();
            User user = new User();
            table1.findById(browser.id, user);
            name = user.accompanyName;
        }%>
    <tr>
        <td><%=name%></td>
        <td><%=rank%></td>
        <td><%=time%></td>
        <td><%=browser.content%></td>
    </tr>
    <%
    }}else {
        out.print("您没有权限查看系统日志");
    }
%>
</table>
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
