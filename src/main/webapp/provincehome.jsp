<%@ page import="java.util.List" %>
<%@ page import="com.springmvc.entity.Notification" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.springmvc.service.notificationTable" %>
<%@ page import="com.mysql.jdbc.PreparedStatement" %>
<%@ page import="com.mysql.jdbc.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Collections" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: Daisia
  Date: 2018/3/13
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
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
    int rank = 0;
    String userid = null;
    List<Notification> notifications = null;
%>
<%
    String id = request.getParameter("id");
    userid = id;
    String a = request.getParameter("rank");
    rank = Integer.parseInt(a);
%>
<div class="nav-box">
    <ul class="container nav">
        <li><a href="provincehome.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>">首页</a></li>
        <li><a href="province2.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>&choose=0">企业信息</a></li>
        <li><a href="province3.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0">岗位数据</a></li>
        <li><a href="allUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>" >系统管理</a></li>
        <li><a href="/com/springmvc/controller/BingtuServlet?id=<%=request.getParameter("id") %>&rank=<%=request.getParameter("rank")%>">取样分析</a></li>
        <li><a href="trend.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0" >趋势分析</a></li>
        <li><a href="compareAnalysis.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0" >对比分析</a></li>
        <li><a href="/">退出</a></li>
    </ul>
</div>
<!--nav end-->
<!--body start-->
<div class="index-main index_box pt15">

    <div class="index_top_one">

        <div style="border-bottom:1px solid #c91006" class="title">
            请尽快完善企业备案信息</div>
        <div  class="title">
            请按时上报就业数据</div>

    </div>
<%
    notifications = new ArrayList<Notification>();
    notificationTable table = new notificationTable();
    Connection connection = table.getConnection();
    String sql = null;
    rank = Integer.parseInt(request.getParameter("rank"));
    if (rank == 2)
    sql = "SELECT * FROM notificationTable WHERE receiverRank=0 OR (receiverId=" + Integer.parseInt(userid) + " AND receiverRank=" + rank + ") or (id=" + userid + " AND rank=2)";
    else if (rank == 3){
        sql = "SELECT * FROM notificationTable WHERE receiverRank=0 OR receiverRank=3";
    }
    PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
    Statement stmt = (Statement) connection.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
    while (rs.next()){
        Notification notification = new Notification();
        notification.receiverId = rs.getInt("receiverId");
        notification.notification_id = rs.getInt("notification_id");
        notification.publishDay = rs.getInt("publishDay");
        notification.publishMonth = rs.getInt("publishMonth");
        notification.publishYear = rs.getInt("publishYear");
        notification.title = rs.getString("title");
        notification.content = rs.getString("content");
        notification.id = rs.getInt("id");
        notifications.add(notification);
    }
    rs.close();
    stmt.close();
    ps.close();
    connection.close();
%>
    <!--切换新闻 start-->
    <div class="index-header">
        <div id="switchable" class="container">

            <div>
                <ul>
                    <li>
                        <ul>
                            <li>
                                &nbsp;
                                <div class="clearfix">
                                    <div class="slider-img"></div>
                                    <div class="slider-text">
                                        <h3 class="title-h3"><i class="icon-new"></i><a target="_blank" style="color:#296b9b">消息通知</a>
                                            &nbsp;&nbsp;&nbsp;
                                            <i class="icon-new"></i><a href="provinceannouncement.jsp?id=<%=request.getParameter("id")%>&rank=<%=rank%>&type=0" a target="_blank" style="color:#296b9b">发布通知</a>
                                        </h3>
                                        <ul class="news-list">
                                            <%
                                                Collections.reverse(notifications);
                                                for (Notification notification: notifications){%>
                                            <li>&nbsp;<span class="span1"><a  target="_blank" href="/notification2.jsp?id=<%=userid%>&rank=<%=rank%>&notification_id=<%=notification.notification_id%>" methods="post"><%=notification.title%></a></span><span class="span2"><%=notification.publishYear%>-<%=notification.publishMonth%>-<%=notification.publishDay%></span></li>
                                                <%}
                                            %>
                                        </ul>
                                    </div>
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