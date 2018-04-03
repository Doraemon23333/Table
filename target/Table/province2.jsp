<%@ page import="com.springmvc.entity.Company" %>
<%@ page import="com.springmvc.entity.User" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.mysql.jdbc.PreparedStatement" %>
<%@ page import="com.mysql.jdbc.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.springmvc.entity.Role" %>
<%@ page import="com.springmvc.service.*" %>
<%@ page import="com.springmvc.other.AreaCode" %><%--
  Created by IntelliJ IDEA.
  User: 工业
  Date: 2018/3/15
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询企业</title>
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
</head>
<body>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
    int userid = 0;
    int rank = 0;
    String choose = null;
%>
<%
    String id = request.getParameter("id");
    userid = Integer.parseInt(id);
    String a = request.getParameter("rank");
    rank = Integer.parseInt(a);
%>
<div class="nav-box">
    <ul class="container nav">
        <li><a href="provincehome.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">首页</a></li>
        <li><a href="province2.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0">企业信息</a></li>
        <li><a href="province3.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0">岗位数据</a></li>
        <li><a href="allUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" >系统管理</a></li>
        <li><a href="/com/springmvc/controller/BingtuServlet?id=<%=request.getParameter("id") %>&rank=<%=request.getParameter("rank")%>">取样分析</a></li>
        <li><a href="trend.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0" >趋势分析</a></li>
        <li><a href="compareAnalysis.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0" >对比分析</a></li>
        <li><a href="/">退出</a></li>
    </ul>
</div>
<!--nav end-->
<!--body start-->
<form action="/com/springmvc/controller/SearchCompanyServlet?id=<%=userid%>&rank=<%=request.getParameter("rank")%>" method="post">
<div class="choose"><td>请选择您要查找的企业</td></div>
<div class="info">
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
    <td>&nbsp;&nbsp;&nbsp;&nbsp;精确查找：</td>
    <input type="text" id="num" name="num" style="height: 30px;"value="企业名称或编号" onfocus="javascript:if(this.value=='企业名称或编号')this.value='';"/>
    <button class="search" type="submit">查找</button>
</div>
</form>
<%!
    User user = new User();
    List <Company> companies;
