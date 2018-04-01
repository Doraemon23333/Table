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
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.springmvc.entity.User" %>
<%@ page import="com.springmvc.service.provinceTable" %>
<%@ page import="com.springmvc.service.companyDataTable" %><%--
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
                                    <td>请输入年份：</td>
                                    <td><input style="width: 150px;" type="number" value="" name="beginTime"></td>
                                </tr>
                            </table>
                            <button type="submit" >确认</button>
                        </form>
                    </div>
                    <div style="margin: 20px 0 20px 0">
                        <!--展示一个这个时间段内所有调查期的岗位就业人数数据的列表，例如-->
                        <table border="1" width="1500px" style="text-align: center;">
                            <tr>
                                <td>1月1日-2月1日</td>
                                <td>2月1日-3月1日</td>
                                <td>3月1日-4月1日</td>
                                <td>4月1日-5月1日</td>
                                <td>5月1日-6月1日</td>
                                <td>6月1日-7月1日</td>
                                <td>7月1日-8月1日</td>
                                <td>8月1日-9月1日</td>
                                <td>9月1日-10月1日</td>
                                <td>10月1日-11月1日</td>
                                <td>11月1日-12月1日</td>
                                <td>12月1日-1月1日</td>
                            </tr>
                            <tr>
                                <td>0.0%</td>
                                <td>0.0%</td>
                                <td>0.0%</td>
                                <td>0.0%</td>
                                <td>0.0%</td>
                                <td>0.0%</td>
                                <td>0.0%</td>
                                <td>0.0%</td>
                                <td>0.0%</td>
                                <td>0.0%</td>
                                <td>0.0%</td>
                                <td>0.0%</td>
                            </tr>
                        </table>
                    </div>
                    <div id="container" style="width: 1000px; height: 400px; margin: 0 auto"></div>
                    <script language="JavaScript">
                        $(document).ready(function() {
                            var title = {
                                text: '山东省企业岗位变动情况'
                            };
                            var subtitle = {
                                text:''
                            };
                            var xAxis = {
                                categories: ['1月1日-2月1日', '2月1日-3月1日', '3月1日-4月1日', '4月1日-5月1日',
                                    '5月1日-6月1日','6月1日-7月1日','7月1日-8月1日','8月1日-9月1日',
                                    '9月1日-10月1日','10月1日-11月1日','11月1日-12月1日','12月1日-1月1日']
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
                                    data: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
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
    String startTime = request.getParameter("beginTime");
    int start = Integer.parseInt(startTime);
    companyDataTable tableD = new companyDataTable();
    String sql = null;
    float data1 = 0,data2 = 0,data3 = 0,data4 = 0,data5 = 0,data6 = 0,data7 = 0,data8 = 0,data9 = 0,data10 = 0,data11 = 0,data12 = 0;
    float sum1 = 0, sum2 = 0, sum3 = 0, sum4 = 0, sum5 = 0, sum6 = 0, sum7 = 0, sum8 = 0, sum9 = 0, sum10 = 0, sum11 = 0, sum12 = 0;
    float cur1 = 0, cur2 = 0, cur3 = 0, cur4 = 0, cur5 = 0, cur6 = 0, cur7 = 0, cur8 = 0, cur9 = 0, cur10 = 0, cur11 = 0, cur12 = 0;
    if(rank == 3){
        User province = new User();
        provinceTable table = new provinceTable();
        table.findById(Integer.parseInt(id), province);
        try {
            Connection connection = tableD.getConnection();
            sql = "select * FROM companyDataTable WHERE accountYear=" + start;
            com.mysql.jdbc.PreparedStatement ps = (com.mysql.jdbc.PreparedStatement) connection.prepareStatement(sql);
            com.mysql.jdbc.Statement stmt = (com.mysql.jdbc.Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()){
                if(rs.getInt("accountMonth") == 1){
                    sum1 =sum1 + rs.getInt("csPeople");
                    cur1 = cur1 + rs.getInt("surveyPeople");
                }else if (rs.getInt("accountMonth") == 2){
                    sum2 =sum2 + rs.getInt("csPeople");
                    cur2 = cur2 + rs.getInt("surveyPeople");
                }else if (rs.getInt("accountMonth") == 3){
                    sum3 =sum3 + rs.getInt("csPeople");
                    cur3 = cur3 + rs.getInt("surveyPeople");
                }else if (rs.getInt("accountMonth") == 4){
                    sum4 =sum4 + rs.getInt("csPeople");
                    cur4 = cur4 + rs.getInt("surveyPeople");
                }else if (rs.getInt("accountMonth") == 5){
                    sum5 =sum5 + rs.getInt("csPeople");
                    cur5 = cur5 + rs.getInt("surveyPeople");
                }else if (rs.getInt("accountMonth") == 6){
                    sum6 =sum6 + rs.getInt("csPeople");
                    cur6 = cur6 + rs.getInt("surveyPeople");
                }else if (rs.getInt("accountMonth") == 7){
                    sum7 =sum7 + rs.getInt("csPeople");
                    cur7 = cur7 + rs.getInt("surveyPeople");
                }else if (rs.getInt("accountMonth") == 8){
                    sum8 =sum8 + rs.getInt("csPeople");
                    cur8 = cur8 + rs.getInt("surveyPeople");
                }else if (rs.getInt("accountMonth") == 9){
                    sum9 =sum9 + rs.getInt("csPeople");
                    cur9 = cur9 + rs.getInt("surveyPeople");
                }else if (rs.getInt("accountMonth") == 10){
                    sum10 =sum10 + rs.getInt("csPeople");
                    cur10 = cur10 + rs.getInt("surveyPeople");
                }else if (rs.getInt("accountMonth") == 11){
                    sum11 =sum11 + rs.getInt("csPeople");
                    cur11 = cur11 + rs.getInt("surveyPeople");
                }else if (rs.getInt("accountMonth") == 12){
                    sum12 =sum12 + rs.getInt("csPeople");
                    cur12 = cur12 + rs.getInt("surveyPeople");
                }
            }
            ps.close();
            stmt.close();
            ps.close();
            connection.close();
            data1 = (cur1 - sum1) / sum1;
            data2 = (cur2 - sum2) / sum2;
            data3 = (cur3 - sum3) / sum3;
            data4 = (cur4 - sum4) / sum4;
            data5 = (cur5 - sum5) / sum5;
            data6 = (cur6 - sum6) / sum6;
            data7 = (cur7 - sum7) / sum7;
            data8 = (cur8 - sum8) / sum8;
            data9 = (cur9 - sum9) / sum9;
            data10 = (cur10 - sum10) / sum10;
            data11 = (cur11 - sum11) / sum11;
            data12 = (cur12 - sum12) / sum12;
            System.out.println();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
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
                                    <td>请输入年份：</td>
                                    <td><input style="width: 150px;" value="" type="number" name="beginTime"></td>
                                </tr>
                            </table>
                            <button type="submit" >确认</button>
                        </form>
                    </div>
                    <div style="margin: 20px 0 20px 0">
                        <!--展示一个这个时间段内所有调查期的岗位就业人数数据的列表，例如-->
                        <table border="1" width="1500px" style="text-align: center;">
                            <tr>
                                <td>1月1日-2月1日</td>
                                <td>2月1日-3月1日</td>
                                <td>3月1日-4月1日</td>
                                <td>4月1日-5月1日</td>
                                <td>5月1日-6月1日</td>
                                <td>6月1日-7月1日</td>
                                <td>7月1日-8月1日</td>
                                <td>8月1日-9月1日</td>
                                <td>9月1日-10月1日</td>
                                <td>10月1日-11月1日</td>
                                <td>11月1日-12月1日</td>
                                <td>12月1日-1月1日</td>
                            </tr>
                            <tr>
                                <td><%=data1 * 100%>%</td>
                                <td><%=data2 * 100%>%</td>
                                <td><%=data3 * 100%>%</td>
                                <td><%=data4 * 100%>%</td>
                                <td><%=data5 * 100%>%</td>
                                <td><%=data6 * 100%>%</td>
                                <td><%=data7 * 100%>%</td>
                                <td><%=data8 * 100%>%</td>
                                <td><%=data9 * 100%>%</td>
                                <td><%=data10 * 100%>%</td>
                                <td><%=data11 * 100%>%</td>
                                <td><%=data12 * 100%>%</td>
                            </tr>
                        </table>
                    </div>
                    <div id="container" style="width: 1000px; height: 400px; margin: 0 auto"></div>
                    <script language="JavaScript">
                        $(document).ready(function() {
                            var title = {
                                text: '山东省企业岗位变动情况'
                            };
                            var subtitle = {
                                text:''
                            };
                            var xAxis = {
                                categories: ['1月1日-2月1日', '2月1日-3月1日', '3月1日-4月1日', '4月1日-5月1日',
                                    '5月1日-6月1日','6月1日-7月1日','7月1日-8月1日','8月1日-9月1日',
                                    '9月1日-10月1日','10月1日-11月1日','11月1日-12月1日','12月1日-1月1日']
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
                                    data: [<%=data1 * 100%>,<%=data2 * 100%>,<%=data3 * 100%>,<%=data4 * 100%>,<%=data5 * 100%>,<%=data6 * 100%>
                                    ,<%=data7 * 100%>,<%=data8 * 100%>,<%=data9 * 100%>,<%=data10 * 100%>,<%=data11 * 100%>,<%=data12 * 100%>]
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
<%}else {
        out.print("您没有该功能权限");
}
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
