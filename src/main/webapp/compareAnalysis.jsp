<%@ page import="com.springmvc.entity.Investigation" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.springmvc.other.AreaCode" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.springmvc.entity.User" %>
<%@ page import="com.springmvc.service.*" %>
<%@ page import="com.springmvc.entity.CompanyData" %><%--
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
        <li><a href="trend.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0">趋势分析</a></li>
        <li><a href="compareAnalysis.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0" >对比分析</a></li>
        <li><a href="/">退出</a></li>
    </ul>
</div>
<%
    String choose = request.getParameter("choose");
    if (choose.equals("0") && request.getParameter("rank").equals("3")){%>
<div class="main-container container no-sidebar">
    <div class="main-content">

        <div class="page-content">
            <div class="row-fluid">
                <!--PAGE CONTENT BEGINS HERE-->
                <div class="content">
                    <div>
                        <form action="/com/springmvc/controller/AnalysisServlet?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" method="post">
                            <table>
                                <tr>
                                    <td>请输入A年年份：</td>
                                    <td><input style="width: 150px;" type="number" value="" name="firstTime"></td>
                                </tr>
                                <tr>
                                    <td>请输入B年年份：</td>
                                    <td><input style="width: 150px;" type="number" value="" name="secondTime"></td>
                                </tr>
                                <tr>
                                    <td>请选择分析方式：</td>
                                    <td>
                                        <select  style="width: 100px" name="analyze" id="analyze">
                                            <option value=""></option>
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
                                            <option value=""></option>
                                            <option value="企业总数">企业总数</option>
                                            <option value="建档期总岗位数">建档期总岗位数</option>
                                            <option value="调查期总岗位数">调查期总岗位数</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                            <button type="submit" >确认</button>
                        </form>
                    </div>
                </div>
                <!--PAGE CONTENT ENDS HERE-->
            </div><!--/row-->
        </div><!--/#page-content-->

    </div><!--/#main-content-->
</div><!--/.fluid-container#main-container-->
    <%}else if (choose.equals("11") && request.getParameter("rank").equals("3")){
        int year1 = Integer.parseInt(request.getParameter("firstTime"));
        int year2 = Integer.parseInt(request.getParameter("secondTime"));
        cityTable table = new cityTable();
        companyTable table1 = new companyTable();
        userTable table2 = new userTable();
        int[] sum = new int[17], sum2 = new int[17];
        try {
            Connection connection = table.getConnection();
            String sql = "SELECT area from cityTable";
            PreparedStatement ps = (com.mysql.jdbc.PreparedStatement) connection.prepareStatement(sql);
            Statement stmt = (com.mysql.jdbc.Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int row = 0;
            while (rs.next()){
                sum[row] = 0;
                sum2[row] = 0;
                String area = rs.getString("area");
                Connection connection1 = table1.getConnection();
                String sql1 = "SELECT * from companyTable WHERE originalArea='" + area + "'";
                PreparedStatement ps1 = (com.mysql.jdbc.PreparedStatement) connection1.prepareStatement(sql1);
                Statement stmt1 = (com.mysql.jdbc.Statement) connection1.createStatement();
                ResultSet rs1 = stmt1.executeQuery(sql1);
                while (rs1.next()){
                    User user = new User();
                    table2.findById(rs1.getInt("id"), user);
                    if (user.registerYear <= year1){
                        sum[row]++;
                    }
                    if (user.registerYear <= year2){
                        sum2[row]++;
                    }
                }
                rs1.close();
                stmt1.close();
                ps1.close();
                connection1.close();
                row++;
            }
            rs.close();
            stmt.close();
            ps.close();
            connection.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    %>
<div class="main-container container no-sidebar">
    <div class="main-content">

        <div class="page-content">
            <div class="row-fluid">
                <!--PAGE CONTENT BEGINS HERE-->
                <div class="content">
                    <div>
                        <form action="/com/springmvc/controller/AnalysisServlet?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" method="post">
                            <table>
                                <tr>
                                    <td>请输入A年年份：</td>
                                    <td><input style="width: 150px;" type="number" value="" name="firstTime"></td>
                                </tr>
                                <tr>
                                    <td>请输入B年年份：</td>
                                    <td><input style="width: 150px;" type="number" value="" name="secondTime"></td>
                                </tr>
                                <tr>
                                    <td>请选择分析方式：</td>
                                    <td>
                                        <select  style="width: 100px" name="analyze" id="analyze">
                                            <option value=""></option>
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
                                            <option value=""></option>
                                            <option value="企业总数">企业总数</option>
                                            <option value="建档期总岗位数">建档期总岗位数</option>
                                            <option value="调查期总岗位数">调查期总岗位数</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                            <button type="submit" >确认</button>
                        </form>
                    </div>
                    <div style="margin: 20px 0 20px 0">
                        <!--展示一个这个时间段内所有调查期的岗位就业人数数据的列表，例如-->
                        <table border="1" width="600px" style="text-align: center;">
                            <!--此行为选择的分析方式-->
                            <!--通过设置-->
                            <tr>
                                <td>城市</td>
                                <td>济南</td>
                                <td>青岛</td>
                                <td>淄博</td>
                                <td>德州</td>
                                <td>烟台</td>
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

                            <!--<tr>
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
                                <td><%=year1%>年企业总数</td>
                                <td><%=sum[0]%></td>
                                <td><%=sum[1]%></td>
                                <td><%=sum[2]%></td>
                                <td><%=sum[3]%></td>
                                <td><%=sum[4]%></td>
                                <td><%=sum[5]%></td>
                                <td><%=sum[6]%></td>
                                <td><%=sum[7]%></td>
                                <td><%=sum[8]%></td>
                                <td><%=sum[9]%></td>
                                <td><%=sum[10]%></td>
                                <td><%=sum[11]%></td>
                                <td><%=sum[12]%></td>
                                <td><%=sum[13]%></td>
                                <td><%=sum[14]%></td>
                                <td><%=sum[15]%></td>
                                <td><%=sum[16]%></td>
                            </tr>
                            <tr>
                                <td><%=year2%>年企业总数</td>
                                <td><%=sum2[0]%></td>
                                <td><%=sum2[1]%></td>
                                <td><%=sum2[2]%></td>
                                <td><%=sum2[3]%></td>
                                <td><%=sum2[4]%></td>
                                <td><%=sum2[5]%></td>
                                <td><%=sum2[6]%></td>
                                <td><%=sum2[7]%></td>
                                <td><%=sum2[8]%></td>
                                <td><%=sum2[9]%></td>
                                <td><%=sum2[10]%></td>
                                <td><%=sum2[11]%></td>
                                <td><%=sum2[12]%></td>
                                <td><%=sum2[13]%></td>
                                <td><%=sum2[14]%></td>
                                <td><%=sum2[15]%></td>
                                <td><%=sum2[16]%></td>
                            </tr>
                            <!--<tr>
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
                                categories: ['济南', '青岛', '淄博', '德州', '烟台', '潍坊', '济宁', '泰安', '临沂', '菏泽'
                                    , '滨州', '东营', '威海', '枣庄', '日照', '莱芜', '聊城']   //选择的分析方式
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
                                    name: '<%=year1%>年',
                                    data: [<%=sum[0]%>, <%=sum[1]%>, <%=sum[2]%>, <%=sum[3]%>, <%=sum[4]%>, <%=sum[5]%>
                                        , <%=sum[6]%>, <%=sum[7]%>, <%=sum[8]%>, <%=sum[9]%>, <%=sum[10]%>, <%=sum[11]%>
                                        , <%=sum[12]%>, <%=sum[13]%>, <%=sum[14]%>, <%=sum[15]%>, <%=sum[16]%>]
                                },
                                {
                                    name:'<%=year2%>年',
                                    data:[<%=sum2[0]%>, <%=sum2[1]%>, <%=sum2[2]%>, <%=sum2[3]%>, <%=sum2[4]%>, <%=sum2[5]%>
                                        , <%=sum2[6]%>, <%=sum2[7]%>, <%=sum2[8]%>, <%=sum2[9]%>, <%=sum2[10]%>, <%=sum2[11]%>
                                        , <%=sum2[12]%>, <%=sum2[13]%>, <%=sum2[14]%>, <%=sum2[15]%>, <%=sum2[16]%>]
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
    <%}else if (choose.equals("12") && request.getParameter("rank").equals("3")){
        int year1 = Integer.parseInt(request.getParameter("firstTime"));
        int year2 = Integer.parseInt(request.getParameter("secondTime"));
        cityTable table = new cityTable();
        companyTable table1 = new companyTable();
        userTable table2 = new userTable();
        companyDataTable table3 = new companyDataTable();
        int[] sum = new int[17], sum2 = new int[17];
        try {
            Connection connection = table.getConnection();
            String sql = "SELECT area from cityTable";
            PreparedStatement ps = (com.mysql.jdbc.PreparedStatement) connection.prepareStatement(sql);
            Statement stmt = (com.mysql.jdbc.Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int row = 0;
            while (rs.next()){
                sum[row] = 0;
                sum2[row] = 0;
                String area = rs.getString("area");
                Connection connection1 = table1.getConnection();
                String sql1 = "SELECT * from companyTable WHERE originalArea='" + area + "'";
                System.out.println(sql1);
                PreparedStatement ps1 = (com.mysql.jdbc.PreparedStatement) connection1.prepareStatement(sql1);
                Statement stmt1 = (com.mysql.jdbc.Statement) connection1.createStatement();
                ResultSet rs1 = stmt1.executeQuery(sql1);
                while (rs1.next()){
                    User user = new User();
                    CompanyData companyData = new CompanyData();
                    table2.findById(rs1.getInt("id"), user);
                    companyData.companyDataId = user.companyDataId;
                    table3.find(companyData);
                    if (user.registerYear <= year1){
                        sum[row] = sum[row] + Integer.parseInt(companyData.csPeople);
                    }
                    if (user.registerYear <= year2){
                        sum2[row] = sum2[row] + Integer.parseInt(companyData.csPeople);
                    }
                }
                rs1.close();
                stmt1.close();
                ps1.close();
                connection1.close();
                row++;
            }
            rs.close();
            stmt.close();
            ps.close();
            connection.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    %>
<div class="main-container container no-sidebar">
    <div class="main-content">

        <div class="page-content">
            <div class="row-fluid">
                <!--PAGE CONTENT BEGINS HERE-->
                <div class="content">
                    <div>
                        <form action="/com/springmvc/controller/AnalysisServlet?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" method="post">
                            <table>
                                <tr>
                                    <td>请输入A年年份：</td>
                                    <td><input style="width: 150px;" type="number" value="" name="firstTime"></td>
                                </tr>
                                <tr>
                                    <td>请输入B年年份：</td>
                                    <td><input style="width: 150px;" type="number" value="" name="secondTime"></td>
                                </tr>
                                <tr>
                                    <td>请选择分析方式：</td>
                                    <td>
                                        <select  style="width: 100px" name="analyze" id="analyze">
                                            <option value=""></option>
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
                                            <option value=""></option>
                                            <option value="企业总数">企业总数</option>
                                            <option value="建档期总岗位数">建档期总岗位数</option>
                                            <option value="调查期总岗位数">调查期总岗位数</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                            <button type="submit" >确认</button>
                        </form>
                    </div>
                    <div style="margin: 20px 0 20px 0">
                        <!--展示一个这个时间段内所有调查期的岗位就业人数数据的列表，例如-->
                        <table border="1" width="600px" style="text-align: center;">
                            <!--此行为选择的分析方式-->
                            <!--通过设置-->
                            <tr>
                                <td>城市</td>
                                <td>济南</td>
                                <td>青岛</td>
                                <td>淄博</td>
                                <td>德州</td>
                                <td>烟台</td>
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

                            <!--<tr>
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
                                <td><%=year1%>年建档期岗位总数</td>
                                <td><%=sum[0]%></td>
                                <td><%=sum[1]%></td>
                                <td><%=sum[2]%></td>
                                <td><%=sum[3]%></td>
                                <td><%=sum[4]%></td>
                                <td><%=sum[5]%></td>
                                <td><%=sum[6]%></td>
                                <td><%=sum[7]%></td>
                                <td><%=sum[8]%></td>
                                <td><%=sum[9]%></td>
                                <td><%=sum[10]%></td>
                                <td><%=sum[11]%></td>
                                <td><%=sum[12]%></td>
                                <td><%=sum[13]%></td>
                                <td><%=sum[14]%></td>
                                <td><%=sum[15]%></td>
                                <td><%=sum[16]%></td>
                            </tr>
                            <tr>
                                <td><%=year2%>年建档期岗位总数</td>
                                <td><%=sum2[0]%></td>
                                <td><%=sum2[1]%></td>
                                <td><%=sum2[2]%></td>
                                <td><%=sum2[3]%></td>
                                <td><%=sum2[4]%></td>
                                <td><%=sum2[5]%></td>
                                <td><%=sum2[6]%></td>
                                <td><%=sum2[7]%></td>
                                <td><%=sum2[8]%></td>
                                <td><%=sum2[9]%></td>
                                <td><%=sum2[10]%></td>
                                <td><%=sum2[11]%></td>
                                <td><%=sum2[12]%></td>
                                <td><%=sum2[13]%></td>
                                <td><%=sum2[14]%></td>
                                <td><%=sum2[15]%></td>
                                <td><%=sum2[16]%></td>
                            </tr>
                            <!--<tr>
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
                                categories: ['济南', '青岛', '淄博', '德州', '烟台', '潍坊', '济宁', '泰安', '临沂', '菏泽'
                                    , '滨州', '东营', '威海', '枣庄', '日照', '莱芜', '聊城']   //选择的分析方式
                            };
                            var yAxis = {
                                title: {
                                    text: '建档期岗位总数'  //选择的分析指标
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
                                    name: '<%=year1%>年',
                                    data: [<%=sum[0]%>, <%=sum[1]%>, <%=sum[2]%>, <%=sum[3]%>, <%=sum[4]%>, <%=sum[5]%>
                                        , <%=sum[6]%>, <%=sum[7]%>, <%=sum[8]%>, <%=sum[9]%>, <%=sum[10]%>, <%=sum[11]%>
                                        , <%=sum[12]%>, <%=sum[13]%>, <%=sum[14]%>, <%=sum[15]%>, <%=sum[16]%>]
                                },
                                {
                                    name:'<%=year2%>年',
                                    data:[<%=sum2[0]%>, <%=sum2[1]%>, <%=sum2[2]%>, <%=sum2[3]%>, <%=sum2[4]%>, <%=sum2[5]%>
                                        , <%=sum2[6]%>, <%=sum2[7]%>, <%=sum2[8]%>, <%=sum2[9]%>, <%=sum2[10]%>, <%=sum2[11]%>
                                        , <%=sum2[12]%>, <%=sum2[13]%>, <%=sum2[14]%>, <%=sum2[15]%>, <%=sum2[16]%>]
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
    <%}
    else if (choose.equals("13") && request.getParameter("rank").equals("3")){
        int year1 = Integer.parseInt(request.getParameter("firstTime"));
        int year2 = Integer.parseInt(request.getParameter("secondTime"));
        cityTable table = new cityTable();
        companyTable table1 = new companyTable();
        userTable table2 = new userTable();
        companyDataTable table3 = new companyDataTable();
        int[] sum = new int[17], sum2 = new int[17];
        try {
            Connection connection = table.getConnection();
            String sql = "SELECT area from cityTable";
            PreparedStatement ps = (com.mysql.jdbc.PreparedStatement) connection.prepareStatement(sql);
            Statement stmt = (com.mysql.jdbc.Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int row = 0;
            while (rs.next()){
                sum[row] = 0;
                sum2[row] = 0;
                String area = rs.getString("area");
                Connection connection1 = table1.getConnection();
                String sql1 = "SELECT * from companyTable WHERE originalArea='" + area + "'";
                System.out.println(sql1);
                PreparedStatement ps1 = (com.mysql.jdbc.PreparedStatement) connection1.prepareStatement(sql1);
                Statement stmt1 = (com.mysql.jdbc.Statement) connection1.createStatement();
                ResultSet rs1 = stmt1.executeQuery(sql1);
                while (rs1.next()){
                    User user = new User();
                    CompanyData companyData = new CompanyData();
                    table2.findById(rs1.getInt("id"), user);
                    companyData.companyDataId = user.companyDataId;
                    table3.find(companyData);
                    if (user.registerYear <= year1){
                        sum[row] = sum[row] + Integer.parseInt(companyData.surveyPeople);
                    }
                    if (user.registerYear <= year2){
                        sum2[row] = sum2[row] + Integer.parseInt(companyData.surveyPeople);
                    }
                }
                rs1.close();
                stmt1.close();
                ps1.close();
                connection1.close();
                row++;
            }
            rs.close();
            stmt.close();
            ps.close();
            connection.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    %>
<div class="main-container container no-sidebar">
    <div class="main-content">

        <div class="page-content">
            <div class="row-fluid">
                <!--PAGE CONTENT BEGINS HERE-->
                <div class="content">
                    <div>
                        <form action="/com/springmvc/controller/AnalysisServlet?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" method="post">
                            <table>
                                <tr>
                                    <td>请输入A年年份：</td>
                                    <td><input style="width: 150px;" type="number" value="" name="firstTime"></td>
                                </tr>
                                <tr>
                                    <td>请输入B年年份：</td>
                                    <td><input style="width: 150px;" type="number" value="" name="secondTime"></td>
                                </tr>
                                <tr>
                                    <td>请选择分析方式：</td>
                                    <td>
                                        <select  style="width: 100px" name="analyze" id="analyze">
                                            <option value=""></option>
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
                                            <option value=""></option>
                                            <option value="企业总数">企业总数</option>
                                            <option value="建档期总岗位数">建档期总岗位数</option>
                                            <option value="调查期总岗位数">调查期总岗位数</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                            <button type="submit" >确认</button>
                        </form>
                    </div>
                    <div style="margin: 20px 0 20px 0">
                        <!--展示一个这个时间段内所有调查期的岗位就业人数数据的列表，例如-->
                        <table border="1" width="600px" style="text-align: center;">
                            <!--此行为选择的分析方式-->
                            <!--通过设置-->
                            <tr>
                                <td>城市</td>
                                <td>济南</td>
                                <td>青岛</td>
                                <td>淄博</td>
                                <td>德州</td>
                                <td>烟台</td>
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

                            <!--<tr>
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
                                <td><%=year1%>年调查期岗位总数</td>
                                <td><%=sum[0]%></td>
                                <td><%=sum[1]%></td>
                                <td><%=sum[2]%></td>
                                <td><%=sum[3]%></td>
                                <td><%=sum[4]%></td>
                                <td><%=sum[5]%></td>
                                <td><%=sum[6]%></td>
                                <td><%=sum[7]%></td>
                                <td><%=sum[8]%></td>
                                <td><%=sum[9]%></td>
                                <td><%=sum[10]%></td>
                                <td><%=sum[11]%></td>
                                <td><%=sum[12]%></td>
                                <td><%=sum[13]%></td>
                                <td><%=sum[14]%></td>
                                <td><%=sum[15]%></td>
                                <td><%=sum[16]%></td>
                            </tr>
                            <tr>
                                <td><%=year2%>年调查期岗位总数</td>
                                <td><%=sum2[0]%></td>
                                <td><%=sum2[1]%></td>
                                <td><%=sum2[2]%></td>
                                <td><%=sum2[3]%></td>
                                <td><%=sum2[4]%></td>
                                <td><%=sum2[5]%></td>
                                <td><%=sum2[6]%></td>
                                <td><%=sum2[7]%></td>
                                <td><%=sum2[8]%></td>
                                <td><%=sum2[9]%></td>
                                <td><%=sum2[10]%></td>
                                <td><%=sum2[11]%></td>
                                <td><%=sum2[12]%></td>
                                <td><%=sum2[13]%></td>
                                <td><%=sum2[14]%></td>
                                <td><%=sum2[15]%></td>
                                <td><%=sum2[16]%></td>
                            </tr>
                            <!--<tr>
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
                                categories: ['济南', '青岛', '淄博', '德州', '烟台', '潍坊', '济宁', '泰安', '临沂', '菏泽'
                                    , '滨州', '东营', '威海', '枣庄', '日照', '莱芜', '聊城']   //选择的分析方式
                            };
                            var yAxis = {
                                title: {
                                    text: '建档期岗位总数'  //选择的分析指标
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
                                    name: '<%=year1%>年',
                                    data: [<%=sum[0]%>, <%=sum[1]%>, <%=sum[2]%>, <%=sum[3]%>, <%=sum[4]%>, <%=sum[5]%>
                                        , <%=sum[6]%>, <%=sum[7]%>, <%=sum[8]%>, <%=sum[9]%>, <%=sum[10]%>, <%=sum[11]%>
                                        , <%=sum[12]%>, <%=sum[13]%>, <%=sum[14]%>, <%=sum[15]%>, <%=sum[16]%>]
                                },
                                {
                                    name:'<%=year2%>年',
                                    data:[<%=sum2[0]%>, <%=sum2[1]%>, <%=sum2[2]%>, <%=sum2[3]%>, <%=sum2[4]%>, <%=sum2[5]%>
                                        , <%=sum2[6]%>, <%=sum2[7]%>, <%=sum2[8]%>, <%=sum2[9]%>, <%=sum2[10]%>, <%=sum2[11]%>
                                        , <%=sum2[12]%>, <%=sum2[13]%>, <%=sum2[14]%>, <%=sum2[15]%>, <%=sum2[16]%>]
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
    <%}else if (choose.equals("21") && request.getParameter("rank").equals("3")){
        int year1 = Integer.parseInt(request.getParameter("firstTime"));
        int year2 = Integer.parseInt(request.getParameter("secondTime"));
        cityTable table = new cityTable();
        companyTable table1 = new companyTable();
        userTable table2 = new userTable();
        companyDataTable table3 = new companyDataTable();
        int[] sum = new int[9], sum2 = new int[9];
        try {
            Connection connection = table1.getConnection();
            String sql = "SELECT distinct enterprisesNature from companyTable";
            PreparedStatement ps = (com.mysql.jdbc.PreparedStatement) connection.prepareStatement(sql);
            Statement stmt = (com.mysql.jdbc.Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int row = 0;
            while (rs.next()){
                sum[row] = 0;
                sum2[row] = 0;
                String enterprisesNature = rs.getString("enterprisesNature");
                Connection connection1 = table1.getConnection();
                String sql1 = "SELECT * from companyTable WHERE enterprisesNature='" + enterprisesNature + "'";
                System.out.println(sql1);
                PreparedStatement ps1 = (com.mysql.jdbc.PreparedStatement) connection1.prepareStatement(sql1);
                Statement stmt1 = (com.mysql.jdbc.Statement) connection1.createStatement();
                ResultSet rs1 = stmt1.executeQuery(sql1);
                while (rs1.next()){
                    User user = new User();
                    CompanyData companyData = new CompanyData();
                    table2.findById(rs1.getInt("id"), user);
                    if (user.registerYear <= year1){
                        sum[row]++;
                    }
                    if (user.registerYear <= year2){
                        sum2[row]++;
                    }
                }
                rs1.close();
                stmt1.close();
                ps1.close();
                connection1.close();
                row++;
            }
            rs.close();
            stmt.close();
            ps.close();
            connection.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    %>
<div class="main-container container no-sidebar">
    <div class="main-content">

        <div class="page-content">
            <div class="row-fluid">
                <!--PAGE CONTENT BEGINS HERE-->
                <div class="content">
                    <div>
                        <form action="/com/springmvc/controller/AnalysisServlet?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" method="post">
                            <table>
                                <tr>
                                    <td>请输入A年年份：</td>
                                    <td><input style="width: 150px;" type="number" value="" name="firstTime"></td>
                                </tr>
                                <tr>
                                    <td>请输入B年年份：</td>
                                    <td><input style="width: 150px;" type="number" value="" name="secondTime"></td>
                                </tr>
                                <tr>
                                    <td>请选择分析方式：</td>
                                    <td>
                                        <select  style="width: 100px" name="analyze" id="analyze">
                                            <option value=""></option>
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
                                            <option value=""></option>
                                            <option value="企业总数">企业总数</option>
                                            <option value="建档期总岗位数">建档期总岗位数</option>
                                            <option value="调查期总岗位数">调查期总岗位数</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                            <button type="submit" >确认</button>
                        </form>
                    </div>
                    <div style="margin: 20px 0 20px 0">
                        <!--展示一个这个时间段内所有调查期的岗位就业人数数据的列表，例如-->
                        <table border="1" width="600px" style="text-align: center;">
                            <!--此行为选择的分析方式-->
                            <!--通过设置-->
                            <!--<tr>
                                <td>城市</td>
                                <td>济南</td>
                                <td>青岛</td>
                                <td>淄博</td>
                                <td>德州</td>
                                <td>烟台</td>
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
                            </tr>-->

                            <tr>
                                <td>企业性质</td>
                                <td>国有企业</td>
                                <td>集体企业</td>
                                <td>联营企业</td>
                                <td>股份合作制企业</td>
                                <td>私营企业</td>
                                <td>个体户</td>
                                <td>合伙企业</td>
                                <td>有限责任公司</td>
                                <td>股份有限公司</td>
                            </tr>
                            <!--<tr>
                                <td>制造业</td>
                                <td>服务业</td>
                            </tr>-->
                            <tr>
                                <td><%=year1%>年企业总数</td>
                                <td><%=sum[0]%></td>
                                <td><%=sum[1]%></td>
                                <td><%=sum[2]%></td>
                                <td><%=sum[3]%></td>
                                <td><%=sum[4]%></td>
                                <td><%=sum[5]%></td>
                                <td><%=sum[6]%></td>
                                <td><%=sum[7]%></td>
                                <td><%=sum[8]%></td>
                            </tr>
                            <tr>
                                <td><%=year2%>年企业总数</td>
                                <td><%=sum2[0]%></td>
                                <td><%=sum2[1]%></td>
                                <td><%=sum2[2]%></td>
                                <td><%=sum2[3]%></td>
                                <td><%=sum2[4]%></td>
                                <td><%=sum2[5]%></td>
                                <td><%=sum2[6]%></td>
                                <td><%=sum2[7]%></td>
                                <td><%=sum2[8]%></td>
                            </tr>
                            <!--<tr>
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
                                categories: ['国有企业','集体企业','联营企业','股份合作制企业',
                                    '私营企业','个体户','合伙企业','有限责任公司','股份有限公司']   //选择的分析方式
                            };
                            var yAxis = {
                                title: {
                                    text: '建档期岗位总数'  //选择的分析指标
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
                                    name: '<%=year1%>年',
                                    data: [<%=sum[0]%>, <%=sum[1]%>, <%=sum[2]%>, <%=sum[3]%>, <%=sum[4]%>, <%=sum[5]%>
                                        , <%=sum[6]%>, <%=sum[7]%>, <%=sum[8]%>]
                                },
                                {
                                    name:'<%=year2%>年',
                                    data:[<%=sum2[0]%>, <%=sum2[1]%>, <%=sum2[2]%>, <%=sum2[3]%>, <%=sum2[4]%>, <%=sum2[5]%>
                                        , <%=sum2[6]%>, <%=sum2[7]%>, <%=sum2[8]%>]
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
    <%}else if (choose.equals("22") && request.getParameter("rank").equals("3")){
        int year1 = Integer.parseInt(request.getParameter("firstTime"));
        int year2 = Integer.parseInt(request.getParameter("secondTime"));
        cityTable table = new cityTable();
        companyTable table1 = new companyTable();
        userTable table2 = new userTable();
        companyDataTable table3 = new companyDataTable();
        int[] sum = new int[9], sum2 = new int[9];
        try {
            Connection connection = table1.getConnection();
            String sql = "SELECT distinct enterprisesNature from companyTable";
            PreparedStatement ps = (com.mysql.jdbc.PreparedStatement) connection.prepareStatement(sql);
            Statement stmt = (com.mysql.jdbc.Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int row = 0;
            while (rs.next()){
                sum[row] = 0;
                sum2[row] = 0;
                String enterprisesNature = rs.getString("enterprisesNature");
                Connection connection1 = table1.getConnection();
                String sql1 = "SELECT * from companyTable WHERE enterprisesNature='" + enterprisesNature + "'";
                System.out.println(sql1);
                PreparedStatement ps1 = (com.mysql.jdbc.PreparedStatement) connection1.prepareStatement(sql1);
                Statement stmt1 = (com.mysql.jdbc.Statement) connection1.createStatement();
                ResultSet rs1 = stmt1.executeQuery(sql1);
                while (rs1.next()){
                    User user = new User();
                    CompanyData companyData = new CompanyData();
                    table2.findById(rs1.getInt("id"), user);
                    companyData.companyDataId = user.companyDataId;
                    table3.find(companyData);
                    if (user.registerYear <= year1){
                        sum[row] = sum[row] + Integer.parseInt(companyData.csPeople);
                    }
                    if (user.registerYear <= year2){
                        sum2[row] = sum2[row] + Integer.parseInt(companyData.csPeople);
                    }
                }
                rs1.close();
                stmt1.close();
                ps1.close();
                connection1.close();
                row++;
            }
            rs.close();
            stmt.close();
            ps.close();
            connection.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    %>
<div class="main-container container no-sidebar">
    <div class="main-content">

        <div class="page-content">
            <div class="row-fluid">
                <!--PAGE CONTENT BEGINS HERE-->
                <div class="content">
                    <div>
                        <form action="/com/springmvc/controller/AnalysisServlet?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" method="post">
                            <table>
                                <tr>
                                    <td>请输入A年年份：</td>
                                    <td><input style="width: 150px;" type="number" value="" name="firstTime"></td>
                                </tr>
                                <tr>
                                    <td>请输入B年年份：</td>
                                    <td><input style="width: 150px;" type="number" value="" name="secondTime"></td>
                                </tr>
                                <tr>
                                    <td>请选择分析方式：</td>
                                    <td>
                                        <select  style="width: 100px" name="analyze" id="analyze">
                                            <option value=""></option>
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
                                            <option value=""></option>
                                            <option value="企业总数">企业总数</option>
                                            <option value="建档期总岗位数">建档期总岗位数</option>
                                            <option value="调查期总岗位数">调查期总岗位数</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                            <button type="submit" >确认</button>
                        </form>
                    </div>
                    <div style="margin: 20px 0 20px 0">
                        <!--展示一个这个时间段内所有调查期的岗位就业人数数据的列表，例如-->
                        <table border="1" width="600px" style="text-align: center;">
                            <!--此行为选择的分析方式-->
                            <!--通过设置-->
                            <!--<tr>
                                <td>城市</td>
                                <td>济南</td>
                                <td>青岛</td>
                                <td>淄博</td>
                                <td>德州</td>
                                <td>烟台</td>
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
                            </tr>-->

                            <tr>
                                <td>企业性质</td>
                                <td>国有企业</td>
                                <td>集体企业</td>
                                <td>联营企业</td>
                                <td>股份合作制企业</td>
                                <td>私营企业</td>
                                <td>个体户</td>
                                <td>合伙企业</td>
                                <td>有限责任公司</td>
                                <td>股份有限公司</td>
                            </tr>
                            <!--<tr>
                                <td>制造业</td>
                                <td>服务业</td>
                            </tr>-->
                            <tr>
                                <td><%=year1%>年建档期岗位总数</td>
                                <td><%=sum[0]%></td>
                                <td><%=sum[1]%></td>
                                <td><%=sum[2]%></td>
                                <td><%=sum[3]%></td>
                                <td><%=sum[4]%></td>
                                <td><%=sum[5]%></td>
                                <td><%=sum[6]%></td>
                                <td><%=sum[7]%></td>
                                <td><%=sum[8]%></td>
                            </tr>
                            <tr>
                                <td><%=year2%>年建档期岗位总数</td>
                                <td><%=sum2[0]%></td>
                                <td><%=sum2[1]%></td>
                                <td><%=sum2[2]%></td>
                                <td><%=sum2[3]%></td>
                                <td><%=sum2[4]%></td>
                                <td><%=sum2[5]%></td>
                                <td><%=sum2[6]%></td>
                                <td><%=sum2[7]%></td>
                                <td><%=sum2[8]%></td>
                            </tr>
                            <!--<tr>
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
                                categories: ['国有企业','集体企业','联营企业','股份合作制企业',
                                    '私营企业','个体户','合伙企业','有限责任公司','股份有限公司']   //选择的分析方式
                            };
                            var yAxis = {
                                title: {
                                    text: '建档期岗位总数'  //选择的分析指标
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
                                    name: '<%=year1%>年',
                                    data: [<%=sum[0]%>, <%=sum[1]%>, <%=sum[2]%>, <%=sum[3]%>, <%=sum[4]%>, <%=sum[5]%>
                                        , <%=sum[6]%>, <%=sum[7]%>, <%=sum[8]%>]
                                },
                                {
                                    name:'<%=year2%>年',
                                    data:[<%=sum2[0]%>, <%=sum2[1]%>, <%=sum2[2]%>, <%=sum2[3]%>, <%=sum2[4]%>, <%=sum2[5]%>
                                        , <%=sum2[6]%>, <%=sum2[7]%>, <%=sum2[8]%>]
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
    <%}else if (choose.equals("23") && request.getParameter("rank").equals("3")){
        int year1 = Integer.parseInt(request.getParameter("firstTime"));
        int year2 = Integer.parseInt(request.getParameter("secondTime"));
        cityTable table = new cityTable();
        companyTable table1 = new companyTable();
        userTable table2 = new userTable();
        companyDataTable table3 = new companyDataTable();
        int[] sum = new int[9], sum2 = new int[9];
        try {
            Connection connection = table1.getConnection();
            String sql = "SELECT distinct enterprisesNature from companyTable";
            PreparedStatement ps = (com.mysql.jdbc.PreparedStatement) connection.prepareStatement(sql);
            Statement stmt = (com.mysql.jdbc.Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int row = 0;
            while (rs.next()){
                sum[row] = 0;
                sum2[row] = 0;
                String enterprisesNature = rs.getString("enterprisesNature");
                Connection connection1 = table1.getConnection();
                String sql1 = "SELECT * from companyTable WHERE enterprisesNature='" + enterprisesNature + "'";
                System.out.println(sql1);
                PreparedStatement ps1 = (com.mysql.jdbc.PreparedStatement) connection1.prepareStatement(sql1);
                Statement stmt1 = (com.mysql.jdbc.Statement) connection1.createStatement();
                ResultSet rs1 = stmt1.executeQuery(sql1);
                while (rs1.next()){
                    User user = new User();
                    CompanyData companyData = new CompanyData();
                    table2.findById(rs1.getInt("id"), user);
                    companyData.companyDataId = user.companyDataId;
                    table3.find(companyData);
                    if (user.registerYear <= year1){
                        sum[row] = sum[row] + Integer.parseInt(companyData.surveyPeople);
                    }
                    if (user.registerYear <= year2){
                        sum2[row] = sum2[row] + Integer.parseInt(companyData.surveyPeople);
                    }
                }
                rs1.close();
                stmt1.close();
                ps1.close();
                connection1.close();
                row++;
            }
            rs.close();
            stmt.close();
            ps.close();
            connection.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    %>
<div class="main-container container no-sidebar">
    <div class="main-content">

        <div class="page-content">
            <div class="row-fluid">
                <!--PAGE CONTENT BEGINS HERE-->
                <div class="content">
                    <div>
                        <form action="/com/springmvc/controller/AnalysisServlet?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" method="post">
                            <table>
                                <tr>
                                    <td>请输入A年年份：</td>
                                    <td><input style="width: 150px;" type="number" value="" name="firstTime"></td>
                                </tr>
                                <tr>
                                    <td>请输入B年年份：</td>
                                    <td><input style="width: 150px;" type="number" value="" name="secondTime"></td>
                                </tr>
                                <tr>
                                    <td>请选择分析方式：</td>
                                    <td>
                                        <select  style="width: 100px" name="analyze" id="analyze">
                                            <option value=""></option>
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
                                            <option value=""></option>
                                            <option value="企业总数">企业总数</option>
                                            <option value="建档期总岗位数">建档期总岗位数</option>
                                            <option value="调查期总岗位数">调查期总岗位数</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                            <button type="submit" >确认</button>
                        </form>
                    </div>
                    <div style="margin: 20px 0 20px 0">
                        <!--展示一个这个时间段内所有调查期的岗位就业人数数据的列表，例如-->
                        <table border="1" width="600px" style="text-align: center;">
                            <!--此行为选择的分析方式-->
                            <!--通过设置-->
                            <!--<tr>
                                <td>城市</td>
                                <td>济南</td>
                                <td>青岛</td>
                                <td>淄博</td>
                                <td>德州</td>
                                <td>烟台</td>
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
                            </tr>-->

                            <tr>
                                <td>企业性质</td>
                                <td>国有企业</td>
                                <td>集体企业</td>
                                <td>联营企业</td>
                                <td>股份合作制企业</td>
                                <td>私营企业</td>
                                <td>个体户</td>
                                <td>合伙企业</td>
                                <td>有限责任公司</td>
                                <td>股份有限公司</td>
                            </tr>
                            <!--<tr>
                                <td>制造业</td>
                                <td>服务业</td>
                            </tr>-->
                            <tr>
                                <td><%=year1%>年调查期岗位总数</td>
                                <td><%=sum[0]%></td>
                                <td><%=sum[1]%></td>
                                <td><%=sum[2]%></td>
                                <td><%=sum[3]%></td>
                                <td><%=sum[4]%></td>
                                <td><%=sum[5]%></td>
                                <td><%=sum[6]%></td>
                                <td><%=sum[7]%></td>
                                <td><%=sum[8]%></td>
                            </tr>
                            <tr>
                                <td><%=year2%>年调查期岗位总数</td>
                                <td><%=sum2[0]%></td>
                                <td><%=sum2[1]%></td>
                                <td><%=sum2[2]%></td>
                                <td><%=sum2[3]%></td>
                                <td><%=sum2[4]%></td>
                                <td><%=sum2[5]%></td>
                                <td><%=sum2[6]%></td>
                                <td><%=sum2[7]%></td>
                                <td><%=sum2[8]%></td>
                            </tr>
                            <!--<tr>
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
                                categories: ['国有企业','集体企业','联营企业','股份合作制企业',
                                    '私营企业','个体户','合伙企业','有限责任公司','股份有限公司']   //选择的分析方式
                            };
                            var yAxis = {
                                title: {
                                    text: '调查期岗位总数'  //选择的分析指标
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
                                    name: '<%=year1%>年',
                                    data: [<%=sum[0]%>, <%=sum[1]%>, <%=sum[2]%>, <%=sum[3]%>, <%=sum[4]%>, <%=sum[5]%>
                                        , <%=sum[6]%>, <%=sum[7]%>, <%=sum[8]%>]
                                },
                                {
                                    name:'<%=year2%>年',
                                    data:[<%=sum2[0]%>, <%=sum2[1]%>, <%=sum2[2]%>, <%=sum2[3]%>, <%=sum2[4]%>, <%=sum2[5]%>
                                        , <%=sum2[6]%>, <%=sum2[7]%>, <%=sum2[8]%>]
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
    <%}else if (choose.equals("31") && request.getParameter("rank").equals("3")){
        int year1 = Integer.parseInt(request.getParameter("firstTime"));
        int year2 = Integer.parseInt(request.getParameter("secondTime"));
        cityTable table = new cityTable();
        companyTable table1 = new companyTable();
        userTable table2 = new userTable();
        companyDataTable table3 = new companyDataTable();
        int[] sum = new int[17], sum2 = new int[17];
        try {
            Connection connection = table1.getConnection();
            String sql = "SELECT distinct industry from companyTable";
            PreparedStatement ps = (com.mysql.jdbc.PreparedStatement) connection.prepareStatement(sql);
            Statement stmt = (com.mysql.jdbc.Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int row = 0;
            while (rs.next()){
                sum[row] = 0;
                sum2[row] = 0;
                String industry = rs.getString("industry");
                Connection connection1 = table1.getConnection();
                String sql1 = "SELECT * from companyTable WHERE industry='" + industry + "'";
                System.out.println(sql1);
                PreparedStatement ps1 = (com.mysql.jdbc.PreparedStatement) connection1.prepareStatement(sql1);
                Statement stmt1 = (com.mysql.jdbc.Statement) connection1.createStatement();
                ResultSet rs1 = stmt1.executeQuery(sql1);
                while (rs1.next()){
                    User user = new User();
                    CompanyData companyData = new CompanyData();
                    table2.findById(rs1.getInt("id"), user);
                    if (user.registerYear <= year1){
                        sum[row] = sum[row] + 1;
                    }
                    if (user.registerYear <= year2){
                        sum2[row] = sum2[row] + 1;
                    }
                }
                rs1.close();
                stmt1.close();
                ps1.close();
                connection1.close();
                row++;
            }
            rs.close();
            stmt.close();
            ps.close();
            connection.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    %>
<div class="main-container container no-sidebar">
    <div class="main-content">

        <div class="page-content">
            <div class="row-fluid">
                <!--PAGE CONTENT BEGINS HERE-->
                <div class="content">
                    <div>
                        <form action="/com/springmvc/controller/AnalysisServlet?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" method="post">
                            <table>
                                <tr>
                                    <td>请输入A年年份：</td>
                                    <td><input style="width: 150px;" type="number" value="" name="firstTime"></td>
                                </tr>
                                <tr>
                                    <td>请输入B年年份：</td>
                                    <td><input style="width: 150px;" type="number" value="" name="secondTime"></td>
                                </tr>
                                <tr>
                                    <td>请选择分析方式：</td>
                                    <td>
                                        <select  style="width: 100px" name="analyze" id="analyze">
                                            <option value=""></option>
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
                                            <option value=""></option>
                                            <option value="企业总数">企业总数</option>
                                            <option value="建档期总岗位数">建档期总岗位数</option>
                                            <option value="调查期总岗位数">调查期总岗位数</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                            <button type="submit" >确认</button>
                        </form>
                    </div>
                    <div style="margin: 20px 0 20px 0">
                        <!--展示一个这个时间段内所有调查期的岗位就业人数数据的列表，例如-->
                        <table border="1" width="600px" style="text-align: center;">
                            <!--此行为选择的分析方式-->
                            <!--通过设置-->
                            <!--<tr>
                                <td>城市</td>
                                <td>济南</td>
                                <td>青岛</td>
                                <td>淄博</td>
                                <td>德州</td>
                                <td>烟台</td>
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
                            </tr>-->

                            <!--<tr>
                                <td>企业性质</td>
                                <td>国有企业</td>
                                <td>集体企业</td>
                                <td>联营企业</td>
                                <td>股份合作制企业</td>
                                <td>私营企业</td>
                                <td>个体户</td>
                                <td>合伙企业</td>
                                <td>有限责任公司</td>
                                <td>股份有限公司</td>
                            </tr>-->
                            <tr>
                                <td>制造业</td>
                                <td>服务业</td>
                            </tr>
                            <tr>
                                <td><%=year1%>年企业总数</td>
                                <td><%=sum[0]%></td>
                            </tr>
                            <tr>
                                <td><%=year2%>年企业总数</td>
                                <td><%=sum2[0]%></td>
                            </tr>
                            <!--<tr>
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
                                categories: ['制造业','服务业']   //选择的分析方式
                            };
                            var yAxis = {
                                title: {
                                    text: '岗位总数'  //选择的分析指标
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
                                    name: '<%=year1%>年',
                                    data: [<%=sum[0]%>, <%=sum[1]%>]
                                },
                                {
                                    name:'<%=year2%>年',
                                    data:[<%=sum2[0]%>, <%=sum2[1]%>]
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
    <%}else if (choose.equals("32") && request.getParameter("rank").equals("3")){
        int year1 = Integer.parseInt(request.getParameter("firstTime"));
        int year2 = Integer.parseInt(request.getParameter("secondTime"));
        cityTable table = new cityTable();
        companyTable table1 = new companyTable();
        userTable table2 = new userTable();
        companyDataTable table3 = new companyDataTable();
        int[] sum = new int[17], sum2 = new int[17];
        try {
            Connection connection = table1.getConnection();
            String sql = "SELECT distinct industry from companyTable";
            PreparedStatement ps = (com.mysql.jdbc.PreparedStatement) connection.prepareStatement(sql);
            Statement stmt = (com.mysql.jdbc.Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int row = 0;
            while (rs.next()){
                sum[row] = 0;
                sum2[row] = 0;
                String industry = rs.getString("industry");
                Connection connection1 = table1.getConnection();
                String sql1 = "SELECT * from companyTable WHERE industry='" + industry + "'";
                System.out.println(sql1);
                PreparedStatement ps1 = (com.mysql.jdbc.PreparedStatement) connection1.prepareStatement(sql1);
                Statement stmt1 = (com.mysql.jdbc.Statement) connection1.createStatement();
                ResultSet rs1 = stmt1.executeQuery(sql1);
                while (rs1.next()){
                    User user = new User();
                    CompanyData companyData = new CompanyData();
                    table2.findById(rs1.getInt("id"), user);
                    companyData.companyDataId = user.companyDataId;
                    table3.find(companyData);
                    if (user.registerYear <= year1){
                        sum[row] = sum[row] + Integer.parseInt(companyData.csPeople);
                    }
                    if (user.registerYear <= year2){
                        sum2[row] = sum2[row] + Integer.parseInt(companyData.csPeople);
                    }
                }
                rs1.close();
                stmt1.close();
                ps1.close();
                connection1.close();
                row++;
            }
            rs.close();
            stmt.close();
            ps.close();
            connection.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    %>
<div class="main-container container no-sidebar">
    <div class="main-content">

        <div class="page-content">
            <div class="row-fluid">
                <!--PAGE CONTENT BEGINS HERE-->
                <div class="content">
                    <div>
                        <form action="/com/springmvc/controller/AnalysisServlet?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" method="post">
                            <table>
                                <tr>
                                    <td>请输入A年年份：</td>
                                    <td><input style="width: 150px;" type="number" value="" name="firstTime"></td>
                                </tr>
                                <tr>
                                    <td>请输入B年年份：</td>
                                    <td><input style="width: 150px;" type="number" value="" name="secondTime"></td>
                                </tr>
                                <tr>
                                    <td>请选择分析方式：</td>
                                    <td>
                                        <select  style="width: 100px" name="analyze" id="analyze">
                                            <option value=""></option>
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
                                            <option value=""></option>
                                            <option value="企业总数">企业总数</option>
                                            <option value="建档期总岗位数">建档期总岗位数</option>
                                            <option value="调查期总岗位数">调查期总岗位数</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                            <button type="submit" >确认</button>
                        </form>
                    </div>
                    <div style="margin: 20px 0 20px 0">
                        <!--展示一个这个时间段内所有调查期的岗位就业人数数据的列表，例如-->
                        <table border="1" width="600px" style="text-align: center;">
                            <!--此行为选择的分析方式-->
                            <!--通过设置-->
                            <!--<tr>
                                <td>城市</td>
                                <td>济南</td>
                                <td>青岛</td>
                                <td>淄博</td>
                                <td>德州</td>
                                <td>烟台</td>
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
                            </tr>-->

                            <!--<tr>
                                <td>企业性质</td>
                                <td>国有企业</td>
                                <td>集体企业</td>
                                <td>联营企业</td>
                                <td>股份合作制企业</td>
                                <td>私营企业</td>
                                <td>个体户</td>
                                <td>合伙企业</td>
                                <td>有限责任公司</td>
                                <td>股份有限公司</td>
                            </tr>-->
                            <tr>
                                <td>制造业</td>
                                <td>服务业</td>
                            </tr>
                            <tr>
                                <td><%=year1%>年建档期岗位总数</td>
                                <td><%=sum[0]%></td>
                            </tr>
                            <tr>
                                <td><%=year2%>年建档期岗位总数</td>
                                <td><%=sum2[0]%></td>
                            </tr>
                            <!--<tr>
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
                                categories: ['制造业','服务业']   //选择的分析方式
                            };
                            var yAxis = {
                                title: {
                                    text: '调查期岗位总数'  //选择的分析指标
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
                                    name: '<%=year1%>年',
                                    data: [<%=sum[0]%>, <%=sum[1]%>]
                                },
                                {
                                    name:'<%=year2%>年',
                                    data:[<%=sum2[0]%>, <%=sum2[1]%>]
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
    <%}else if (choose.equals("33") && request.getParameter("rank").equals("3")){
        int year1 = Integer.parseInt(request.getParameter("firstTime"));
        int year2 = Integer.parseInt(request.getParameter("secondTime"));
        cityTable table = new cityTable();
        companyTable table1 = new companyTable();
        userTable table2 = new userTable();
        companyDataTable table3 = new companyDataTable();
        int[] sum = new int[17], sum2 = new int[17];
        try {
            Connection connection = table1.getConnection();
            String sql = "SELECT distinct industry from companyTable";
            PreparedStatement ps = (com.mysql.jdbc.PreparedStatement) connection.prepareStatement(sql);
            Statement stmt = (com.mysql.jdbc.Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int row = 0;
            while (rs.next()){
                sum[row] = 0;
                sum2[row] = 0;
                String industry = rs.getString("industry");
                Connection connection1 = table1.getConnection();
                String sql1 = "SELECT * from companyTable WHERE industry='" + industry + "'";
                System.out.println(sql1);
                PreparedStatement ps1 = (com.mysql.jdbc.PreparedStatement) connection1.prepareStatement(sql1);
                Statement stmt1 = (com.mysql.jdbc.Statement) connection1.createStatement();
                ResultSet rs1 = stmt1.executeQuery(sql1);
                while (rs1.next()){
                    User user = new User();
                    CompanyData companyData = new CompanyData();
                    table2.findById(rs1.getInt("id"), user);
                    companyData.companyDataId = user.companyDataId;
                    table3.find(companyData);
                    if (user.registerYear <= year1){
                        sum[row] = sum[row] + Integer.parseInt(companyData.surveyPeople);
                    }
                    if (user.registerYear <= year2){
                        sum2[row] = sum2[row] + Integer.parseInt(companyData.surveyPeople);
                    }
                }
                rs1.close();
                stmt1.close();
                ps1.close();
                connection1.close();
                row++;
            }
            rs.close();
            stmt.close();
            ps.close();
            connection.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    %>
<div class="main-container container no-sidebar">
    <div class="main-content">

        <div class="page-content">
            <div class="row-fluid">
                <!--PAGE CONTENT BEGINS HERE-->
                <div class="content">
                    <div>
                        <form action="/com/springmvc/controller/AnalysisServlet?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" method="post">
                            <table>
                                <tr>
                                    <td>请输入A年年份：</td>
                                    <td><input style="width: 150px;" type="number" value="" name="firstTime"></td>
                                </tr>
                                <tr>
                                    <td>请输入B年年份：</td>
                                    <td><input style="width: 150px;" type="number" value="" name="secondTime"></td>
                                </tr>
                                <tr>
                                    <td>请选择分析方式：</td>
                                    <td>
                                        <select  style="width: 100px" name="analyze" id="analyze">
                                            <option value=""></option>
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
                                            <option value=""></option>
                                            <option value="企业总数">企业总数</option>
                                            <option value="建档期总岗位数">建档期总岗位数</option>
                                            <option value="调查期总岗位数">调查期总岗位数</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                            <button type="submit" >确认</button>
                        </form>
                    </div>
                    <div style="margin: 20px 0 20px 0">
                        <!--展示一个这个时间段内所有调查期的岗位就业人数数据的列表，例如-->
                        <table border="1" width="600px" style="text-align: center;">
                            <!--此行为选择的分析方式-->
                            <!--通过设置-->
                            <!--<tr>
                                <td>城市</td>
                                <td>济南</td>
                                <td>青岛</td>
                                <td>淄博</td>
                                <td>德州</td>
                                <td>烟台</td>
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
                            </tr>-->

                            <!--<tr>
                                <td>企业性质</td>
                                <td>国有企业</td>
                                <td>集体企业</td>
                                <td>联营企业</td>
                                <td>股份合作制企业</td>
                                <td>私营企业</td>
                                <td>个体户</td>
                                <td>合伙企业</td>
                                <td>有限责任公司</td>
                                <td>股份有限公司</td>
                            </tr>-->
                            <tr>
                                <td>制造业</td>
                                <td>服务业</td>
                            </tr>
                            <tr>
                                <td><%=year1%>年调查期岗位总数</td>
                                <td><%=sum[0]%></td>
                            </tr>
                            <tr>
                                <td><%=year2%>年调查期岗位总数</td>
                                <td><%=sum2[0]%></td>
                            </tr>
                            <!--<tr>
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
                                categories: ['制造业','服务业']   //选择的分析方式
                            };
                            var yAxis = {
                                title: {
                                    text: '岗位总数'  //选择的分析指标
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
                                    name: '<%=year1%>年',
                                    data: [<%=sum[0]%>, <%=sum[1]%>]
                                },
                                {
                                    name:'<%=year2%>年',
                                    data:[<%=sum2[0]%>, <%=sum2[1]%>]
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
    <%}
    else{
        out.print("您没有该权限");
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
