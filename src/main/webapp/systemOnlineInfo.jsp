<%--
  Created by IntelliJ IDEA.
  User: cheyl
  Date: 2018/3/18 0018
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>系统使用情况</title>

    <meta name="viewpoint" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/tool.css" type="text/css">
    <link rel="stylesheet" href="css/communal.css" type="text/css">
    <link rel="stylesheet" href="css/index.css" type="text/css">
    <link rel="stylesheet" href="css/index_3.8.css" type="text/css">
    <link rel="stylesheet" href="css/index_10.14.css" type="text/css">
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/jquery.placehold.min.js"></script>
    <script type="text/javascript" src="js/koala.min.1.5.js"></script>

    <link rel="stylesheet" href="css/systemNav.css" media="screen" type="text/css">
    <link href="css/companyRecord4.css" type="text/css" rel="stylesheet" media="screen, projection" />
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
<!--header end-->
<!--nav start-->
<%!
    int rank = 0;
    String userid = null;
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
        <li><a href="allUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" >系统管理</a></li>
    </ul>
</div>
<!--nav end-->
<!--leftnav start-->
<!--<div style="text-align:center;clear:both">
    <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
    <script src="/follow.js" type="text/javascript"></script>
</div>-->
<!-- Contenedor -->
<div style="float:left;margin-left: 150px;">
    <ul id="accordion" class="accordion">
        <li>
            <div class="link">上报时限</div>
            <ul class="submenu">
                <li><a href="systemNewTime.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>">新增调查期</a></li>
                <li><a href="systemAlterTime.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>">修改调查期</a></li>
            </ul>
        </li>
        <li>
            <div class="link">用户管理</div>
            <ul class="submenu">
                <li><a href="allUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>">所有用户信息</a></li>
                <li><a href="newUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>">新增用户信息</a></li>
                <li><a href="deleteUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>">删除用户信息</a></li>
                <li><a href="alterUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>&choose=0">修改用户信息</a></li>
            </ul>
        </li>
        <li>
            <div class="link">角色管理</div>
            <ul class="submenu">
                <li><a href="#">定义角色</a></li>
                <li><a href="#">修改角色</a></li>
                <li><a href="#">删除角色</a></li>
            </ul>
        </li>
        <li><div class="link">系统监控</div>
            <ul class="submenu">
                <li><a href="systemInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>">系统信息</a></li>
                <li><a href="systemOnlineInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>">当前使用情况</a></li>
            </ul>
        </li>
    </ul>
</div>
<script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>
<script src="js/systemNav.js"></script>
<!--leftnav end-->

