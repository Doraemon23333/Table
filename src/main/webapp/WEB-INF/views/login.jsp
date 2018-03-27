<%--
  Created by IntelliJ IDEA.
  User: zfr
  Date: 2018/3/25
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <title>登录界面</title>
    <link rel="stylesheet" href="../../css/reset.css" type="text/css">
    <link rel="stylesheet" href="../../css/tool.css" type="text/css">
    <link rel="stylesheet" href="../../css/communal.css" type="text/css">
    <link rel="stylesheet" href="../../css/index.css" type="text/css">
    <link rel="stylesheet" href="../../css/index_3.8.css" type="text/css">
    <link rel="stylesheet" href="../../css/index_10.14.css" type="text/css">
    <script src="../../js/jquery-1.7.2.min.js"></script>
    <script src="../../js/jquery.placehold.min.js"></script>
    <script type="text/javascript" src="../../js/koala.min.1.5.js"></script>
    <style type="text/css">
        * {
            margin:0px 0px;
            padding:0px 0px;
            font-family:'微软雅黑','Microsoft Yahei',Arial, Helvetica, sans-serif;
        }
        body {
            margin:0 auto;
            padding:0px 0px;
        }
        a {
            color:#333;
            text-decoration: none;
            cursor: pointer;
            outline:none;
        }
        a:hover {
            text-decoration: none;
            color:#06F;
        }
        ul {
            list-style:none;
        }
        .float_l {
            float:left;
        }
        .float_r {
            float:right;
        }
        .clearfix:before, .clearfix:after {
            content: "";
            display: block;
        }
        .clearfix:after {
            clear: both;
        }
        .navbar {
            width:96%;
            margin:0 auto;
            vertical-align:middle;
            /*background-color:#1997ec;*/
        }
       /* .container {
            background-image:url(images/bg_5.jpg) ;
            height:500px;
            margin:0px auto;
            text-align:center;
        }*/
        .contain {
            width:980px;
            height:100%;
            margin:0 auto;
            padding:0px;
        }
        .footer {
            width:980px;
            margin:0 auto;
            font-size:12px;
            height:35px;
            line-height:35px;
        }

        .login {
            padding:1.5em 1.5em 1em;
            border-radius: 4px 4px 4px 4px;
            text-align:left;
            font-size:.875em;
            position:relative;

        }
        ul.login li {
            margin-bottom:5px;
        }
        /*----login tab---*/
        .margbt { margin-bottom:4px; color:white;}
        textarea, input[type="text"], input[type="password"], input[type="datetime"], input[type="datetime-local"], input[type="date"], input[type="month"], input[type="time"], input[type="week"], input[type="number"], input[type="email"], input[type="url"], input[type="search"], input[type="tel"], input[type="color"], .uneditable-input {
            background-color: rgb(255, 255, 255);
            border: 1px solid rgb(204, 204, 204);
            box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset;
            transition: border 0.2s linear 0s, box-shadow 0.2s linear 0s;
        }
        select, textarea, input[type="text"], input[type="password"], input[type="datetime"], input[type="datetime-local"], input[type="date"], input[type="month"], input[type="time"], input[type="week"], input[type="number"], input[type="email"], input[type="url"], input[type="search"], input[type="tel"], input[type="color"], .uneditable-input {
            display: inline-block;
            height: 24px;
            margin-bottom: 10px;
            font-size: 14px;
            line-height: 24px;
            color: rgb(36, 36, 36);
            border-radius: 3px;
            vertical-align: middle;
            padding: 4px 6px;
        }
        textarea:focus, input[type="text"]:focus, input[type="password"]:focus, input[type="datetime"]:focus, input[type="datetime-local"]:focus, input[type="date"]:focus, input[type="month"]:focus, input[type="time"]:focus, input[type="week"]:focus, input[type="number"]:focus, input[type="email"]:focus, input[type="url"]:focus, input[type="search"]:focus, input[type="tel"]:focus, input[type="color"]:focus, .uneditable-input:focus {
            border-color: rgba(82, 168, 236, 0.8);
            outline: 0px none;
            box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset, 0px 0px 8px rgba(82, 168, 236, 0.6);
        }
        .input input[type="text"], .input input[type="password"] { width:268px;}
        input[type="checkbox"] { vertical-align:middle; margin-top:-3px;}

        .login input[type='button'],input[type='submit'] {
            width:80px;
            border:0px solid #FFF;
            height:35px;
            color:#FFF;
            font-size:14px;
            background-image:none;
            background-clip:border-box;
            background-color:#3bb3e0;
            display:inline-block;
            background-attachment:scroll;
            background-repeat:repeat;
            background-position-x:0%;
            background-position-y:0%;
            border-top-left-radius:3px;
            border-top-right-radius:3px;
            border-bottom-left-radius:3px;
            border-bottom-right-radius:3px;
            cursor:pointer;
        }

        .login input[type='button']:hover,,input[type='submit']:hover {
                                               background-color:#3bb3e0;
                                           }

        .login a {
            width:80px;
            border:0px solid #FFF;
            height:35px;
            line-height:35px;
            text-align:center;
            color:#FFF;
            font-size:14px;
            background-image:none;
            background-clip:border-box;
            background-color:#3bb3e0;
            display:inline-block;
            background-attachment:scroll;
            background-repeat:repeat;
            background-position-x:0%;
            background-position-y:0%;
            border-top-left-radius:3px;
            border-top-right-radius:3px;
            border-bottom-left-radius:3px;
            border-bottom-right-radius:3px;
        }
        .login a:hover {
            background-color:#2482a5;
        }
        /*----login tab---*/
        /*.logo {
            background:url(images/logo2.jpg) no-repeat;
            height:60px;
            margin:15px 200px;
        }*/
        .waps{
            width:600px;
            text-align:center;
            line-height:28px;
            font-size:12px;
            font-family:Arial, Helvetica, sans-serif;
            margin-top:100px;
            color:#fff;
            text-align:left;
            border:1px solid #CCC;
            border-radius: 4px 4px 4px 4px;
            padding:5px 5px;
        }
        .con{
            text-align:left;
            width:600px;
            margin:0px auto;
            background:rgba(255, 255, 255, 0.8) none repeat scroll 0 0 !important;/*实现FF背景透明，文字不透明*/
            filter:Alpha(opacity=80);
            background:#fff;/*实现IE背景透明*/
            border-radius: 4px 4px 4px 4px;
        }
        .con p{
            position:relative;
            padding:5px 10px;
            color:black;
        }/*实现IE文字不透明*/
    </style>