%>
<%
    choose = request.getParameter("choose");
    userTable table = new userTable();
    if (choose.equals("0")){
        if (rank == 3){
            RoleTable roleTable = new RoleTable();
            Role role = new Role();
            userTable tableU = new userTable();
            User user = new User();
            tableU.findById(Integer.parseInt(id), user);
            role.id = user.id;
            roleTable.findbyId(role);
            if (role.ifroot == 1 || role.SearchCompany == 1){
                provinceTable table1 = new provinceTable();
                table1.findById(Integer.parseInt(id), user);
                companies = new ArrayList<Company>();
                Connection conn = table.getConnection();
                String sql = "select * from companyTable";
                PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
                Statement stmt = (Statement) conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                while(rs.next()){
                    Company com = new Company();
                    User userC = new User();
                    com.originalArea = rs.getString("originalArea");
                    com.id = rs.getInt("id");
                    table.findById(com.id, userC);
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
                    if (userC.rank == 1 && userC.usingCondition.equals("online"))
                        companies.add(com);
                }
                rs.close();
                stmt.close();
                ps.close();
                conn.close();
            }
            else {

            }
        }else if (rank == 2){
            cityTable table1 = new cityTable();
            table1.findById(userid, user);
            companies = new ArrayList<Company>();
            Connection conn = table.getConnection();
            String sql = "select * from companyTable WHERE originalArea='" + user.area + "'";
            System.out.println(sql);
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
            Statement stmt = (Statement) conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                Company com = new Company();
                com.originalArea = rs.getString("originalArea");
                com.id = rs.getInt("id");
                User userC = new User();
                table.findById(com.id, userC);
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
                if (userC.usingCondition.equals("online"))
                    companies.add(com);
            }
            rs.close();
            stmt.close();
            ps.close();
            conn.close();
        }
    }else if (choose.equals("1")){
        AreaCode areaCode = new AreaCode();
        String originalArea = areaCode.toChinese(request.getParameter("originalArea"));
        String enterprisesNature = areaCode.codeToEnterpriseNature(request.getParameter("enterprisesNature"));
        String industry = areaCode.codiToIndustry(request.getParameter("industry"));
        //System.out.println("originalArea = " + originalArea + ", enterprisesNature = " + enterprisesNature + ", industry=" + industry);
        if (rank == 3){
            RoleTable roleTable = new RoleTable();
            Role role = new Role();
            userTable tableU = new userTable();
            User user = new User();
            tableU.findById(Integer.parseInt(id), user);
            role.id = user.id;
            roleTable.findbyId(role);
            if (role.ifroot == 1 || role.SearchCompany == 1){
                provinceTable table1 = new provinceTable();
                table1.findById(Integer.parseInt(id), user);
                companies = new ArrayList<Company>();
                Connection conn = table.getConnection();
                String sql = null;
                if((originalArea.equals("fail") == false) && (enterprisesNature.equals("fail") == false) && (industry.equals("fail") == false)){
                    sql = "select * from companyTable where enterprisesNature='" + enterprisesNature +
                            "' and industry='" + industry +
                            "' and originalArea='" + originalArea + "'";
                }else if ((originalArea.equals("fail") == false) && (enterprisesNature.equals("fail") == false) && industry.equals("fail")){
                    sql = "select * from companyTable where enterprisesNature='" + enterprisesNature +
                            "' and originalArea='" + originalArea + "'";
                }else if ((originalArea.equals("fail") == false) && enterprisesNature.equals("fail") && (industry.equals("fail") == false)){
                    sql = "select * from companyTable industry='" + industry +
                            "' and originalArea='" + originalArea + "'";
                }else if (originalArea.equals("fail") && (enterprisesNature.equals("fail") == false) && (industry.equals("fail") == false)){
                    sql = "select * from companyTable where enterprisesNature='" + enterprisesNature +
                            "' and industry='" + industry + "'";
                }else if (originalArea.equals("fail") && enterprisesNature.equals("fail") && (industry.equals("fail") == false)){
                    sql = "select * from companyTable where industry='" + industry + "'";
                }else if (originalArea.equals("fail") && (enterprisesNature.equals("fail") == false) && industry.equals("fail")){
                    sql = "select * from companyTable where enterprisesNature='" + enterprisesNature + "'";
                }else if ((originalArea.equals("fail") == false) && enterprisesNature.equals("fail") && industry.equals("fail")){
                    sql = "select * from companyTable WHERE originalArea='" + originalArea + "'";
                }else {
                    sql = "select * from companyTable WHERE id=0";
                }
                System.out.println(sql);
                PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
                Statement stmt = (Statement) conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                while(rs.next()){
                    Company com = new Company();
                    User userC = new User();
                    com.originalArea = rs.getString("originalArea");
                    com.id = rs.getInt("id");
                    table.findById(com.id, userC);
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
                    if (userC.rank == 1 && userC.usingCondition.equals("online"))
                        companies.add(com);
                }
                rs.close();
                stmt.close();
                ps.close();
                conn.close();
            }
            else {

            }
        }else if (rank == 2){
            cityTable table1 = new cityTable();
            table1.findById(userid, user);
            companies = new ArrayList<Company>();
            if (user.area.equals(originalArea) || originalArea.equals("fail")){
                Connection conn = table.getConnection();
                String sql = null;
                if((originalArea.equals("fail") == false) && (enterprisesNature.equals("fail") == false) && (industry.equals("fail") == false)){
                    sql = "select * from companyTable where enterprisesNature='" + enterprisesNature +
                            "' and industry='" + industry +
                            "' and originalArea='" + originalArea + "' AND originalArea='" + user.area + "'";
                }else if ((originalArea.equals("fail") == false) && (enterprisesNature.equals("fail") == false) && industry.equals("fail")){
                    sql = "select * from companyTable where enterprisesNature='" + enterprisesNature +
                            "' and originalArea='" + originalArea + "' AND originalArea='" + user.area + "'";
                }else if ((originalArea.equals("fail") == false) && enterprisesNature.equals("fail") && (industry.equals("fail") == false)){
                    sql = "select * from companyTable industry='" + industry +
                            "' and originalArea='" + originalArea + "' AND originalArea='" + user.area + "'";
                }else if (originalArea.equals("fail") && (enterprisesNature.equals("fail") == false) && (industry.equals("fail") == false)){
                    sql = "select * from companyTable where enterprisesNature='" + enterprisesNature +
                            "' and industry='" + industry + "' AND originalArea='" + user.area + "'";
                }else if (originalArea.equals("fail") && enterprisesNature.equals("fail") && (industry.equals("fail") == false)){
                    sql = "select * from companyTable where industry='" + industry + "' AND originalArea='" + user.area + "'";
                }else if (originalArea.equals("fail") && (enterprisesNature.equals("fail") == false) && industry.equals("fail")){
                    sql = "select * from companyTable where enterprisesNature='" + enterprisesNature + "' AND originalArea='" + user.area + "'";
                }else if ((originalArea.equals("fail") == false) && enterprisesNature.equals("fail") && industry.equals("fail")){
                    sql = "select * from companyTable WHERE originalArea='" + originalArea + "' AND originalArea='" + user.area + "'";
                }else {
                    sql = "select * from companyTable WHERE id=0 AND originalArea='" + user.area + "'";
                }
                System.out.println(sql);
                PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
                Statement stmt = (Statement) conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                while(rs.next()){
                    Company com = new Company();
                    com.originalArea = rs.getString("originalArea");
                    com.id = rs.getInt("id");
                    User userC = new User();
                    table.findById(com.id, userC);
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
                    if (userC.usingCondition.equals("online"))
                        companies.add(com);
                }
                rs.close();
                stmt.close();
                ps.close();
                conn.close();
            }
        }
    }
