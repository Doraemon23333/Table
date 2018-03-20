<%@ page import="com.springmvc.service.companyDataTable" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.mysql.jdbc.PreparedStatement" %>
<%@ page import="com.mysql.jdbc.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page import="com.springmvc.entity.CompanyData" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %><%--
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
<script language=javascript>
    function winclose() {
//此处填写要处理的逻辑代码
        window.opener.location.reload();//刷新
    }
</script>
<!--header end-->
<!--nav start-->
<div class="nav-box">
    <ul class="container nav">
        <li><a href="companyhome.jsp?id=<%=request.getParameter("id")%>">首页</a></li>
        <li><a href="companyRecordInfo.jsp?id=<%=request.getParameter("id")%>">备案信息</a></li>
        <li><a href="companyDataInsert.jsp?id=<%=request.getParameter("id")%>">数据填报</a></li>
        <li><a href="companyDataSelect.jsp?id=<%=request.getParameter("id")%>&choose=0">数据查询</a></li>
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
                    <form action="/com/springmvc/controller/DataSelectServlet?id=<%=request.getParameter("id")%>" method="post" class="form-horizontal" >

                        <table class="table table-striped">

                            <tr class="">
                                <td><b>选择调查期：</b></td>
                                <td>
                                    <input type="date" id="inspectTime" name="inspectTime" value="2018-03-15"
                                    style="height:30px;"/>
                                </td>
                                <td>
                                    <button type="submit" onclick="winclose()">选择</button>
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
<%
    String choose = request.getParameter("choose");
    if (choose.equals("0")){

    }else {
        String y = request.getParameter("year");
        String m = request.getParameter("mouth");
        String d = request.getParameter("day");
        int year = Integer.parseInt(y);
        int mouth = Integer.parseInt(m);
        int day = Integer.parseInt(d);
        companyDataTable table = new companyDataTable();
        List<CompanyData> companyDataList = new ArrayList<CompanyData>();
        String sql = "SELECT * FROM companyDataTable WHERE accountYear=" + year + " AND accountMonth=" + mouth + " AND accountDay=" + day + " AND id=" + request.getParameter("id");
        System.out.println(sql);
        try{
            Connection conn = table.getConnection();
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
            Statement stmt = (Statement) conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()){
                CompanyData companyData = new CompanyData();
                companyData.csPeople = rs.getString("csPeople");
                companyData.surveyPeople = rs.getString("surveyPeople");
                companyData.addition = rs.getString("addition");
                companyData.reduceType = rs.getString("reduceType");
                companyData.mainReason = rs.getString("mainReason");
                companyData.mR_instruction = rs.getString("mR_instruction");
                companyData.secondReason = rs.getString("secondReason");
                companyData.sR_instruction = rs.getString("sR_instruction");
                companyData.thirdReason = rs.getString("thirdReason");
                companyData.tR_instruction = rs.getString("tR_instruction");
                companyData.accountSeason = rs.getInt("accountSeason");
                companyDataList.add(companyData);
            }
            if (companyDataList.size() == 0){%>
                未发现任何数据
            <%}else {%>
<table border="2" align="center" width="1500">
    <tr>
        <td>建档期就业人数</td>
        <td>调查期就业人数</td>
        <td>其他原因</td>
        <td>就业人数减少类型</td>
        <td>主要原因</td>
        <td>主要原因说明</td>
        <td>次要原因</td>
        <td>次要原因说明</td>
        <td>第三原因</td>
        <td>第三原因说明</td>
        <td>本年度季度</td>
    </tr>
    <%
        for (CompanyData companyData: companyDataList){
    %>
    <tr>
        <td><%=companyData.csPeople%></td>
        <td><%=companyData.surveyPeople%></td>
        <td><%=companyData.addition%></td>
        <td><%=companyData.reduceType%></td>
        <td><%=companyData.mainReason%></td>
        <td><%=companyData.mR_instruction%></td>
        <td><%=companyData.secondReason%></td>
        <td><%=companyData.sR_instruction%></td>
        <td><%=companyData.thirdReason%></td>
        <td><%=companyData.tR_instruction%></td>
        <td><%=companyData.accountSeason%></td>
    </tr>
    <%}%>
</table>
            <%}
        }catch (Exception e){
            e.printStackTrace();
        }
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
