<%--
  Created by IntelliJ IDEA.
  User: 工业
  Date: 2018/3/15
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>企业备案信息</title>

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
<%! String userid = null;%>
<%
    String id = request.getParameter("id");
    userid = id;
%>
<div class="nav-box">
    <ul class="container nav">
        <li><a href="provincehome.jsp">首页</a></li>
        <li><a href="province1.jsp">企业信息</a></li>
        <li><a href="/">岗位数据</a></li>
        <li><a href="/" >系统管理</a></li>
    </ul>
</div>

<div class="main-container container no-sidebar">
    <div class="main-content">

        <div class="page-content">
            <div class="row-fluid">
                <!--PAGE CONTENT BEGINS HERE-->
                <div class="content">

                    <!--<div class="hr dotted"></div>-->
                    <form action="/com/springmvc/controller/CompanyDataServlet" method="post" class="form-horizontal" >

                        <input type="hidden" name="version" value="0" id="version" />
                        <table class="table table-striped">
                            <tr class="">

                                <td><b class="blue">基本信息</b></td>
                                <td></td>
                            </tr>

                            <tr class="">
                                <td>所属地市、市县、区域：</td>
                                <td>
                                    **********
                                </td>
                            </tr>

                            <tr class="">
                                <td>组织机构代码（只可输入字母、数字，不超过9位）：</td>
                                <td>
                                    **********
                                </td>
                            </tr>

                            <tr class="">
                                <td>企业名称（中文或英文）：</td>
                                <td>
                                    ************
                                </td>
                            </tr>
                            <tr class="">
                                <td>企业性质：</td>
                                <td>***********</td>
                            </tr>
                            <tr class="">
                                <td>所属行业：</td>
                                <td>
                                    ************</td>
                            </tr>
                            <tr class="">

                                <td>主要经营业务：</td>
                                <td>
                                    ************</td>
                            </tr>

                            <tr class="">

                                <td><b class="blue">联系方式</b></td>
                                <td>*************</td>

                            </tr>
                            <tr class="">

                                <td>联系人(中文或英文）：</td>
                                <td>
                                    **************</td>
                            </tr>

                            <tr class="">

                                <td>联系地址：</td>
                                <td>************</td>
                            </tr>
                            <tr class="">

                                <td>邮政编码：</td>
                                <td>***************</td>
                            </tr>

                            <tr class="">

                                <td>联系电话：</td>
                                <td>***************</td>
                            </tr>
                            <tr class="">

                                <td>传真：</td>
                                <td>**************</td>
                            </tr>
                            <tr class="">

                                <td>电子邮箱：</td>
                                <td>************</td>
                            </tr>

                        </table>
                    </form>
                </div>
                <!--PAGE CONTENT ENDS HERE-->
            </div><!--/row-->
        </div><!--/#page-content-->

    </div><!--/#main-content-->
</div><!--/.fluid-container#main-container-->

<%

%>

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

