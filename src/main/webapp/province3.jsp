<%@ page import="com.springmvc.service.companyTable" %>
<%@ page import="java.util.List" %>
<%@ page import="com.springmvc.entity.Company" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.mysql.jdbc.PreparedStatement" %>
<%@ page import="com.mysql.jdbc.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.springmvc.service.companyDataTable" %>
<%@ page import="com.springmvc.entity.CompanyData" %>
<%@ page import="com.springmvc.other.AreaCode" %>
<%@ page import="com.springmvc.service.userTable" %>
<%@ page import="com.springmvc.entity.User" %>
<%@ page import="com.springmvc.service.cityTable" %><%--
  Created by IntelliJ IDEA.
  User: 工业
  Date: 2018/3/23
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Data</title>
    <style>
        .choose{
            font-size: 30px;
            font-family: "微软雅黑 Light";
            text-align: center;
            color: #1e347b;
            position: relative;
            height: 50px;
        }
        .City{
            width: 80px;
        }
        .info{
            font-size: medium;
            font-family: "微软雅黑 Light";
            color: #1e347b;
            position: relative;
            left: 70px;
        }
        .Xingzhi{
            width: 150px;
        }
        .Hangye{
            width: 80px;
            height: 25px;
        }
        .search{
            width: 50px;
            height: 25px;
        }
        .result{
            height: 400px;
        }
    </style>
    <head lang="en">
        <title>山东省人力资源市场数据采集系统</title>
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
</head>
<body>
<!--header start-->
<script>
    function search(){
        var searchContent=document.getElementById("serachAll").value;
        window.location.href='/includes/search_all.html?title='+escape(searchContent);
    }
    function search2(e){
        window.location.href='/includes/search_all.html?title='+escape(e);
    }
</script>
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
<%!
    String userid = null;
    int rank = 0;
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
        <li><a href="allUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">系统管理</a></li>
        <li><a href="/com/springmvc/controller/BingtuServlet?id=<%=request.getParameter("id") %>&rank=<%=request.getParameter("rank")%>">取样分析</a></li>
        <li><a href="trend.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" >趋势分析</a></li>
        <li><a href="/">退出</a></li>
    </ul>
</div>
<!--nav end-->
<!--body start-->
<div class="main-container container no-sidebar">
    <div class="main-content">

        <div class="page-content">
            <div class="row-fluid">
                <!--PAGE CONTENT BEGINS HERE-->
                <div class="content">
                    <div >

                    </div>
                    <div id="container" style="width: 1000px; height: 400px; margin: 0 auto">
<div class="choose"><td>请选择您要查找的数据</td></div>
<div class="info">
    <form action="/com/springmvc/controller/ManageDataServlet?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" method="post">
    <td>城市：</td>
    <select class="City" name="Place" id="thisPlace" >
        <option value=""></option>
        <option value="济南" >济南</option>
        <option value="青岛" >青岛</option>
        <option value="淄博">淄博</option>
        <option value="德州">德州</option>
        <option value="烟台">烟台</option>
        <option value="潍坊">潍坊</option>
        <option value="济宁">济宁</option>
        <option value="泰安">泰安</option>
        <option value="临沂">临沂</option>
        <option value="菏泽">菏泽</option>
        <option value="滨州">滨州</option>
        <option value="东营">东营</option>
        <option value="威海">威海</option>
        <option value="枣庄">枣庄</option>
        <option value="日照">日照</option>
        <option value="莱芜">莱芜</option>
        <option value="聊城">聊城</option>
    </select>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;企业性质：</td>
    <select class="Xingzhi" name="xz" id="xz" >
        <option value=""></option>
        <option value="国有企业" >国有企业</option>
        <option value="集体企业" >集体企业</option>
        <option value="联营企业">联营企业</option>
        <option value="股份合作制企业">股份合作制企业</option>
        <option value="私营企业">私营企业</option>
        <option value="个体户">个体户</option>
        <option value="合伙企业">合伙企业</option>
        <option value="有限责任公司">有限责任公司</option>
    </select>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;所属行业：</td>
    <select class="Hangye" name="hy" id="hy" >
        <option value=""></option>
        <option value="制造业" >制造业</option>
        <option value="服务业" >服务业</option>
    </select>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;开始时间：</td>
    <select class="Start" name="ks" id="ks" >
        <option value=""></option>
        <option value="1" >1月</option>
        <option value="2" >2月</option>
        <option value="3" >3月</option>
        <option value="4" >4月</option>
        <option value="5" >5月</option>
        <option value="6" >6月</option>
        <option value="7" >7月</option>
        <option value="8" >8月</option>
        <option value="9" >9月</option>
        <option value="10" >10月</option>
        <option value="11" >11月</option>
        <option value="12" >12月</option>
    </select>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;精确查找：</td>
    <input type="text" id="num" name="num" style="height: 30px;"value="企业名称或编号" onfocus="javascript:if(this.value=='企业名称或编号')this.value='';"/>
    <button class="search" type="submit">查找</button>
    </form>
