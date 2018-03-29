<%--
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
        <li><a href="bingtu.jsp?id=<%=request.getParameter("id") %>&rank=<%=request.getParameter("rank")%>">取样分析</a></li>
        <li><a href="trend.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" >趋势分析</a></li>
        <li><a href="/">退出</a></li>
    </ul>
</div>

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
                                    ['济南',100],
                                    ['青岛',101],
                                    ['烟台',99],
                                    ['威海',92],
                                    ['日照',80],
                                    ['菏泽',70],
                                    ['东营',60],
                                    ['潍坊',99],
                                    ['淄博',63],
                                    ['济宁',85],
                                    ['临沂',25],
                                    ['德州',29],
                                    ['滨州',75],
                                    ['泰安',25],
                                    ['枣庄',25],
                                    ['莱芜',22],
                                    ['聊城',45]
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
