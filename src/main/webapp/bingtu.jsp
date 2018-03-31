<%@ page import="com.springmvc.service.RoleTable" %>
<%@ page import="com.springmvc.entity.Role" %>
<%@ page import="com.springmvc.service.provinceTable" %>
<%@ page import="com.springmvc.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: zfr
  Date: 2018/3/26
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>取样分析</title>

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
    <script src="js/highcharts.js"></script>
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

<div class="nav-box">
    <ul class="container nav">
        <li><a href="provincehome.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">首页</a></li>
        <li><a href="province2.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0">企业信息</a></li>
        <li><a href="province3.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0">岗位数据</a></li>
        <li><a href="allUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" >系统管理</a></li>
        <li><a href="/com/springmvc/controller/BingtuServlet?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">取样分析</a></li>
        <li><a href="trend.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0" >趋势分析</a></li>
        <li><a href="/compareAnalysis.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" >对比分析</a></li>
        <li><a href="/">退出</a></li>
    </ul>
</div>
<%
    if (request.getParameter("rank").equals("3")){
        int c0531 = Integer.parseInt(request.getParameter("c0531"));
        int c0532 = Integer.parseInt(request.getParameter("c0532"));
        int c0533 = Integer.parseInt(request.getParameter("c0533"));
        int c0534 = Integer.parseInt(request.getParameter("c0534"));
        int c0535 = Integer.parseInt(request.getParameter("c0535"));
        int c0536 = Integer.parseInt(request.getParameter("c0536"));
        int c0537 = Integer.parseInt(request.getParameter("c0537"));
        int c0538 = Integer.parseInt(request.getParameter("c0538"));
        int c0539 = Integer.parseInt(request.getParameter("c0539"));
        int c0530 = Integer.parseInt(request.getParameter("c0530"));
        int c0543 = Integer.parseInt(request.getParameter("c0543"));
        int c0546 = Integer.parseInt(request.getParameter("c0546"));
        int c0631 = Integer.parseInt(request.getParameter("c0631"));
        int c0632 = Integer.parseInt(request.getParameter("c0632"));
        int c0633 = Integer.parseInt(request.getParameter("c0633"));
        int c0634 = Integer.parseInt(request.getParameter("c0634"));
        int c0635 = Integer.parseInt(request.getParameter("c0635"));
        int cOther = Integer.parseInt(request.getParameter("cOther"));
%>
<div class="main-container container no-sidebar">
    <div class="main-content">

        <div class="page-content">
            <div class="row-fluid">
                <!--PAGE CONTENT BEGINS HERE-->
                <div class="content">
                    <div>

                    </div>
                    <div id="container" style="width: 550px; height: 400px; margin: 0 auto"></div>
                    <script language="JavaScript">
                        $(document).ready(function() {
                            var chart = {
                                plotBackgroundColor: null,
                                plotBorderWidth: null,
                                plotShadow: false
                            };
                            var title = {
                                text: '各市企业的数量和占比'
                            };
                            var tooltip = {
                                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                            };
                            var plotOptions = {
                                pie: {
                                    allowPointSelect: true,
                                    cursor: 'pointer',
                                    dataLabels: {
                                        enabled: true,
                                        format: '<b>{point.name}</b>: {point.y},{point.percentage:.1f}%',
                                        style: {
                                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                        }
                                    }
                                }
                            };
                            var series= [{
                                type: 'pie',
                                name: 'Browser share',
                                data: [
                                    ['济南',<%=c0531%>],
                                    ['青岛',<%=c0532%>],
                                    ['烟台',<%=c0533%>],
                                    ['威海',<%=c0534%>],
                                    ['日照',<%=c0535%>],
                                    ['菏泽',<%=c0536%>],
                                    ['东营',<%=c0537%>],
                                    ['潍坊',<%=c0538%>],
                                    ['淄博',<%=c0539%>],
                                    ['济宁',<%=c0530%>],
                                    ['临沂',<%=c0543%>],
                                    ['德州',<%=c0546%>],
                                    ['滨州',<%=c0631%>],
                                    ['泰安',<%=c0632%>],
                                    ['枣庄',<%=c0633%>],
                                    ['莱芜',<%=c0634%>],
                                    ['聊城',<%=c0635%>],
                                    ['其他',<%=cOther%>]
                                ]
                            }];

                            var json = {};
                            json.chart = chart;
                            json.title = title;
                            json.tooltip = tooltip;
                            json.series = series;
                            json.plotOptions = plotOptions;
                            $('#container').highcharts(json);
                        });
                    </script>
                    <!--<div class="hr dotted"></div>-->
                </div>
                <!--PAGE CONTENT ENDS HERE-->
            </div><!--/row-->
        </div><!--/#page-content-->

    </div><!--/#main-content-->
</div><!--/.fluid-container#main-container-->
    <%}else if (request.getParameter("rank").equals("2")){
        int gyqy = Integer.parseInt(request.getParameter("gyqy"));
        int jtqy = Integer.parseInt(request.getParameter("jtqy"));
        int lyqy = Integer.parseInt(request.getParameter("lyqy"));
        int gfhzzqy = Integer.parseInt(request.getParameter("gfhzzqy"));
        int syqy = Integer.parseInt(request.getParameter("syqy"));
        int gth = Integer.parseInt(request.getParameter("gth"));
        int hzqy = Integer.parseInt(request.getParameter("hzqy"));
        int yxhzgs = Integer.parseInt(request.getParameter("yxhzgs"));
    %>
<div class="main-container container no-sidebar">
    <div class="main-content">

        <div class="page-content">
            <div class="row-fluid">
                <!--PAGE CONTENT BEGINS HERE-->
                <div class="content">
                    <div>

                    </div>
                    <div id="container" style="width: 550px; height: 400px; margin: 0 auto"></div>
                    <script language="JavaScript">
                        $(document).ready(function() {
                            var chart = {
                                plotBackgroundColor: null,
                                plotBorderWidth: null,
                                plotShadow: false
                            };
                            var title = {
                                text: '各市企业的数量和占比'
                            };
                            var tooltip = {
                                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                            };
                            var plotOptions = {
                                pie: {
                                    allowPointSelect: true,
                                    cursor: 'pointer',
                                    dataLabels: {
                                        enabled: true,
                                        format: '<b>{point.name}</b>: {point.y},{point.percentage:.1f}%',
                                        style: {
                                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                        }
                                    }
                                }
                            };
                            var series= [{
                                type: 'pie',
                                name: 'Browser share',
                                data: [
                                    ['国有企业',<%=gyqy%>],
                                    ['集体企业',<%=jtqy%>],
                                    ['联营企业',<%=lyqy%>],
                                    ['股份合作制企业',<%=gfhzzqy%>],
                                    ['私营企业',<%=syqy%>],
                                    ['个体户',<%=gth%>],
                                    ['合伙企业',<%=hzqy%>],
                                    ['有限责任公司',<%=yxhzgs%>]
                                ]
                            }];

                            var json = {};
                            json.chart = chart;
                            json.title = title;
                            json.tooltip = tooltip;
                            json.series = series;
                            json.plotOptions = plotOptions;
                            $('#container').highcharts(json);
                        });
                    </script>
                    <!--<div class="hr dotted"></div>-->
                </div>
                <!--PAGE CONTENT ENDS HERE-->
            </div><!--/row-->
        </div><!--/#page-content-->

    </div><!--/#main-content-->
</div><!--/.fluid-container#main-container-->
    <%}
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
