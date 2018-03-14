<%--
  Created by IntelliJ IDEA.
  User: cheyl
  Date: 2018/3/13 0013
  Time: 16:17
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
        <li><a href="companyhome.jsp?id=<%=request.getParameter("id")%>">首页</a></li>
        <li><a href="companyRecordInfo.jsp?id=<%=request.getParameter("id")%>">备案信息</a></li>
        <li><a href="companyDataInsert.jsp?id=<%=request.getParameter("id")%>">数据填报</a></li>
        <li><a href="/">数据查询</a></li>
        <li><a href="/">退出</a></li>
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
                                    <input type="text" id="owned" name="owned" value="提交后不可修改" onfocus="javascript:if(this.value=='提交后不可修改')this.value='';"/>
                                    <b class="red">*为必填</b>
                                </td>
                            </tr>

                            <tr class="">
                                <td>组织机构代码（只可输入字母、数字，不超过9位）：</td>
                                <td>
                                    <input type="text" id="number" name="number" value="" />
                                    <b class="red">*</b>
                                </td>
                            </tr>

                            <tr class="">
                                <td>企业名称（中文或英文）：</td>
                                <td>
                                    <input type="text" id="telNum" name="companyName" value="" />
                                    <b class="red">*</b>
                                </td>
                            </tr>
                            <tr class="">

                                <td>企业性质：</td>
                                <td>
                                    <select name="property" id="property" >
                                        <option value="国有" >国有企业</option>
                                        <option value="私有" >私有企业</option>
                                    </select>
                                    <b class="red">*</b></td>

                            </tr>
                            <tr class="">
                                <td>所属行业：</td>
                                <td>
                                    <select name="industry" id="industry" >
                                        <option value="制造业" >制造业</option>
                                        <option value="服务业" >服务业</option>
                                    </select>
                                    <b class="red">*</b></td>
                            </tr>
                            <tr class="">

                                <td>主要经营业务：</td>
                                <td>
                                    <input type="text" id="email" name="email" value="按实际情况填写" onfocus="javascript:if(this.value=='按实际情况填写')this.value='';" />
                                    <b class="red">*</b></td>
                            </tr>

                            <tr class="">

                                <td><b class="blue">联系方式</b></td>
                                <td></td>

                            </tr>
                            <tr class="">

                                <td>联系人(中文或英文）：</td>
                                <td>
                                    <input type="text" id="etsScore" name="contactName"/>
                                    <b class="red">*</b></td>
                            </tr>

                            <tr class="">

                                <td>联系地址：</td>
                                <td>
                                    <select name="place" id="place" >
                                        <option value="济南" >济南</option>
                                        <option value="青岛" >青岛</option>
                                        <option value="烟台">烟台</option>
                                    </select>
                                    <b class="red">*</b></td>
                            </tr>
                            <tr class="">

                                <td>邮政编码：</td>
                                <td><input type="text" name="postalcode" value="只可填写6位数字" id="postalcode" onfocus="javascript:if(this.value=='只可填写6位数字')this.value='';">
                                    <b class="red">*</b></td>
                            </tr>

                            <tr class="">

                            <td>联系电话：</td>
                            <td><input type="text" name="telephone" value="格式为手机号码或区号+电话" id="telephone" onfocus="javascript:if(this.value=='格式为手机号码或区号+电话')this.value='';">
                                <b class="red">*</b></td>
                            </tr>
                            <tr class="">

                                <td>传真：</td>
                                <td><input type="text" name="fax" value="格式为区号+电话" id="fax" onfocus="javascript:if(this.value=='格式为区号+电话')this.value='';">
                                    <b class="red">*</b></td>
                            </tr>
                            <tr class="">

                                <td>电子邮箱：</td>
                                <td><input type="text" name="email" value="格式为xxx@xxx.xxx" id="mail" onfocus="javascript:if(this.value=='格式为xxx@xxx.xxx')this.value='';">
                                    </td>
                            </tr>

                        </table>



                        <div class="form-actions">

                            <button type="submit" class="btn btn-primary">
                                更新
                            </button>
                        </div>
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
