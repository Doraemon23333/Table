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
<!--nav start-->
<div class="nav-box">
    <ul class="container nav">
        <li><a href="/">首页</a></li>
        <li><a href="/">备案信息</a></li>
        <li><a href="/">数据填报</a></li>
        <li><a href="/">数据查询</a></li>
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

            <div>
                <ul>
                    <li>
                        <ul>
                            <li>
                                <div class="clearfix">
                                    <div class="slider-img"></div>
                                    <div class="slider-text">
                                        <h3 class="title-h3"><i class="icon-new"></i><a href="/pages/zxzx/xwrd/index.html" target="_blank" style="color:#296b9b">消息通知</a></h3>
                                        <ul class="news-list">
                                            <li><span class="span1"><a  target="_blank">以更高境界更强担当全力推进高层次人才服务体系建设</a></span><span class="span2">03-07</span></li>
                                            <li><span class="span1"><a target="_blank">我省“新时代生态文明与地理发展”主题论坛入选全国博士后学术交流计划</a></span><span class="span2">03-07</span></li>
                                            <li><span class="span1"><a  target="_blank">第45届世界技能大赛山东省选拔赛正式启动</a></span><span class="span2">03-07</span></li>
                                            <li><span class="span1"><a  target="_blank">就业鲁渝行——“春风送岗助脱贫”活动在重庆市云阳县酉阳县同步启动</a></span><span class="span2">03-07</span></li>
                                            <li><span class="span1"><a  target="_blank">全省引进国外人才智力工作联席会议召开</a></span><span class="span2">03-05</span></li>
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

<!--
<script type="text/javascript">
    //日历——————————————————————————————————————————
    $(function() {

        //绘制月历体——————————————————————————————————————————

        for(var i=0;i<35;i++){
            $("<li><span></span></li>").appendTo(".month-body").addClass("month-cell");
        }

        var today=new Date()

        var FullYear = today.getFullYear(); //获取年份
        var m = today.getMonth();           //获取月号
        var month = today.getMonth()+1;     //获取月份

        if(month<10){
            month="0"+month;
        }
        var date = today.getDate();	      //获取日期
        var day = today.getDay();           //获取星期

        var monthsNum=[31,28,31,30,31,30,31,31,30,31,30,31];
        var isleapyear = FullYear%4;        //判断闰年
        if(isleapyear==0){
            monthsNum[1]=29;
        }

        if(day==0){
            day = 7;
        }
        var firstDay = day-(date%7-1);       //!important 计算月初星期数

        if(firstDay==7){                     //如果月初为七，归零
            firstDay =0;
        }
        if(firstDay<0){                       //如果月初为负，加七循环
            firstDay +=7;
        }

        var f = firstDay;
        for(var j=1;j<=monthsNum[m];j++){
            $("li.month-cell span").eq(f).text(j).parent().addClass("pink");
            f++;
        }

        $("li.month-cell span").eq(firstDay-1+date).parent().addClass("pink_now");

        $(".month-head span").text(FullYear+"年"+month+"月");
        $("li.month-cell span").mouseover(function(){
            $(this).parent().removeClass("pink");
            $(this).parent().addClass("red");
        });
        $("li.month-cell span").mouseout(function(){
            $(this).parent().removeClass("red");
            $(this).parent().addClass("pink");
        });
        $("li.month-cell span").click(function(){
                var fwrq=null;
                if(parseInt($(this).text())<=parseInt($("li.month-cell span").eq(firstDay-1+date).text()))
                    if($(this).text()<10){
                        fwrq=FullYear+"-"+month+"-"+0+$(this).text();
                        window.location.href="/includes/search_allbyday.html?fwrq="+fwrq;
                    }else{
                        fwrq=FullYear+"-"+month+"-"+$(this).text();
                        window.location.href="/includes/search_allbyday.html?fwrq="+fwrq;
                    }
            }
        );

    });
</script>
-->
<div class="footer-box">
    <div class="footer-link clearfix">
    </div>
    <div class="copyright">
        <div class="container" style="overflwo:hidden;height:95px;">
            <div style="float:left;margin-left:200px;display:inline;width:110px; text-align:center; overflow:hidden;padding-top:12px;">
                <script id="_jiucuo_" sitecode='3700000027' src='http://pucha.kaipuyun.cn/exposure/jiucuo.js'></script>
            </div>
            <div style="float:left;display:inline;width:70px;text-align:center;overflow:hidden;"><script type="text/javascript">document.write(unescape("%3Cspan id='_ideConac' %3E%3C/span%3E%3Cscript src='http://dcs.conac.cn/js/16/000/0000/60418909/CA160000000604189090002.js' type='text/javascript'%3E%3C/script%3E"));</script></div>
            <div style="float:left;display:inline;width:500px; text-align:center; overflow:hidden;">
                <p>主办单位：山东省人力资源和社会保障厅 版权所有：山东省人力资源和社会保障厅</p>
                <p>技术支持：山东省人力资源社会保障信息中心</p>
                <p>鲁ICP备10039682号</p>
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

