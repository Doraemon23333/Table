<%@ page import="com.springmvc.service.InvestigationTable" %>
<%@ page import="com.springmvc.entity.Investigation" %>
<%@ page import="com.springmvc.other.AreaCode" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.List" %>
<%@ page import="com.springmvc.entity.CompanyData" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: cheyl
  Date: 2018/3/27 0027
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>趋势分析</title>

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
<%!
    String userid = null;
    int rank = 0;
    List<Investigation> investigations = null;
%>
<%
    String id = request.getParameter("id");
    userid = id;
    String a = request.getParameter("rank");
    rank = Integer.parseInt(a);
%>
<div class="nav-box">
    <ul class="container nav">
        <li><a href="provincehome.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">首页</a></li>
        <li><a href="province2.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0">企业信息</a></li>
        <li><a href="province3.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0">岗位数据</a></li>
        <li><a href="allUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" >系统管理</a></li>
        <li><a href="/com/springmvc/controller/BingtuServlet?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" >取样分析</a></li>
        <li><a href="trend.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0" >趋势分析</a></li>
        <li><a href="compareAnalysis.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" >对比分析</a></li>
        <li><a href="/">退出</a></li>
    </ul>
</div>
<%
    InvestigationTable investigationTable = new InvestigationTable();
    Investigation investigation = new Investigation();
    investigationTable.lastData(investigation);
    investigations = new ArrayList<Investigation>();

    AreaCode areaCode = new AreaCode();

    Calendar c = Calendar.getInstance();
    int year = c.get(Calendar.YEAR);
    int month = c.get(Calendar.MONTH);
    month++;
    int day = c.get(Calendar.DAY_OF_MONTH);

    String year1 = areaCode.checkYear(year);
    String month1 = areaCode.checkMonth(month);
    String day1 = areaCode.checkDay(day);

    Connection connection0 = investigationTable.getConnection();
    try {
        String sql0 = "select * from investigationTable";
        PreparedStatement ps0 = (PreparedStatement) connection0.prepareStatement(sql0);
        Statement stmt0 = (Statement) connection0.createStatement();
        ResultSet rs0 = stmt0.executeQuery(sql0);
        while (rs0.next()){
            Investigation investigationC = new Investigation();
            investigationC.endDay = rs0.getInt("endDay");
            investigationC.endMonth = rs0.getInt("endMonth");
            investigationC.endYear = rs0.getInt("endYear");
            investigationC.investigationId = rs0.getInt("investigationId");
            investigationC.publishId = rs0.getInt("publishId");
            investigationC.beginYear = rs0.getInt("beginYear");
            investigationC.beginMonth = rs0.getInt("beginMonth");
            investigationC.beginDay = rs0.getInt("beginDay");
            investigations.add(investigationC);
        }
        rs0.close();
        stmt0.close();
        ps0.close();
        connection0.close();
    }catch (Exception e){
        e.printStackTrace();
    }

    String choose = request.getParameter("choose");
    if (choose.equals("0")){%>
<div class="main-container container no-sidebar">
    <div class="main-content">

        <div class="page-content">
            <div class="row-fluid">
                <!--PAGE CONTENT BEGINS HERE-->
                <div class="content">
                    <div>
                        <form action="/com/springmvc/controller/TrendServlet?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" method="post">
                            <table>
                                <tr>
                                    <td>请输入开始时间(标准时间格式yyyy-mm-dd)：</td>
                                    <td><input style="width: 150px;" type="date" value="" name="beginTime"></td>
                                </tr>
                                <tr>
                                    <td>请输入结束时间(标准时间格式yyyy-mm-dd)：</td>
                                    <td><input style="width: 150px;" type="date" value="" name="endTime"></td>
                                </tr>
                            </table>
                            <button type="submit" >确认</button>
                        </form>
                    </div>
                    <div style="margin: 20px 0 20px 0">
                        <!--展示一个这个时间段内所有调查期的岗位就业人数数据的列表，例如-->
                        <table border="1" width="600px" style="text-align: center;">
                            <tr>
                                <td>3月1日-3月29日</td>
                                <td>4月1日-4月28日</td>
                                <td>5月1日-5月29日</td>
                                <td>6月1日-6月28日</td>
                            </tr>
                            <tr>
                                <td>7.0%</td>
                                <td>6.9%</td>
                                <td>9.5%</td>
                                <td>14.5%</td>
                            </tr>
                        </table>
                    </div>
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
                                categories: ['3月1日-3月29日', '4月1日-4月28日', '5月1日-5月29日', '6月1日-6月28日']
                            };
                            var yAxis = {
                                title: {
                                    text: '岗位变化数量占比(%)'
                                },
                                plotLines: [{
                                    value: 0,
                                    width: 1,
                                    color: '#808080'
                                }]
                            };

                            var tooltip = {
                                valueSuffix: '%'
                            }

                            var legend = {
                                layout: 'vertical',
                                align: 'right',
                                verticalAlign: 'middle',
                                borderWidth: 0
                            };

                            var series =  [
                                {
                                    name: '岗位数量变化占比',
                                    data: [7.0, 6.9, 9.5, 14.5]
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
                    <!--<div class="hr dotted"></div>-->
                </div>
                <!--PAGE CONTENT ENDS HERE-->
            </div><!--/row-->
        </div><!--/#page-content-->

    </div><!--/#main-content-->
</div><!--/.fluid-container#main-container-->
<%}else if (choose.equals("1")){

%>
<div class="main-container container no-sidebar">
    <div class="main-content">

        <div class="page-content">
            <div class="row-fluid">
                <!--PAGE CONTENT BEGINS HERE-->
                <div class="content">
                    <div>
                        <form action="/com/springmvc/controller/TrendServlet?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" method="post">
                            <table>
                                <tr>
                                    <td>请输入开始时间(标准时间格式yyyy-mm-dd)：</td>
                                    <td><input style="width: 150px;" type="date" value="<%=request.getParameter("startTime")%>" name="beginTime"></td>
                                </tr>
                                <tr>
                                    <td>请输入结束时间(标准时间格式yyyy-mm-dd)：</td>
                                    <td><input style="width: 150px;" type="date" value="<%=request.getParameter("endTime")%>" name="endTime"></td>
                                </tr>
                            </table>
                            <button type="submit" >确认</button>
                        </form>
                    </div>
                    <div style="margin: 20px 0 20px 0">
                        <!--展示一个这个时间段内所有调查期的岗位就业人数数据的列表，例如-->
                        <table border="1" width="600px" style="text-align: center;">
                            <tr>
                                <td>3月1日-3月29日</td>
                                <td>4月1日-4月28日</td>
                                <td>5月1日-5月29日</td>
                                <td>6月1日-6月28日</td>
                            </tr>
                            <tr>
                                <td>7.0%</td>
                                <td>6.9%</td>
                                <td>9.5%</td>
                                <td>14.5%</td>
                            </tr>
                        </table>
                    </div>
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
                                categories: ['3月1日-3月29日', '4月1日-4月28日', '5月1日-5月29日', '6月1日-6月28日']
                            };
                            var yAxis = {
                                title: {
                                    text: '岗位变化数量占比(%)'
                                },
                                plotLines: [{
                                    value: 0,
                                    width: 1,
                                    color: '#808080'
                                }]
                            };

                            var tooltip = {
                                valueSuffix: '%'
                            }

                            var legend = {
                                layout: 'vertical',
                                align: 'right',
                                verticalAlign: 'middle',
                                borderWidth: 0
                            };

                            var series =  [
                                {
                                    name: '岗位数量变化占比',
                                    data: [7.0, 6.9, 9.5, 14.5]
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
