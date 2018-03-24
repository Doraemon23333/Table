<%--
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
        <li><a href="province2.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">企业信息</a></li>
        <li><a href="province3.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">岗位数据</a></li>
        <li><a href="allUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">系统管理</a></li>
    </ul>
</div>
<!--nav end-->
<!--body start-->
<div class="choose"><td>请选择您要查找的数据</td></div>
<div class="info">
    <td>城市：</td>
    <select class="City" name="Place" id="thisPlace" >
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
        <option value="制造业" >制造业</option>
        <option value="服务业" >服务业</option>
    </select>

    <td>&nbsp;&nbsp;&nbsp;&nbsp;开始时间：</td>
    <select class="Start" name="ks" id="ks" >
        <option value="本月" >本月</option>
        <option value="上个月" >上个月</option>
    </select>



    <td>&nbsp;&nbsp;&nbsp;&nbsp;精确查找：</td>
    <input type="text" id="num" name="num" style="height: 30px;"value="企业名称或编号" onfocus="javascript:if(this.value=='企业名称或编号')this.value='';"/>
    <button class="search" type="submit">查找</button>
</div>
</body>
</html>