</div>
<%
    String choose = request.getParameter("choose");
    if (choose.equals("1")){
        User user = new User();
        String place = request.getParameter("placecode");
        String enterpriseNature = request.getParameter("enterpriseNaturecode");
        String industry = request.getParameter("industrycode");
        int year = Integer.parseInt(request.getParameter("year"));
        int month = Integer.parseInt(request.getParameter("month"));
        companyTable table = new companyTable();
        List<Company> companies = new ArrayList<Company>();
        Connection connection = table.getConnection();
        AreaCode areaCode = new AreaCode();
        String sql = "select * from companyTable where enterprisesNature='" + areaCode.codeToEnterpriseNature(enterpriseNature) +
                "' and industry='" + areaCode.codiToIndustry(industry) +
                "' and originalArea='" + areaCode.toChinese(place) + "'";
        //System.out.println(sql);
        PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
        Statement stmt = (Statement) connection.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()){
            Company com = new Company();
            com.originalArea = rs.getString("originalArea");
            com.id = rs.getInt("id");
            com.name = rs.getString("name");
            com.nameCode = rs.getString("nameCode");
            com.enterprisesNature = rs.getString("enterprisesNature");
            com.industry = rs.getString("industry");
            com.mainBusiness = rs.getString("mainBusiness");
            com.People = rs.getString("People");
            com.Address = rs.getString("Address");
            com.postalCode = rs.getString("postalCode");
            com.telephone = rs.getString("telephone");
            com.fax = rs.getString("fax");
            com.email = rs.getString("email");
            if (rank == 2){
                cityTable citytable = new cityTable();
                citytable.findById(Integer.parseInt(userid), user);
                if (com.originalArea.equals(user.area))
                    companies.add(com);
            }else {
                companies.add(com);
            }
        }
        rs.close();
        stmt.close();
        ps.close();
        connection.close();

        companyDataTable table1 = new companyDataTable();
        List<CompanyData> companyDataList = new ArrayList<CompanyData>();
        for (Company company: companies){
            Connection connection1 = table1.getConnection();
            String sql1 = "select * from companyDataTable where id=" + company.id;
            System.out.println(sql1);
            PreparedStatement ps1 = (PreparedStatement) connection1.prepareStatement(sql1);
            Statement stmt1 = (Statement) connection1.createStatement();
            ResultSet rs1 = stmt1.executeQuery(sql1);
            while (rs1.next()){
                CompanyData companyData = new CompanyData();
                companyData.id = rs1.getInt("id");
                companyData.csPeople = rs1.getString("csPeople");
                companyData.surveyPeople = rs1.getString("surveyPeople");
                companyData.addition = rs1.getString("addition");
                companyData.reduceType = rs1.getString("reduceType");
                companyData.mainReason = rs1.getString("mainReason");
                companyData.mR_instruction = rs1.getString("mR_instruction");
                companyData.secondReason = rs1.getString("secondReason");
                companyData.sR_instruction = rs1.getString("sR_instruction");
                companyData.thirdReason = rs1.getString("thirdReason");
                companyData.tR_instruction = rs1.getString("tR_instruction");
                companyData.accountYear = rs1.getInt("accountYear");
                companyData.accountMonth = rs1.getInt("accountMonth");
                companyData.accountDay = rs1.getInt("accountDay");
                companyData.accountSeason = rs1.getInt("accountSeason");
                companyData.company = company;
                if (companyData.accountYear == year && companyData.accountMonth == month){
                    companyDataList.add(companyData);
                }
            }
            rs1.close();
            stmt1.close();
            ps1.close();
            connection1.close();
        }
if (companyDataList.size()>0){%>
<table border="2" align="center" width="1200">
    <tr>
        <td>企业名称</td>
        <td>企业性质</td>
        <td>所属行业</td>
        <td>建档期就业人数</td>
        <td>调查期就业</td>
        <td>其他原因</td>
        <td>就业人数减少类型</td>
        <td>年</td>
        <td>月</td>
        <td>日</td>
        <td>详细信息</td>
    </tr>
<%
        for (CompanyData companyData: companyDataList){
%>
    <tr>
        <td><%=companyData.company.name%></td>
        <td><%=companyData.company.enterprisesNature%></td>
        <td><%=companyData.company.industry%></td>
        <td><%=companyData.csPeople%></td>
        <td><%=companyData.surveyPeople%></td>
        <td><%=companyData.addition%></td>
        <td><%=companyData.reduceType%></td>
        <td><%=companyData.accountYear%></td>
        <td><%=companyData.accountMonth%></td>
        <td><%=companyData.accountDay%></td>
        <td><a href="#">查看</a></td>
    </tr>
    <%}
        }
    }
%>
</table></div>
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