%>



<table border="2" align="center" width="1200">
    <tr>
        <td>城市</td>
        <td>企业性质</td>
        <td>所属行业</td>
        <td>企业名称</td>
        <td>企业编码</td>
        <td>详细信息</td>
    </tr>
    <%
        if (companies != null)
        for (Company company1: companies){
    %>
    <tr>
        <td><%=company1.originalArea%></td>
        <td><%=company1.enterprisesNature%></td>
        <td><%=company1.industry%></td>
        <td><%=company1.name%></td>
        <td><%=company1.nameCode%></td>
        <td><a href="/province1.jsp?id=<%=userid%>&rank=<%=rank%>&companyid=<%=company1.id%>">查看</a></td>
    </tr>
    <%}%>
</table>
<div class="result"></div>
<!--body end-->
<!--footer start-->
<link rel="stylesheet" href="/css/nav.css?var=123456789" type="text/css">
<script type="text/javascript">
    $(document).ready(function() {


        //导航
        $(".mainProNav dl dt").click(function() {
            $(".mainProNav dl").removeClass("dlHover");
            $(this).parent().addClass("dlHover");
            $("#of_whole").removeClass("of_whole2");
            $("#of_whole").addClass("of_whole");
        })
        $(".mainProNav").hover(function() {
            $(this).addClass("mainProNavHover");
        },function() {
            $(this).removeClass("mainProNavHover");
            $(".mainProNav dl").removeClass("dlHover");
            $("#of_whole").removeClass("of_whole");
            $("#of_whole").addClass("of_whole2");
        })

    });

</script>
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
<!--悬浮 start-->
<!--<div class="left-fixed-tool"> <a class="top-a" href="#">索引<br>
  	服务</a> <a class="box-a" href="#">站点<br>
  	日历</a> <a class="box-b" href="#">智能<br>
  	人社</a> <a class="bottom-a" href="#">渠道<br>
  	媒体</a></div>-->
<!--悬浮 end-->
<script>
    function searchsy(){
        var searchContent=document.getElementById("serachAllsy").value;
        window.location.href='/includes/search_all.html?title='+escape(searchContent);
    }
    function search2(e){
        window.location.href='/includes/search_all.html?title='+escape(e);
    }
</script>
<script src="js/switchable.js"></script>
<script src="js/forweb.js"></script>
<script src="js/sdrs.js"></script>
<script src="js/title.js"></script>
<!--footer end-->
</body>
</html>
