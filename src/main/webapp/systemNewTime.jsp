<%@ page import="java.util.Calendar" %>
<%@ page import="com.springmvc.entity.Investigation" %>
<%@ page import="com.springmvc.service.InvestigationTable" %><%--
  Created by IntelliJ IDEA.
  User: cheyl
  Date: 2018/3/15 0015
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>系统管理-上报时限</title>
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
    Calendar c = Calendar.getInstance();
    int year = c.get(Calendar.YEAR);
    int month = c.get(Calendar.MONTH);
    month++;
    int day = c.get(Calendar.DAY_OF_MONTH);
    String year1= String.valueOf(year);
    if (year1.length() < 4){
        for (; year1.length() < 4;){
            year1 = "0" + year1;
        }
    }
    String month1 = String.valueOf(month);
    if (month1.length() < 2){
        for (; month1.length() < 2;){
            month1 = "0" + month1;
        }
    }
    String day1 = String.valueOf(day);
    if (day1.length() < 2){
        for (; day1.length() < 2;){
            day1 = "0" + day1;
        }
    }

%>
<form method="post" action="/com/springmvc/controller/SetInvestigationServlet?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">
<div class="div2">
    <table>
        <tr>
            <td>新增一个调查期(标准时间格式yyyy-mm-dd)：</td>
        </tr>
        <tr>
            <td>开始时间：</td>
            <td><input type="date" value="<%=year1%>-<%=month1%>-<%=day1%>" name="begin"></td>
        </tr>
        <tr>
            <td>结束时间：</td>
            <td><input type="date" value="<%=year1%>-<%=month1%>-<%=day1%>" name="end"></td>
        </tr>
    </table>
    <div class="form-actions" style="margin: 20px 100px ;">

        <button type="submit" class="btn btn-primary">
            增加
        </button>
    </div>
</div>
</form>

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
