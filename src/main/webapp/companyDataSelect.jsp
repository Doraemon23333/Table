<%--
  Created by IntelliJ IDEA.
  User: cheyl
  Date: 2018/3/14 0014
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>企业数据查询</title>
    <meta name="description" content="This is page-header (.page-header &amp;gt; h1)"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script src="js/companyRecordInfo.js" type="text/javascript" ></script>
    <link href="css/companyRecordInfo.css" type="text/css" rel="stylesheet" media="screen, projection" />
    <!--<link href="css/companyRecord2.css" type="text/css" rel="stylesheet" media="screen, projection" />
    <link href="css/companyRecord3.css" type="text/css" rel="stylesheet" media="screen, projection" />-->
    <link href="css/companyRecord4.css" type="text/css" rel="stylesheet" media="screen, projection" />

    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/tool.css" type="text/css">
    <link rel="stylesheet" href="css/communal.css" type="text/css">
    <link rel="stylesheet" href="css/index.css" type="text/css">
    <link rel="stylesheet" href="css/index_3.8.css" type="text/css">
    <link rel="stylesheet" href="css/index_10.14.css" type="text/css">
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/jquery.placehold.min.js"></script>
    <script type="text/javascript" src="js/koala.min.1.5.js"></script>
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
        <li><a href="companyhome.jsp?id=<%=request.getParameter("id")%>">首页</a></li>
        <li><a href="companyRecordInfo.jsp?id=<%=request.getParameter("id")%>">备案信息</a></li>
        <li><a href="companyDataInsert.jsp?id=<%=request.getParameter("id")%>">数据填报</a></li>
        <li><a href="companyDataSelect.jsp?id=<%=request.getParameter("id")%>">数据查询</a></li>
        <li><a href="/">退出</a></li>
    </ul>
</div>
<!--nav end-->

<div class="main-container container no-sidebar">
    <div class="main-content">
        <div class="page-content">
            <div class="row-fluid">
                <!--PAGE CONTENT BEGINS HERE-->
                <div class="content">
                    <!--<div class="hr dotted"></div>-->
                    <form action="" method="post" class="form-horizontal" >

                        <table class="table table-striped">

                            <tr class="">
                                <td><b>选择调查期：</b></td>
                                <td>
                                    <input type="date" id="inspectTime" name="inspectTime" value="2018-03-15"
                                    style="height:30px;"/>
                                </td>
                            </tr>
                            <!--数据查询输出什么形式？-->

                        </table>
                    </form>
                </div>
                <!--PAGE CONTENT ENDS HERE-->
            </div><!--/row-->
        </div><!--/#page-content-->

    </div><!--/#main-content-->
</div><!--/.fluid-container#main-container-->
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
<!--<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
    返回顶部
</a>-->

<script src="js/companyJs0.js" type="text/javascript" ></script>
<script src="js/companyJs1.js" type="text/javascript" ></script>
<script src="js/companyJs2.js" type="text/javascript" ></script>
<script src="js/companyJs3.js" type="text/javascript" ></script>

</body>
</html>