<div class="div2">
    <script>
        var info = allinfo();
        //document.write(info);

        var locator = new ActiveXObject ("WbemScripting.SWbemLocator");
        var service = locator.ConnectServer(".");
        info = pcInfo();

        document.write(info);

        //获取浏览器相关信息
        function allinfo(){
            var userLanguage = navigator.userLanguage;     // 用户在自己的操作系统上设置的语言（火狐没有）
            var userAgent = navigator.userAgent;   //包含以下属性中所有或一部分的字符串：appCodeName,appName,appVersion,language,platform
            var systemLanguage = navigator.systemLanguage;    // 用户操作系统 支持的默认语言（火狐没有）

            info+="浏览器属性信息： "+userAgent+"<br />";
            info+="用户设置的操作系统语言： "+userLanguage+"<br />";
            info+="操作系统支持的默认语言： "+systemLanguage+"<br />";
            return info;
        }

        /******************************************以上为浏览器信息，以下为pc信息************************************************/

        function cpuInfo() {//CPU 信息
            var properties = service.ExecQuery("SELECT * FROM Win32_Processor");
            var e = new Enumerator (properties);
            var info = "<table>";
            info+="<tr style='font-weight: bold;' ><td width='450' >CPU 信息</td></tr>";
            for (;!e.atEnd();e.moveNext ()) {
                var p = e.item ();
                info+="<tr><td >CPU序列号:" + p.ProcessorID + "</td></tr>";
                info+="<tr><td >"+p.Caption+"</td></tr>";
                info+="<tr><td >CPU编号："+p.DeviceID+"</td></tr>";
                info+="<tr><td >CPU型号：" + p.Name + "</td></tr>";
                info+="<tr><td >CPU状态：" + p.CpuStatus + "</td></tr>";
                info+="<tr><td >CPU可用性：" + p.Availability + "</td></tr>";
                info+="<tr><td >CUP Level：" + p.Level + "</td></tr>";
                info+="<tr><td >主机名称：" + p.SystemName + "</td></tr>";
                info+="<tr><td >Processor Type：" + p.ProcessorType + "</td></tr>";
            }
            info+="</table>";
            return info;
        }
        function diskDrive() {//硬盘信息
            var properties = service.ExecQuery("SELECT * FROM Win32_DiskDrive");
            var e = new Enumerator (properties);
            var info="<table>";
            info+="<tr style='font-weight: bold;'><td width='450'>硬盘信息 </td></tr>";
            for (;!e.atEnd();e.moveNext ()) {
                var p = e.item ();
                info+="<tr><td >DeviceID：" + p.DeviceID + "</td></tr>";
                info+="<tr><td >Caption：" + p.Caption + "</td></tr>";
                info+="<tr><td >Name：" + p.Name + "</td></tr>";
                info+="<tr><td >Drive：" + p.Drive + "</td></tr>";
                info+="<tr><td > Description：" + p.Description + "</td></tr>";
                info+="<tr><td > Status：" + p. Status + "</td></tr>";
                info+="<tr><td > SerialNumber：" + p.SerialNumber + "</td></tr>";
                info+="<tr><td > InterfaceType：" + p.InterfaceType + "</td></tr>";
                info+="<tr><td > Model：" + p.Model + "</td></tr>";
                info+="<tr><td > Index：" + p.Index + "</td></tr>";
                info+="<tr><td>Size："+p.Size+"</td></tr>"
            }
            info+="</table>";
            return info;
        }
        //获取Ram信息
        function raminfo(){
            var system=new Enumerator (service.ExecQuery("SELECT * FROM Win32_ComputerSystem")).item();
            var physicMenCap=Math.ceil(system.TotalPhysicalMemory/1024/1024);   //内存信息
            var memory = new Enumerator (service.ExecQuery("SELECT * FROM Win32_PhysicalMemory"));
            for (var mem=[],i=0;!memory.atEnd();memory.moveNext()){
                mem[i++]={cap:memory.item().Capacity/1024/1024,speed:memory.item().Speed};
            }
            var info="<table>";
            info+="<tr style='font-weight: bold;' ><td width='450'>内存信息 </td></tr>";
            info+="<tr><td >内存总量：";
            memDX = 0;
            for(var mi=0;mi<mem.length;mi++){
                memDX += mem[mi].cap;
            }
            info+= memDX + "M</td></tr>";
            info+="<tr><td >可用物理内存：" +physicMenCap + "M</td></tr>";
            info+="</table>";
            return info;
        }


        //获取网络连接信息
        function ipinfo(){
            var properties = service.ExecQuery("SELECT * FROM Win32_NetworkAdapterConfiguration Where IPEnabled=TRUE");
            var e = new Enumerator (properties);
            var info="<table>";
            info+="<tr style='font-weight: bold;' ><td width='450'>网络连接信息：</td></tr>";
            var i=1;
            for (;!e.atEnd();e.moveNext ()){
                var p = e.item ();
                info+="<tr><td >MAC地址"+i+"：" + p.MACAddress + "</td></tr>";
                info+="<tr><td >IP地址"+i+"：" + p.IPAddress(0) + "</td></tr>";
                i++;
            }
            info+="</table>";
            return info;
        }
        /*
        fnShowPrcName("Win32_StartupCommand")   // 系统自动启动程序
        */

        function pcInfo() { //所有信息
            var info=cpuInfo();
            info+=raminfo();
            info+= diskDrive();
            info+=ipinfo();
            return info;
        }
    </script>
</div>

<!--footer start-->
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
<!--footer end-->
</body>
</html>