</head>
<body>
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
            <div class="top_test"><img src="../../images/top_test.gif" width="280" height="110" alt=""/></div>
        </div>
    </div>
</div>
<!--header end-->
<%! String userid = null;%>
<%
    String id = request.getParameter("id");
    userid = id;
%>
<!--nav start-->
<!--
<div class="nav-box">

</div>-->


<div class="index-main index_box pt15">


    <!--切换新闻 start-->
    <div class="index-header">
        <div class="contain clearfix">
            <div class="float_l waps" style="margin-top:60px; width:600px; color:white; text-align:left; font-size:13px; border:1px solid #CCC; border-radius: 4px 4px 4px 4px; padding:10px 10px;">
                <div class="con">
                    <p>
                        <a href="http://10.0.0.54:8800/news" target='_blank'>通知列表：</a>
                        <br>注意：
                        <br>1、企业用户登录时
                        <br>2、市用户登录时
                        <br>3、省用户登录时
                        <br>4、管理员登录时
                    </p>
                </div>
            </div>
            <div class="float_r" style="margin-top: 60px;">
                <form action="/com/springmvc/controller/LoginServlet" method="post">
                    <ul class="login">
                        <li><p class="margbt">用户账号/user</p>
                            <div >
                                <input type="text" name="account" size="35" value="" >
                            </div>
                        </li>
                        <li>
                            <p class="margbt">密码/password</p>
                            <div >
                                <input type="password" name="password" size="35" value="">
                            </div>
                        </li>
                        <li>
                            <p class="margbt">角色/role</p>
                                <select name="rank" id="rank">
                                    <option value="1">企业</option>
                                    <option value="2">市</option>
                                    <option value="3">省</option>
                                </select>
                        </li>
                        <li class="margin">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr valign="middle">
                                    <td width="100" align="center">
                                        <input class="a a_demo_three" type="submit" value="登录"/>
                                    </td>
                                </tr>
                            </table>
                        </li>
                    </ul>
                </form>
            </div>
        </div>
    </div>
</div>
<!--footer start-->
<link rel="stylesheet" href="/css/nav.css?var=123456789" type="text/css">
<script type="text/javascript">
    $(document).ready(function() {


        //导航
        $(".mainProNav dl dt").click(function() {
            $(".mainProNav dl").removeClass("dlHover");
            $(this).parent().addClass("dlHover");
            $("#of_whole").removeClass("of_whole2");
            $("#of_whole").addClass("of_whole");
        })
        $(".mainProNav").hover(function() {
            $(this).addClass("mainProNavHover");
        },function() {
            $(this).removeClass("mainProNavHover");
            $(".mainProNav dl").removeClass("dlHover");
            $("#of_whole").removeClass("of_whole");
            $("#of_whole").addClass("of_whole2");
        })

    });

</script>
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

<script>
    function searchsy(){
        var searchContent=document.getElementById("serachAllsy").value;
        window.location.href='/includes/search_all.html?title='+escape(searchContent);
    }
    function search2(e){
        window.location.href='/includes/search_all.html?title='+escape(e);
    }
</script>
<script src="../../js/switchable.js"></script>
<script src="../../js/forweb.js"></script>
<script src="../../js/sdrs.js"></script>
<script src="../../js/title.js"></script>
<!--footer end-->
</body>

</html>

