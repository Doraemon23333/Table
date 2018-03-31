<%--
  Created by IntelliJ IDEA.
  User: cheyl
  Date: 2018/3/28 0028
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>对比分析</title>

    <meta name="description" content="This is page-header (.page-header &amp;gt; h1)"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script src="js/companyRecordInfo.js" type="text/javascript" ></script>
    <link href="css/companyRecordInfo.css" type="text/css" rel="stylesheet" media="screen, projection" />

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
        <li><a href="/com/springmvc/controller/BingtuServlet?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" >取样分析</a></li>
        <li><a href="/com/springmvc/controller/TrendServlet?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" >趋势分析</a></li>
        <li><a href="compareAnalysis.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" >对比分析</a></li>
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
                        <table>
                            <tr>
                                <td>请输入第一个调查期：</td>
                                <td><input style="width: 150px;" type="date" value="">-<input style="width: 150px;" type="date" value=""></td>
                            </tr>
                            <tr>
                                <td>请输入第二个调查期：</td>
                                <td><input style="width: 150px;" type="date" value="">-<input style="width: 150px;" type="date" value=""></td>
                            </tr>
                            <tr>
                                <td>请选择分析方式：</td>
                                <td>
                                    <select  style="width: 100px" name="analyze" id="analyze">
                                        <option value="地区">地区</option>
                                        <option value="企业性质">企业性质</option>
                                        <option value="行业">行业</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>请选择分析指标：</td>
                                <td>
                                    <select  style="width: 170px" name="property" id="property">
                                        <option value="企业总数">企业总数</option>
                                        <option value="建档期总岗位数">建档期总岗位数</option>
                                        <option value="调查期总岗位数">调查期总岗位数</option>
                                        <option value="岗位变化总数">岗位变化总数</option>
                                        <option value="岗位减少总数">岗位减少总数</option>
                                        <option value="岗位变化数量占比">岗位变化数量占比</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        <button type="submit" >确认</button>
                    </div>
                    <div style="margin: 20px 0 20px 0">
                        <!--展示一个这个时间段内所有调查期的岗位就业人数数据的列表，例如-->
                        <table border="1" width="600px" style="text-align: center;">
                            <!--此行为选择的分析方式-->
                            <!--通过设置-->
                            <!--<tr>
                                <td>济南</td>
                                <td>青岛</td>
                                <td>烟台</td>
                                <td>淄博</td>
                                <td>德州</td>
                                <td>潍坊</td>
                                <td>济宁</td>
                                <td>泰安</td>
                                <td>临沂</td>
                                <td>菏泽</td>
                                <td>滨州</td>
                                <td>东营</td>
                                <td>威海</td>
                                <td>枣庄</td>
                                <td>日照</td>
                                <td>莱芜</td>
                                <td>聊城</td>
                            </tr>

                            <tr>
                                <td> 国有企业</td>
                                <td>集体企业</td>
                                <td>联营企业</td>
                                <td>股份合作制企业</td>
                                <td>私营企业</td>
                                <td>个体户</td>
                                <td>合伙企业</td>
                                <td>有限责任公司</td>
                                <td>股份有限公司</td>
                            </tr>
                            <tr>
                                <td>制造业</td>
                                <td>服务业</td>
                            </tr>-->

                            <tr>
                                <td></td>
                                <td>3月1日-3月29日</td>
                                <td>4月1日-4月28日</td>
                            </tr>
                            <tr>
                                <td>制造业</td>
                                <td>10000</td>
                                <td>12000</td>
                            </tr>
                            <tr>
                                <td>服务业</td>
                                <td>100000</td>
                                <td>129000</td>
                            </tr>
                            <!--<tr>
                                <td>调查期总岗位数</td>
                                <td>1200</td>
                                <td>1400</td>
                            </tr>
                            <tr>
                                <td>岗位变化总数</td>
                                <td>200</td>
                                <td>110</td>
                            </tr>
                            <tr>
                                <td>岗位减少总数</td>
                                <td>7.0%</td>
                                <td>6.9%</td>
                            </tr>
                            <tr>
                                <td>岗位变化数量占比</td>
                                <td>7.0%</td>
                                <td>6.9%</td>
                            </tr>-->

                        </table>
                    </div>
                    <!--折线图部分-->
                    <div id="container" style="width: 550px; height: 400px; margin: 0 auto"></div>
                    <script language="JavaScript">
                        $(document).ready(function() {
                            var title = {
                                text: '山东省企业岗位变动情况'
                            };
                            var subtitle = {
                                text:''
                            };
                            var xAxis = {
                                categories: ['制造业', '服务业']   //选择的分析方式
                            };
                            var yAxis = {
                                title: {
                                    text: '企业总数'  //选择的分析指标
                                },
                                plotLines: [{
                                    value: 0,
                                    width: 1,
                                    color: '#808080'
                                }]
                            };

                            var tooltip = {
                                valueSuffix: '个'
                            }

                            var legend = {
                                layout: 'vertical',
                                align: 'right',
                                verticalAlign: 'middle',
                                borderWidth: 0
                            };

                            var series =  [
                                {
                                    name: '3月1日-3月29日',
                                    data: [1000, 1200]
                                },
                                {
                                    name:'4月1日-4月28日',
                                    data:[1200, 1400]
                                }
                            ];

                            var json = {};

                            json.title = title;
                            json.subtitle = subtitle;
                            json.xAxis = xAxis;
                            json.yAxis = yAxis;
                            json.tooltip = tooltip;
                            json.legend = legend;
                            json.series = series;

                            $('#container').highcharts(json);
                        });
                    </script>

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
