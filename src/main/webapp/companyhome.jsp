<%--
  Created by IntelliJ IDEA.
  User: zfr
  Date: 2018/3/13
  Time: 10:07
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
<%! String userid = null;%>
<%
    String id = request.getParameter("id");
    userid = id;
%>
<!--nav start-->
<div class="nav-box">
    <ul class="container nav">
        <li><a href="companyhome.jsp?id=<%=request.getParameter("id")%>">首页</a></li>
        <li><a href="companyRecordInfo.jsp?id=<%=request.getParameter("id")%>">备案信息</a></li>
        <li><a href="companyDataInsert.jsp?id=<%=request.getParameter("id")%>">数据填报</a></li>
        <li><a href="/">数据查询</a></li>
        <li><a href="/">退出</a></li>
    </ul>
</div>
<!--nav end-->
<!--body start-->
<div class="index-main index_box pt15">
    <div class="index_top_one">

        <div style="border-bottom:1px solid #c91006" class="title"><a style="text-decoration:none;"

                                                                      target="_blank" href="/"  title="" >
            请尽快完善企业备案信息</a></div>
        <div  class="title"><a style="text-decoration:none;"

                               target="_blank" href="/"  title="" >
            请按时上报就业数据</a></div>

    </div>

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
                                        <h3 class="title-h3"><i class="icon-new"></i><a target="_blank" style="color:#296b9b">消息通知</a></h3>
                                        <ul class="news-list">
                                            <li>&nbsp;<span class="span1"><a  target="_blank">山东省省级创业型城市（县区）和创业型街道（乡镇）创建评估认定项目采购竞争性磋商公告</a></span><span class="span2">03-09</span></li>
                                            <li>&nbsp;<span class="span1"><a  target="_blank">以更高境界更强担当全力推进高层次人才服务体系建设</a></span><span class="span2">03-07</span></li>
                                            <li>&nbsp;<span class="span1"><a target="_blank">我省“新时代生态文明与地理发展”主题论坛入选全国博士后学术交流计划</a></span><span class="span2">03-07</span></li>
                                            <li>&nbsp;<span class="span1"><a  target="_blank">关于公开征集山东省高层次人才绿色通道服务统一标识的通知</a></span><span class="span2">03-07</span></li>
                                            <li>&nbsp;<span class="span1"><a  target="_blank">就业鲁渝行——“春风送岗助脱贫”活动在重庆市云阳县酉阳县同步启动</a></span><span class="span2">03-07</span></li>
                                            <li>&nbsp;<span class="span1"><a  target="_blank">全省引进国外人才智力工作联席会议召开</a></span><span class="span2">03-05</span></li>
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

