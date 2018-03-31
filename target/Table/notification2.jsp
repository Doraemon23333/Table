<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.springmvc.entity.Notification" %>
<%@ page import="com.springmvc.service.notificationTable" %><%--
  Created by IntelliJ IDEA.
  User: zfr
  Date: 2018/3/25
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <title>消息详情页面</title>
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
<%! String userid = null;
    Notification notification = null;%>
<%
    String id = request.getParameter("id");
    userid = id;
    String rank = request.getParameter("rank");
    String noid = request.getParameter("notification_id");
    notification = new Notification();
    notification.notification_id = Integer.parseInt(noid);
    //out.println(notification.notification_id);
    notificationTable table = new notificationTable();
    table.find(notification);
%>
<!--nav start-->
<div class="nav-box">
    <ul class="container nav">
        <li><a href="provincehome.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>">首页</a></li>
        <li><a href="province2.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>&choose=0">企业信息</a></li>
        <li><a href="province3.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0">岗位数据</a></li>
        <li><a href="allUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>" >系统管理</a></li>
        <li><a href="/com/springmvc/controller/BingtuServlet?id=<%=request.getParameter("id") %>&rank=<%=request.getParameter("rank")%>">取样分析</a></li>
        <li><a href="/com/springmvc/controller/TrendServlet?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" >趋势分析</a></li>
        <li><a href="compareAnalysis.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" >对比分析</a></li>
        <li><a href="/">退出</a></li>
    </ul>
</div>

<div class="index-main index_box pt15">


    <!--切换新闻 start-->
    <div class="index-header">

        <div id="switchable" class="container">

            <div >
                <ul>
                    <li>
                        <ul>
                            <li>
                                &nbsp;
                                <div class="clearfix">
                                    <div class="slider-img"></div>
                                    <div class="slider-text">
                                        <h3 class="title-h3" align="center"><a style="color:#296b9b"><%=notification.title%></a></h3>
                                        <p><font size="3"><%=notification.content%></font></p>

                                    </div>
                                    <%
                                        if (notification.type == 1){%>
                                            <table border="0" align="center" width="500">
                                                <tr>
                                                    <td><a href="/com/springmvc/controller/CityJudgeDataServlet?end=1&id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&notificationId=<%=notification.notification_id%>">批准</a></td>
                                                    <td><a href="/com/springmvc/controller/CityJudgeDataServlet?end=0&id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&notificationId=<%=notification.notification_id%>">退回</a></td>
                                                </tr>
                                            </table>
                                        <%}
                                    %>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>

    </div>
</div>

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

