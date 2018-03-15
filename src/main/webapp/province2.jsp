<%--
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
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.css">
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap-theme.css">
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
<div class="nav-box">
    <ul class="container nav">
        <li><a href="provincehome.jsp">首页</a></li>
        <li><a href="province1.jsp">企业信息</a></li>
        <li><a href="/">岗位数据</a></li>
        <li><a href="/" >系统管理</a></li>
    </ul>
</div>
<!--nav end-->
<!--body start-->


<div class="choose">
    <td>请选择您要查找的企业</td>
</div>
<div class="info">
    <td>地区：</td>
    <select name="Place" id="thisPlace" class="City" >
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
    <td>&nbsp &nbsp &nbsp &nbsp 企业性质：</td>
    <select class="Xingzhi" >
        <option value="国有企业" >国有企业</option>
        <option value="集体企业" >集体企业</option>
        <option value="联营企业">联营企业</option>
        <option value="股份合作制企业">股份合作制企业</option>
        <option value="私营企业">私营企业</option>
        <option value="个体户">个体户</option>
        <option value="合伙企业">合伙企业</option>
        <option value="有限责任公司">有限合作公司</option>
        <option value="股份有限公司">股份有限公司</option>
    </select>
    <td>&nbsp &nbsp &nbsp &nbsp 所属行业：</td>
    <select class="Hangye" >
        <option value="制造业" >制造业</option>
        <option value="服务业" >服务业</option>
    </select>
    <td>&nbsp &nbsp &nbsp &nbsp 精确搜索：</td>
    <input type="text" id="num" name="Num" style="height: 30px;"value="请输入企业名称或编号" onfocus="javascript:if(this.value=='请输入企业名称或编号')this.value='';"/>
    <button class="search">搜索</button>
    </div>
<div class="result"></div>
</body>
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
