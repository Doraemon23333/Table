<%--
  Created by IntelliJ IDEA.
  User: Daisia
  Date: 2018/3/15
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html  dir="ltr" lang="zh-cn" xml:lang="zh-cn">
<head>
    <title>发布新通知</title>
    <link rel="shortcut icon" href="http://online.bit.edu.cn/moodle/theme/image.php/lambda/theme/1510491239/favicon" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="moodle, 发布新通知" />
    <link rel="stylesheet" type="text/css" href="http://online.bit.edu.cn/moodle/theme/yui_combo.php?rollup/3.17.2/yui-moodlesimple-min.css" /><script id="firstthemesheet" type="text/css">/** Required in order to fix style inclusion problems in IE with YUI **/</script><link rel="stylesheet" type="text/css" href="http://online.bit.edu.cn/moodle/theme/styles.php/lambda/1510491239/all" />

    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/tool.css" type="text/css">
    <link rel="stylesheet" href="css/communal.css" type="text/css">
    <link rel="stylesheet" href="css/index.css" type="text/css">
    <link rel="stylesheet" href="css/index_3.8.css" type="text/css">
    <link rel="stylesheet" href="css/index_10.14.css" type="text/css">
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/jquery.placehold.min.js"></script>
    <script type="text/javascript" src="js/koala.min.1.5.js"></script>

    <style type="text/css">
        h.thicker {font-weight: 900}
    </style>


    <script type="text/javascript">
        //<![CDATA[
        var M = {}; M.yui = {};
        M.pageloadstarttime = new Date();
        M.cfg = {"wwwroot":"http:\/\/online.bit.edu.cn\/moodle","sesskey":"l0UGWxnYpq","loadingicon":"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/core\/1510491239\/i\/loading_small","themerev":"1510491239","slasharguments":1,"theme":"lambda","jsrev":"1510491239","admin":"admin","svgicons":true};var yui1ConfigFn = function(me) {if(/-skin|reset|fonts|grids|base/.test(me.name)){me.type='css';me.path=me.path.replace(/\.js/,'.css');me.path=me.path.replace(/\/yui2-skin/,'/assets/skins/sam/yui2-skin')}};
        var yui2ConfigFn = function(me) {var parts=me.name.replace(/^moodle-/,'').split('-'),component=parts.shift(),module=parts[0],min='-min';if(/-(skin|core)$/.test(me.name)){parts.pop();me.type='css';min=''};if(module){var filename=parts.join('-');me.path=component+'/'+module+'/'+filename+min+'.'+me.type}else me.path=component+'/'+component+'.'+me.type};
        YUI_config = {"debug":false,"base":"http:\/\/online.bit.edu.cn\/moodle\/lib\/yuilib\/3.17.2\/","comboBase":"http:\/\/online.bit.edu.cn\/moodle\/theme\/yui_combo.php?","combine":true,"filter":null,"insertBefore":"firstthemesheet","groups":{"yui2":{"base":"http:\/\/online.bit.edu.cn\/moodle\/lib\/yuilib\/2in3\/2.9.0\/build\/","comboBase":"http:\/\/online.bit.edu.cn\/moodle\/theme\/yui_combo.php?","combine":true,"ext":false,"root":"2in3\/2.9.0\/build\/","patterns":{"yui2-":{"group":"yui2","configFn":yui1ConfigFn}}},"moodle":{"name":"moodle","base":"http:\/\/online.bit.edu.cn\/moodle\/theme\/yui_combo.php?m\/1510491239\/","combine":true,"comboBase":"http:\/\/online.bit.edu.cn\/moodle\/theme\/yui_combo.php?","ext":false,"root":"m\/1510491239\/","patterns":{"moodle-":{"group":"moodle","configFn":yui2ConfigFn}},"filter":null,"modules":{"moodle-core-notification":{"requires":["moodle-core-notification-dialogue","moodle-core-notification-alert","moodle-core-notification-confirm","moodle-core-notification-exception","moodle-core-notification-ajaxexception"]},"moodle-core-notification-dialogue":{"requires":["base","node","panel","escape","event-key","dd-plugin","moodle-core-widget-focusafterclose","moodle-core-lockscroll"]},"moodle-core-notification-alert":{"requires":["moodle-core-notification-dialogue"]},"moodle-core-notification-confirm":{"requires":["moodle-core-notification-dialogue"]},"moodle-core-notification-exception":{"requires":["moodle-core-notification-dialogue"]},"moodle-core-notification-ajaxexception":{"requires":["moodle-core-notification-dialogue"]},"moodle-core-dragdrop":{"requires":["base","node","io","dom","dd","event-key","event-focus","moodle-core-notification"]},"moodle-core-maintenancemodetimer":{"requires":["base","node"]},"moodle-core-dock":{"requires":["base","node","event-custom","event-mouseenter","event-resize","escape","moodle-core-dock-loader"]},"moodle-core-dock-loader":{"requires":["escape"]},"moodle-core-formautosubmit":{"requires":["base","event-key"]},"moodle-core-popuphelp":{"requires":["moodle-core-tooltip"]},"moodle-core-formchangechecker":{"requires":["base","event-focus"]},"moodle-core-handlebars":{"condition":{"trigger":"handlebars","when":"after"}},"moodle-core-languninstallconfirm":{"requires":["base","node","moodle-core-notification-confirm","moodle-core-notification-alert"]},"moodle-core-actionmenu":{"requires":["base","event","node-event-simulate"]},"moodle-core-event":{"requires":["event-custom"]},"moodle-core-chooserdialogue":{"requires":["base","panel","moodle-core-notification"]},"moodle-core-tooltip":{"requires":["base","node","io-base","moodle-core-notification-dialogue","json-parse","widget-position","widget-position-align","event-outside","cache-base"]},"moodle-core-lockscroll":{"requires":["plugin","base-build"]},"moodle-core-checknet":{"requires":["base-base","moodle-core-notification-alert","io-base"]},"moodle-core-blocks":{"requires":["base","node","io","dom","dd","dd-scroll","moodle-core-dragdrop","moodle-core-notification"]},"moodle-core_availability-form":{"requires":["base","node","event","panel","moodle-core-notification-dialogue","json"]},"moodle-backup-confirmcancel":{"requires":["node","node-event-simulate","moodle-core-notification-confirm"]},"moodle-backup-backupselectall":{"requires":["node","event","node-event-simulate","anim"]},"moodle-calendar-info":{"requires":["base","node","event-mouseenter","event-key","overlay","moodle-calendar-info-skin"]},"moodle-course-management":{"requires":["base","node","io-base","moodle-core-notification-exception","json-parse","dd-constrain","dd-proxy","dd-drop","dd-delegate","node-event-delegate"]},"moodle-course-categoryexpander":{"requires":["node","event-key"]},"moodle-course-modchooser":{"requires":["moodle-core-chooserdialogue","moodle-course-coursebase"]},"moodle-course-dragdrop":{"requires":["base","node","io","dom","dd","dd-scroll","moodle-core-dragdrop","moodle-core-notification","moodle-course-coursebase","moodle-course-util"]},"moodle-course-toolboxes":{"requires":["node","base","event-key","node","io","moodle-course-coursebase","moodle-course-util"]},"moodle-course-formatchooser":{"requires":["base","node","node-event-simulate"]},"moodle-course-util":{"requires":["node"],"use":["moodle-course-util-base"],"submodules":{"moodle-course-util-base":{},"moodle-course-util-section":{"requires":["node","moodle-course-util-base"]},"moodle-course-util-cm":{"requires":["node","moodle-course-util-base"]}}},"moodle-form-dateselector":{"requires":["base","node","overlay","calendar"]},"moodle-form-passwordunmask":{"requires":["node","base"]},"moodle-form-shortforms":{"requires":["node","base","selector-css3","moodle-core-event"]},"moodle-form-showadvanced":{"requires":["node","base","selector-css3"]},"moodle-core_message-messenger":{"requires":["escape","handlebars","io-base","moodle-core-notification-ajaxexception","moodle-core-notification-alert","moodle-core-notification-dialogue","moodle-core-notification-exception"]},"moodle-core_message-deletemessage":{"requires":["node","event"]},"moodle-question-preview":{"requires":["base","dom","event-delegate","event-key","core_question_engine"]},"moodle-question-chooser":{"requires":["moodle-core-chooserdialogue"]},"moodle-question-searchform":{"requires":["base","node"]},"moodle-question-qbankmanager":{"requires":["node","selector-css3"]},"moodle-availability_completion-form":{"requires":["base","node","event","moodle-core_availability-form"]},"moodle-availability_date-form":{"requires":["base","node","event","io","moodle-core_availability-form"]},"moodle-availability_grade-form":{"requires":["base","node","event","moodle-core_availability-form"]},"moodle-availability_group-form":{"requires":["base","node","event","moodle-core_availability-form"]},"moodle-availability_grouping-form":{"requires":["base","node","event","moodle-core_availability-form"]},"moodle-availability_profile-form":{"requires":["base","node","event","moodle-core_availability-form"]},"moodle-qtype_ddimageortext-form":{"requires":["moodle-qtype_ddimageortext-dd","form_filepicker"]},"moodle-qtype_ddimageortext-dd":{"requires":["node","dd","dd-drop","dd-constrain"]},"moodle-qtype_ddmarker-dd":{"requires":["node","event-resize","dd","dd-drop","dd-constrain","graphics"]},"moodle-qtype_ddmarker-form":{"requires":["moodle-qtype_ddmarker-dd","form_filepicker","graphics","escape"]},"moodle-qtype_ddwtos-dd":{"requires":["node","dd","dd-drop","dd-constrain"]},"moodle-mod_assign-history":{"requires":["node","transition"]},"moodle-mod_forum-subscriptiontoggle":{"requires":["base-base","io-base"]},"moodle-mod_quiz-quizbase":{"requires":["base","node"]},"moodle-mod_quiz-questionchooser":{"requires":["moodle-core-chooserdialogue","moodle-mod_quiz-util","querystring-parse"]},"moodle-mod_quiz-toolboxes":{"requires":["base","node","event","event-key","io","moodle-mod_quiz-quizbase","moodle-mod_quiz-util-slot","moodle-core-notification-ajaxexception"]},"moodle-mod_quiz-util":{"requires":["node"],"use":["moodle-mod_quiz-util-base"],"submodules":{"moodle-mod_quiz-util-base":{},"moodle-mod_quiz-util-slot":{"requires":["node","moodle-mod_quiz-util-base"]},"moodle-mod_quiz-util-page":{"requires":["node","moodle-mod_quiz-util-base"]}}},"moodle-mod_quiz-randomquestion":{"requires":["base","event","node","io","moodle-core-notification-dialogue"]},"moodle-mod_quiz-autosave":{"requires":["base","node","event","event-valuechange","node-event-delegate","io-form"]},"moodle-mod_quiz-modform":{"requires":["base","node","event"]},"moodle-mod_quiz-quizquestionbank":{"requires":["base","event","node","io","io-form","yui-later","moodle-question-qbankmanager","moodle-core-notification-dialogue"]},"moodle-mod_quiz-dragdrop":{"requires":["base","node","io","dom","dd","dd-scroll","moodle-core-dragdrop","moodle-core-notification","moodle-mod_quiz-quizbase","moodle-mod_quiz-util-base","moodle-mod_quiz-util-page","moodle-mod_quiz-util-slot","moodle-course-util"]},"moodle-mod_quiz-repaginate":{"requires":["base","event","node","io","moodle-core-notification-dialogue"]},"moodle-message_airnotifier-toolboxes":{"requires":["base","node","io"]},"moodle-block_navigation-navigation":{"requires":["base","io-base","node","event-synthetic","event-delegate","json-parse"]},"moodle-filter_glossary-autolinker":{"requires":["base","node","io-base","json-parse","event-delegate","overlay","moodle-core-event","moodle-core-notification-alert","moodle-core-notification-exception","moodle-core-notification-ajaxexception"]},"moodle-filter_mathjaxloader-loader":{"requires":["moodle-core-event"]},"moodle-editor_atto-editor":{"requires":["node","transition","io","overlay","escape","event","event-simulate","event-custom","node-event-html5","node-event-simulate","yui-throttle","moodle-core-notification-dialogue","moodle-core-notification-confirm","moodle-editor_atto-rangy","handlebars","timers","querystring-stringify"]},"moodle-editor_atto-plugin":{"requires":["node","base","escape","event","event-outside","handlebars","event-custom","timers","moodle-editor_atto-menu"]},"moodle-editor_atto-menu":{"requires":["moodle-core-notification-dialogue","node","event","event-custom"]},"moodle-editor_atto-rangy":{"requires":[]},"moodle-report_eventlist-eventfilter":{"requires":["base","event","node","node-event-delegate","datatable","autocomplete","autocomplete-filters"]},"moodle-report_loglive-fetchlogs":{"requires":["base","event","node","io","node-event-delegate"]},"moodle-gradereport_grader-gradereporttable":{"requires":["base","node","event","handlebars","overlay","event-hover"]},"moodle-gradereport_history-userselector":{"requires":["escape","event-delegate","event-key","handlebars","io-base","json-parse","moodle-core-notification-dialogue"]},"moodle-tool_capability-search":{"requires":["base","node"]},"moodle-tool_monitor-dropdown":{"requires":["base","event","node"]},"moodle-assignfeedback_editpdf-editor":{"requires":["base","event","node","io","graphics","json","event-move","event-resize","querystring-stringify-simple","moodle-core-notification-dialog","moodle-core-notification-exception","moodle-core-notification-ajaxexception"]},"moodle-atto_accessibilitychecker-button":{"requires":["color-base","moodle-editor_atto-plugin"]},"moodle-atto_accessibilityhelper-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_align-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_bold-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_charmap-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_clear-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_collapse-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_emoticon-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_equation-button":{"requires":["moodle-editor_atto-plugin","moodle-core-event","io","event-valuechange","tabview","array-extras"]},"moodle-atto_html-button":{"requires":["moodle-editor_atto-plugin","event-valuechange"]},"moodle-atto_image-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_indent-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_italic-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_link-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_managefiles-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_managefiles-usedfiles":{"requires":["node","escape"]},"moodle-atto_media-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_noautolink-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_orderedlist-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_rtl-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_strike-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_subscript-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_superscript-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_table-button":{"requires":["moodle-editor_atto-plugin","moodle-editor_atto-menu","event","event-valuechange"]},"moodle-atto_title-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_underline-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_undo-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_unorderedlist-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_wiris-button":{"requires":["moodle-editor_atto-plugin","get"]}}},"gallery":{"name":"gallery","base":"http:\/\/online.bit.edu.cn\/moodle\/lib\/yuilib\/gallery\/","combine":true,"comboBase":"http:\/\/online.bit.edu.cn\/moodle\/theme\/yui_combo.php?","ext":false,"root":"gallery\/1510491239\/","patterns":{"gallery-":{"group":"gallery"}}}},"modules":{"core_filepicker":{"name":"core_filepicker","fullpath":"http:\/\/online.bit.edu.cn\/moodle\/lib\/javascript.php\/1510491239\/repository\/filepicker.js","requires":["base","node","node-event-simulate","json","async-queue","io-base","io-upload-iframe","io-form","yui2-treeview","panel","cookie","datatable","datatable-sort","resize-plugin","dd-plugin","escape","moodle-core_filepicker"]}}};
        M.yui.loader = {modules: {}};

        //]]>
    </script>

    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-19619129-6']);
        _gaq.push(['_trackPageview']);

        (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

    </script>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Google web fonts -->

</head>

<body  id="page-mod-forum-post" class="format-weeks  path-mod path-mod-forum safari dir-ltr lang-zh_cn yui-skin-sam yui3-skin-sam online-bit-edu-cn--moodle pagelayout-incourse course-1214 context-164104 cmid-65655 category-284 has-region-side-pre used-region-side-pre has-region-side-post empty-region-side-post has-region-footer-left empty-region-footer-left has-region-footer-middle empty-region-footer-middle has-region-footer-right empty-region-footer-right side-pre-only">

<div class="skiplinks"><a class="skip" href="#maincontent">跳到主要内容</a></div>
<script type="text/javascript" src="http://online.bit.edu.cn/moodle/theme/yui_combo.php?rollup/3.17.2/yui-moodlesimple-min.js&amp;rollup/1510491239/mcore-min.js"></script><script type="text/javascript" src="http://online.bit.edu.cn/moodle/theme/jquery.php/core/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="http://online.bit.edu.cn/moodle/theme/jquery.php/theme_lambda/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="http://online.bit.edu.cn/moodle/theme/jquery.php/theme_lambda/camera.min.1.11.js"></script>
<script type="text/javascript" src="http://online.bit.edu.cn/moodle/theme/jquery.php/theme_lambda/jquery.bxslider.js"></script>
<script type="text/javascript" src="http://online.bit.edu.cn/moodle/lib/javascript.php/1510491239/lib/javascript-static.js"></script>
<script type="text/javascript">
    //<![CDATA[
    document.body.className += ' jsenabled';
    //]]>
</script>





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
    String rank = null;
    String userid = null;
    int type = 0;
%>
<%
    String id = request.getParameter("id");
    userid = id;
    rank = request.getParameter("rank");
    type = Integer.parseInt(request.getParameter("type"));
%>
<div class="nav-box">
    <ul class="container nav">
        <li><a href="provincehome.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>">首页</a></li>
        <li><a href="province2.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0">企业信息</a></li>
        <li><a href="province3.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>&choose=0">岗位数据</a></li>
        <li><a href="allUserInfo.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" >系统管理</a></li>
        <li><a href="/com/springmvc/controller/BingtuServlet?id=<%=request.getParameter("id") %>&rank=<%=request.getParameter("rank")%>">取样分析</a></li>
        <li><a href="trend.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" >趋势分析</a></li>
        <li><a href="compareAnalysis.jsp?id=<%=request.getParameter("id")%>&rank=<%=request.getParameter("rank")%>" >对比分析</a></li>
        <li><a href="/">退出</a></li>
    </ul>
</div>
<!--nav end-->


<!-- Start Main Regions -->
<div id="page" class="container-fluid">



    <div id="page-content" class="row-fluid">
        <div id="region-bs-main-and-pre" class="span9 pull-center">
            <div font style="margin-left:200px">
                <div class="row-fluid">
                    <section id="region-main" >
                        <div role="main"><span id="maincontent"></span>

                            <script type="text/javascript">
                                //<![CDATA[

                                var skipClientValidation = false;

                                function qf_errorHandler(element, _qfMsg, escapedName) {
                                    div = element.parentNode;

                                    if ((div == undefined) || (element.name == undefined)) {
                                        //no checking can be done for undefined elements so let server handle it.
                                        return true;
                                    }

                                    if (_qfMsg != '') {
                                        var errorSpan = document.getElementById('id_error_' + escapedName);
                                        if (!errorSpan) {
                                            errorSpan = document.createElement("span");
                                            errorSpan.id = 'id_error_' + escapedName;
                                            errorSpan.className = "error";
                                            element.parentNode.insertBefore(errorSpan, element.parentNode.firstChild);
                                            document.getElementById(errorSpan.id).setAttribute('TabIndex', '0');
                                            document.getElementById(errorSpan.id).focus();
                                        }

                                        while (errorSpan.firstChild) {
                                            errorSpan.removeChild(errorSpan.firstChild);
                                        }

                                        errorSpan.appendChild(document.createTextNode(_qfMsg.substring(3)));

                                        if (div.className.substr(div.className.length - 6, 6) != " error"
                                            && div.className != "error") {
                                            div.className += " error";
                                            linebreak = document.createElement("br");
                                            linebreak.className = "error";
                                            linebreak.id = 'id_error_break_' + escapedName;
                                            errorSpan.parentNode.insertBefore(linebreak, errorSpan.nextSibling);
                                        }

                                        return false;
                                    } else {
                                        var errorSpan = document.getElementById('id_error_' + escapedName);
                                        if (errorSpan) {
                                            errorSpan.parentNode.removeChild(errorSpan);
                                        }
                                        var linebreak = document.getElementById('id_error_break_' + escapedName);
                                        if (linebreak) {
                                            linebreak.parentNode.removeChild(linebreak);
                                        }

                                        if (div.className.substr(div.className.length - 6, 6) == " error") {
                                            div.className = div.className.substr(0, div.className.length - 6);
                                        } else if (div.className == "error") {
                                            div.className = "";
                                        }

                                        return true;
                                    }
                                }
                                function validate_mod_forum_post_form_subject(element, escapedName) {
                                    if (undefined == element) {
                                        //required element was not found, then let form be submitted without client side validation
                                        return true;
                                    }
                                    var value = '';
                                    var errFlag = new Array();
                                    var _qfGroups = {};
                                    var _qfMsg = '';
                                    var frm = element.parentNode;
                                    if ((undefined != element.name) && (frm != undefined)) {
                                        while (frm && frm.nodeName.toUpperCase() != "FORM") {
                                            frm = frm.parentNode;
                                        }
                                        value = frm.elements['subject'].value;
                                        if (value == '' && !errFlag['subject']) {
                                            errFlag['subject'] = true;
                                            _qfMsg = _qfMsg + '\n - 不可以为空';
                                        }

                                        value = frm.elements['subject'].value;
                                        if (value != '' && value.length > 255 && !errFlag['subject']) {
                                            errFlag['subject'] = true;
                                            _qfMsg = _qfMsg + '\n - 最多255个字符';
                                        }

                                        return qf_errorHandler(element, _qfMsg, escapedName);
                                    } else {
                                        //element name should be defined else error msg will not be displayed.
                                        return true;
                                    }
                                }

                                function validate_mod_forum_post_form_message_5btext_5d(element, escapedName) {
                                    if (undefined == element) {
                                        //required element was not found, then let form be submitted without client side validation
                                        return true;
                                    }
                                    var value = '';
                                    var errFlag = new Array();
                                    var _qfGroups = {};
                                    var _qfMsg = '';
                                    var frm = element.parentNode;
                                    if ((undefined != element.name) && (frm != undefined)) {
                                        while (frm && frm.nodeName.toUpperCase() != "FORM") {
                                            frm = frm.parentNode;
                                        }
                                        value = frm.elements['message[text]'].value;
                                        if (value == '' && !errFlag['message[text]']) {
                                            errFlag['message[text]'] = true;
                                            _qfMsg = _qfMsg + '\n - 不可以为空';
                                        }

                                        return qf_errorHandler(element, _qfMsg, escapedName);
                                    } else {
                                        //element name should be defined else error msg will not be displayed.
                                        return true;
                                    }
                                }

                                function validate_mod_forum_post_form(frm) {
                                    if (skipClientValidation) {
                                        return true;
                                    }
                                    var ret = true;

                                    var frm = document.getElementById('mformforum')
                                    var first_focus = false;

                                    ret = validate_mod_forum_post_form_subject(frm.elements['subject'], 'subject') && ret;
                                    if (!ret && !first_focus) {
                                        first_focus = true;
                                        Y.use('moodle-core-event', function() {
                                            Y.Global.fire(M.core.globalEvents.FORM_ERROR, {formid: 'mformforum',
                                                elementid: 'id_error_subject'});
                                            document.getElementById('id_error_subject').focus();
                                        });
                                    }

                                    ret = validate_mod_forum_post_form_message_5btext_5d(frm.elements['message[text]'], 'message_5btext_5d') && ret;
                                    if (!ret && !first_focus) {
                                        first_focus = true;
                                        Y.use('moodle-core-event', function() {
                                            Y.Global.fire(M.core.globalEvents.FORM_ERROR, {formid: 'mformforum',
                                                elementid: 'id_error_message_5btext_5d'});
                                            document.getElementById('id_error_message_5btext_5d').focus();
                                        });
                                    }
                                    ;
                                    return ret;
                                }
                                //]]>
                            </script>

                            <form id="mformforum" autocomplete="off" action="/com/springmvc/controller/NotificationServlet?id=<%=request.getParameter("id")%>&type=<%=type%>&rank=<%=request.getParameter("rank")%>" method="post" accept-charset="utf-8" class="mform" onsubmit="try { var myValidator = validate_mod_forum_post_form; } catch(e) { return true; } return myValidator(this);">
                                <div style="display: none;"><div class="hide"><input type="text" class="ignoredirty" /><input type="password" class="ignoredirty" /></div><input name="timestart" type="hidden" value="0" />
                                    <input name="timeend" type="hidden" value="0" />
                                    <input name="course" type="hidden" value="1214" />
                                    <input name="forum" type="hidden" value="3470" />
                                    <input name="discussion" type="hidden" value="0" />
                                    <input name="parent" type="hidden" value="0" />
                                    <input name="groupid" type="hidden" value="" />
                                    <input name="edit" type="hidden" value="0" />
                                    <input name="reply" type="hidden" value="0" />
                                    <input name="sesskey" type="hidden" value="l0UGWxnYpq" />
                                    <input name="_qf__mod_forum_post_form" type="hidden" value="1" />
                                    <input name="mform_isexpanded_id_general" type="hidden" value="1" />
                                </div>


                                <fieldset class="clearfix collapsible"  id="id_general">
                                    <legend class="ftoggler"> <h class="thicker" >您的新通知</h></legend>
                                    <div class="fcontainer clearfix">



                                        <div id="fitem_id_subject" class="fitem required fitem_ftext "><div class="fitemtitle"><label for="id_subject">主题<img class="req" title="此处不能为空。" alt="此处不能为空。" src="http://online.bit.edu.cn/moodle/theme/image.php/lambda/core/1510491239/req" /> </label></div><div class="felement ftext"><input size="48" name="subject" type="text" value="" onblur="validate_mod_forum_post_form_subject(this, 'subject')" onchange="validate_mod_forum_post_form_subject(this, 'subject')" id="id_subject" /></div></div>
                                        <div id="fitem_id_message" class="fitem required fitem_feditor "><div class="fitemtitle"><label for="id_message">正文<img class="req" title="此处不能为空。" alt="此处不能为空。" src="http://online.bit.edu.cn/moodle/theme/image.php/lambda/core/1510491239/req" /> </label></div><div class="felement feditor"><div><div><textarea id="id_message" name="message[text]" rows="15" cols="80" spellcheck="true" onblur="validate_mod_forum_post_form_message_5btext_5d(this, 'message_5btext_5d')" onchange="validate_mod_forum_post_form_message_5btext_5d(this, 'message_5btext_5d')"></textarea></div><div><input name="message[format]" type="hidden" value="1" /></div><input type="hidden" name="message[itemid]" value="456390648" /><noscript><div><object type='text/html' data='http://online.bit.edu.cn/moodle/repository/draftfiles_manager.php?action=browse&amp;env=editor&amp;itemid=456390648&amp;subdirs=0&amp;maxbytes=209715200&amp;areamaxbytes=-1&amp;maxfiles=-1&amp;ctx_id=164104&amp;course=1214&amp;sesskey=l0UGWxnYpq' height='160' width='600' style='border:1px solid #000'></object></div></noscript></div></div></div>

                                    </div>

                                </fieldset>
                                <fieldset class="hidden"><div>
                                    <div id="fgroup_id_buttonar" class="fitem fitem_actionbuttons fitem_fgroup"><div class="felement fgroup"><input name="submitbutton" value="发到通知区上" type="submit" id="id_submitbutton" /> <input name="cancel" value="取消" type="submit" onclick="skipClientValidation = true; return true;" class=" btn-cancel" id="id_cancel" /></div></div>
                                    <div class="fdescription required">必须填写有<img alt="此处不能为空。" src="http://online.bit.edu.cn/moodle/theme/image.php/lambda/core/1510491239/req" />标记的字段。</div>
                                </div></fieldset>
                            </form></div>                </section>
                </div>
            </div>
        </div>
        <aside id="block-region-side-post" class="span3 block-region" data-blockregion="side-post" data-droptarget="1"></aside>    </div>

    <!-- End Main Regions -->

    <a href="#top" class="back-to-top"><i class="fa fa-chevron-circle-up fa-3x"></i><p></p></a>

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



<script type="text/javascript">
    //<![CDATA[
    var require = {
        baseUrl : 'http://online.bit.edu.cn/moodle/lib/requirejs.php/1510491239/',
        // We only support AMD modules with an explicit define() statement.
        enforceDefine: true,
        skipDataMain: true,
        waitSeconds : 0,

        paths: {
            jquery: 'http://online.bit.edu.cn/moodle/lib/javascript.php/1510491239/lib/jquery/jquery-1.11.3.min',
            jqueryui: 'http://online.bit.edu.cn/moodle/lib/javascript.php/1510491239/lib/jquery/ui-1.11.4/jquery-ui.min',
            jqueryprivate: 'http://online.bit.edu.cn/moodle/lib/javascript.php/1510491239/lib/requirejs/jquery-private'
        },

        // Custom jquery config map.
        map: {
            // '*' means all modules will get 'jqueryprivate'
            // for their 'jquery' dependency.
            '*': { jquery: 'jqueryprivate' },

            // 'jquery-private' wants the real jQuery module
            // though. If this line was not here, there would
            // be an unresolvable cyclic dependency.
            jqueryprivate: { jquery: 'jquery' }
        }
    };

    //]]>
</script>
<script type="text/javascript" src="http://online.bit.edu.cn/moodle/lib/javascript.php/1510491239/lib/requirejs/require.min.js"></script>
<script type="text/javascript">
    //<![CDATA[
    require(['core/first'], function() {
        ;
        require(["core/log"], function(amd) { amd.setConfig({"level":"warn"}); });
    });
    //]]>
</script>
<script type="text/javascript">
    //<![CDATA[
    M.yui.add_module({"mathjax":{"name":"mathjax","fullpath":"http:\/\/cdn.mathjax.org\/mathjax\/2.5-latest\/MathJax.js?delayStartupUntil=configured"},"core_filepicker":{"name":"core_filepicker","fullpath":"http:\/\/online.bit.edu.cn\/moodle\/lib\/javascript.php\/1510491239\/repository\/filepicker.js","requires":["base","node","node-event-simulate","json","async-queue","io-base","io-upload-iframe","io-form","yui2-treeview","panel","cookie","datatable","datatable-sort","resize-plugin","dd-plugin","escape","moodle-core_filepicker"]},"editor_tinymce":{"name":"editor_tinymce","fullpath":"http:\/\/online.bit.edu.cn\/moodle\/lib\/javascript.php\/1510491239\/lib\/editor\/tinymce\/module.js","requires":[]},"core_dndupload":{"name":"core_dndupload","fullpath":"http:\/\/online.bit.edu.cn\/moodle\/lib\/javascript.php\/1510491239\/lib\/form\/dndupload.js","requires":["node","event","json","core_filepicker"]},"form_filemanager":{"name":"form_filemanager","fullpath":"http:\/\/online.bit.edu.cn\/moodle\/lib\/javascript.php\/1510491239\/lib\/form\/filemanager.js","requires":["moodle-core-notification-dialogue","core_filepicker","base","io-base","node","json","core_dndupload","panel","resize-plugin","dd-plugin"]}});

    //]]>
</script>
<script type="text/javascript" src="http://online.bit.edu.cn/moodle/theme/javascript.php/lambda/1510491239/footer"></script>
<script type="text/javascript" src="http://online.bit.edu.cn/moodle/lib/editor/tinymce/tiny_mce/3.5.11/tiny_mce.js"></script>
<script type="text/javascript" src="http://online.bit.edu.cn/moodle/lib/javascript.php/1510491239/lib/editor/tinymce/plugins/tiny_mce_wiris/baseURL.js"></script>
<script type="text/javascript">
    //<![CDATA[
    M.str = {"moodle":{"lastmodified":"\u6700\u540e\u4fee\u6539","name":"\u540d\u79f0","error":"\u9519\u8bef","info":"\u4fe1\u606f","viewallcourses":"\u67e5\u770b\u6240\u6709\u8bfe\u7a0b","morehelp":"\u66f4\u591a\u5e2e\u52a9","loadinghelp":"\u8f7d\u5165\u4e2d\u2026\u2026","cancel":"\u53d6\u6d88","yes":"\u662f","ok":"\u786e\u8ba4","changesmadereallygoaway":"\u60a8\u505a\u51fa\u4e86\u6539\u52a8\u3002\u60a8\u786e\u5b9a\u8981\u79bb\u5f00\u5e76\u653e\u5f03\u6240\u6709\u6539\u52a8\u5417\uff1f","edit":"\u7f16\u8f91","uploadformlimit":"\u4e0a\u4f20\u7684\u6587\u4ef6 {$a} \u5927\u5c0f\u8d85\u8fc7\u4e86\u8868\u5355\u4e2d\u8bbe\u7f6e\u7684\u6700\u5927\u5c3a\u5bf8\u9650\u5236","droptoupload":"\u62d6\u653e\u6587\u4ef6\u5230\u6b64\u5904\u8fdb\u884c\u4e0a\u4f20","maxfilesreached":"\u6b64\u9879\u5141\u8bb8\u60a8\u6700\u591a\u9644\u52a0 {$a} \u4e2a\u6587\u4ef6","dndenabled_inbox":"\u60a8\u53ef\u4ee5\u901a\u8fc7\u62d6\u653e\u6587\u4ef6\u5230\u6b64\u5904\u6765\u6dfb\u52a0\u6587\u4ef6\u3002","fileexists":"\u5df2\u7ecf\u6709\u540d\u4e3a {$a} \u7684\u6587\u4ef6","maxbytesforfile":"\u8fd9\u4e2a\u6587\u4ef6{$a}\u8d85\u8fc7\u4e86\u5141\u8bb8\u7684\u6700\u9ad8\u9650\u5236","maxareabytesreached":"\u8fd9\u4e2a\u6587\u4ef6\uff08\u6216\u51e0\u4e2a\u6587\u4ef6\u7684\u603b\u548c\uff09\u7684\u5927\u5c0f\u8d85\u8fc7\u4e86\u9884\u7559\u7684\u7a7a\u95f4","confirm":"\u786e\u8ba4","no":"\u5426","areyousure":"\u4f60\u786e\u5b9a\u5417\uff1f","closebuttontitle":"\u5173\u95ed","unknownerror":"\u672b\u77e5\u9519\u8bef"},"repository":{"type":"\u7c7b\u578b","size":"\u5927\u5c0f","invalidjson":"\u65e0\u6548\u7684JSON\u5b57\u7b26\u4e32","nofilesattached":"\u6ca1\u6709\u9644\u4ef6","filepicker":"\u6587\u4ef6\u9009\u62e9\u5668","logout":"\u767b\u51fa","nofilesavailable":"\u6ca1\u6709\u53ef\u7528\u6587\u4ef6","norepositoriesavailable":"\u62b1\u6b49\uff0c\u60a8\u4f7f\u7528\u7684\u5bb9\u5668\u90fd\u4e0d\u80fd\u8fd4\u56de\u7b26\u5408\u9700\u8981\u7684\u683c\u5f0f\u7684\u6587\u4ef6\u3002","fileexistsdialogheader":"\u6587\u4ef6\u5df2\u5b58\u5728","fileexistsdialog_editor":"\u60a8\u6b63\u7f16\u8f91\u7684\u6587\u672c\u7684\u9644\u4ef6\u4e2d\u5df2\u7ecf\u6709\u4e00\u4e2a\u540c\u540d\u6587\u4ef6\u3002","fileexistsdialog_filemanager":"\u5df2\u7ecf\u6709\u4e00\u4e2a\u540c\u540d\u6587\u4ef6","renameto":"\u91cd\u547d\u540d\u4e3a\u201c{$a}\u201d","referencesexist":"\u6709 {$a} \u4e2a\u522b\u540d\u6216\u5feb\u6377\u65b9\u5f0f\u5f15\u7528\u6b64\u6587\u4ef6","select":"\u9009\u62e9","confirmdeletefile":"\u60a8\u786e\u4fe1\u8981\u5220\u9664\u6b64\u6587\u4ef6\uff1f","draftareanofiles":"\u56e0\u4e3a\u6ca1\u6709\u9644\u4ef6\uff0c\u6240\u4ee5\u4e0d\u80fd\u4e0b\u8f7d","entername":"\u8bf7\u8f93\u5165\u6587\u4ef6\u5939\u540d","enternewname":"\u8bf7\u8f93\u5165\u65b0\u6587\u4ef6\u540d","popupblockeddownload":"\u4e0b\u8f7d\u7a97\u53e3\u88ab\u963b\u585e\u3002\u8bf7\u5141\u8bb8\u5f39\u51fa\u7a97\u53e3\uff0c\u7136\u540e\u518d\u8bd5\u4e00\u6b21\u3002","unknownoriginal":"\u672a\u77e5\u7684","confirmdeletefolder":"\u60a8\u786e\u5b9a\u8981\u5220\u9664\u8fd9\u4e2a\u6587\u4ef6\u5939\u5417\uff1f\u6240\u6709\u7684\u6587\u4ef6\u548c\u5b50\u6587\u4ef6\u5939\u5c06\u88ab\u5220\u9664\u3002","confirmdeletefilewithhref":"\u60a8\u786e\u5b9a\u60a8\u8981\u5220\u9664\u8fd9\u4e2a\u6587\u4ef6\u5417\uff1f\u6709 {$a} \u4e2a\u522b\u540d\u6216\u5feb\u6377\u65b9\u5f0f\u5f15\u7528\u4e86\u8fd9\u4e2a\u6587\u4ef6\u3002\u5982\u679c\u60a8\u7ee7\u7eed\uff0c\u90a3\u4e48\u8fd9\u4e9b\u522b\u540d\u5c06\u88ab\u8f6c\u6362\u4e3a\u771f\u5b9e\u526f\u672c\u3002","confirmrenamefolder":"\u60a8\u786e\u5b9a\u60a8\u8981\u79fb\u52a8\u6216\u91cd\u547d\u540d\u8fd9\u4e2a\u6587\u4ef6\u5939\u5417\uff1f\u4efb\u4f55\u5f15\u7528\u8fd9\u4e2a\u6587\u4ef6\u5939\u7684\u522b\u540d\u6216\u5feb\u6377\u65b9\u5f0f\u5c06\u88ab\u8f6c\u6362\u6210\u771f\u5b9e\u526f\u672c\u3002","confirmrenamefile":"\u60a8\u786e\u5b9a\u60a8\u8981\u79fb\u52a8\u6216\u91cd\u547d\u540d\u8fd9\u4e2a\u6587\u4ef6\u5417\uff1f\u6709 {$a} \u4e2a\u522b\u540d\u6216\u5feb\u6377\u65b9\u5f0f\u5f15\u7528\u4e86\u8fd9\u4e2a\u6587\u4ef6\u3002\u5982\u679c\u60a8\u7ee7\u7eed\uff0c\u90a3\u4e48\u8fd9\u4e9b\u522b\u540d\u5c06\u88ab\u8f6c\u6362\u4e3a\u771f\u5b9e\u526f\u672c\u3002","newfolder":"\u65b0\u6587\u4ef6\u5939"},"block":{"addtodock":"\u79fb\u5230\u505c\u9760\u680f","undockitem":"\u79fb\u8d70\u6b64\u9879","dockblock":"\u505c\u9760 {$a} \u7248\u5757","undockblock":"\u79fb\u8d70 {$a} \u7248\u5757","undockall":"\u5168\u90e8\u79fb\u8d70","hidedockpanel":"\u9690\u85cf\u505c\u9760\u680f","hidepanel":"\u9690\u85cf\u680f\u4f4d"},"langconfig":{"thisdirectionvertical":"btt"},"admin":{"confirmation":"\u786e\u8ba4"},"error":{"serverconnection":"\u8fde\u63a5\u5230\u670d\u52a1\u5668\u65f6\u51fa\u9519"}};
    //]]>
</script>
<script type="text/javascript">
    //<![CDATA[
    var navtreeexpansions33680 = [{"id":"expandable_branch_0_mycourses","key":"mycourses","type":0}];
    //]]>
</script>
<script type="text/javascript">
    //<![CDATA[
    (function() {M.util.load_flowplayer();
        setTimeout("fix_column_widths()", 20);
        Y.use("moodle-core-dock-loader",function() {M.core.dock.loader.initLoader();
        });
        Y.use("moodle-block_navigation-navigation",function() {M.block_navigation.init_add_tree({"id":"33680","instance":"33680","candock":true,"courselimit":"20","expansionlimit":"20"});
        });
        Y.use("moodle-block_navigation-navigation",function() {M.block_navigation.init_add_tree({"id":"33491","instance":"33491","candock":true});
        });
        M.util.help_popups.setup(Y);
        Y.use("moodle-core-popuphelp",function() {M.core.init_popuphelp();
        });
        M.util.init_skiplink(Y);
        Y.use("moodle-core-actionmenu",function() {M.core.actionmenu.init();
        });
        Y.use("moodle-core-formautosubmit",function() {M.core.init_formautosubmit({"selectid":"single_select5aaa33185e4544","nothing":false});
        });
        Y.use("moodle-filter_mathjaxloader-loader",function() {M.filter_mathjaxloader.configure({"mathjaxconfig":"\nMathJax.Hub.Config({\n    config: [\"Accessible.js\", \"Safe.js\"],\n    errorSettings: { message: [\"!\"] },\n    skipStartupTypeset: true,\n    messageStyle: \"none\"\n});\n","lang":"en"});
        });
        Y.use("moodle-filter_glossary-autolinker",function() {M.filter_glossary.init_filter_autolinking({"courseid":0});
        });
        Y.use("moodle-core-formchangechecker",function() {M.core_formchangechecker.init({"formid":"mformforum"});
        });
        Y.use("moodle-form-shortforms",function() {M.form.shortforms({"formid":"mformforum"});
        });
        M.util.js_pending('random5aaa33185e4545'); Y.on('domready', function() {  M.util.js_pending('random5aaa33185e4545'); Y.use('core_filepicker', function(Y) { M.core_filepicker.set_templates(Y, {"generallayout":"\n<div tabindex=\"0\" class=\"file-picker fp-generallayout\" role=\"dialog\" aria-live=\"assertive\">\n    <div class=\"fp-repo-area\">\n        <ul class=\"fp-list\">\n            <li class=\"fp-repo\">\n                <a href=\"#\"><img class=\"fp-repo-icon\" alt=\" \" width=\"16\" height=\"16\" \/>&nbsp;<span class=\"fp-repo-name\"><\/span><\/a>\n            <\/li>\n        <\/ul>\n    <\/div>\n    <div class=\"fp-repo-items\" tabindex=\"0\">\n        <div class=\"fp-navbar\">\n            <div>\n                <div class=\"fp-toolbar\">\n                    <div class=\"fp-tb-back\">\n                        <a href=\"#\">\u00ab \u8fd4\u56de<\/a>\n                    <\/div>\n                    <div class=\"fp-tb-search\">\n                        <form><\/form>\n                    <\/div>\n                    <div class=\"fp-tb-refresh\">\n                        <a title=\"\u5237\u65b0\" href=\"#\">\n                            <img alt=\"\"  src=\"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/core\/1510491239\/a\/refresh\" \/>\n                        <\/a>\n                    <\/div>\n                    <div class=\"fp-tb-logout\">\n                        <a title=\"\u767b\u51fa\" href=\"#\">\n                            <img alt=\"\" src=\"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/core\/1510491239\/a\/logout\" \/>\n                        <\/a>\n                    <\/div>\n                    <div class=\"fp-tb-manage\">\n                        <a title=\"\u8bbe\u7f6e\" href=\"#\">\n                            <img alt=\"\" src=\"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/core\/1510491239\/a\/setting\" \/>\n                        <\/a>\n                    <\/div>\n                    <div class=\"fp-tb-help\">\n                        <a title=\"\u5e2e\u52a9\" href=\"#\">\n                            <img alt=\"\" src=\"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/core\/1510491239\/a\/help\" \/>\n                        <\/a>\n                    <\/div>\n                    <div class=\"fp-tb-message\"><\/div>\n                <\/div>\n                <div class=\"fp-viewbar\">\n                    <a role=\"button\" title=\"\u4ee5\u6587\u4ef6\u56fe\u6807\u663e\u793a\u6587\u4ef6\u5939\u5185\u5bb9\" class=\"fp-vb-icons\" href=\"#\">\n                        <img alt=\"\" src=\"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/theme\/1510491239\/fp\/view_icon_active\" \/>\n                    <\/a>\n                    <a role=\"button\" title=\"\u4ee5\u6587\u4ef6\u8be6\u7ec6\u4fe1\u606f\u663e\u793a\u6587\u4ef6\u5939\u5185\u5bb9\" class=\"fp-vb-details\" href=\"#\">\n                        <img alt=\"\" src=\"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/theme\/1510491239\/fp\/view_list_active\" \/>\n                    <\/a>\n                    <a role=\"button\" title=\"\u4ee5\u6587\u4ef6\u6811\u72b6\u7ed3\u6784\u663e\u793a\u6587\u4ef6\u5939\u5185\u5bb9\" class=\"fp-vb-tree\" href=\"#\">\n                        <img alt=\"\" src=\"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/theme\/1510491239\/fp\/view_tree_active\" \/>\n                    <\/a>\n                <\/div>\n                <div class=\"fp-clear-left\"><\/div>\n            <\/div>\n            <div class=\"fp-pathbar\">\n                 <span class=\"fp-path-folder\"><a class=\"fp-path-folder-name\" href=\"#\"><\/a><\/span>\n            <\/div>\n        <\/div>\n        <div class=\"fp-content\"><\/div>\n    <\/div>\n<\/div>","iconfilename":"\n<a class=\"fp-file\" href=\"#\" >\n    <div style=\"position:relative;\">\n        <div class=\"fp-thumbnail\"><\/div>\n        <div class=\"fp-reficons1\"><\/div>\n        <div class=\"fp-reficons2\"><\/div>\n    <\/div>\n    <div class=\"fp-filename-field\">\n        <p class=\"fp-filename\"><\/p>\n    <\/div>\n<\/a>","listfilename":"\n<span class=\"fp-filename-icon\">\n    <a href=\"#\">\n        <span class=\"fp-icon\"><\/span>\n        <span class=\"fp-filename\"><\/span>\n    <\/a>\n<\/span>","nextpage":"\n<div class=\"fp-nextpage\">\n    <div class=\"fp-nextpage-link\"><a href=\"#\">\u66f4\u591a<\/a><\/div>\n    <div class=\"fp-nextpage-loading\">\n        <img src=\"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/core\/1510491239\/i\/loading_small\" \/>\n    <\/div>\n<\/div>","selectlayout":"\n<div class=\"file-picker fp-select\">\n    <div class=\"fp-select-loading\">\n        <img src=\"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/core\/1510491239\/i\/loading_small\" \/>\n    <\/div>\n    <form class=\"form-horizontal\">\n        <div class=\"fp-forminset\">\n                <div class=\"fp-linktype-2 control-group control-radio clearfix\">\n                    <label class=\"control-label control-radio\">\u4e3a\u6587\u4ef6\u5236\u4f5c\u4e00\u4e2a\u526f\u672c<\/label>\n                    <div class=\"controls control-radio\">\n                        <input type=\"radio\"\/>\n                    <\/div>\n                <\/div>\n                <div class=\"fp-linktype-1 control-group control-radio clearfix\">\n                    <label class=\"control-label control-radio\">\u76f4\u63a5\u94fe\u63a5\u5230\u6587\u4ef6<\/label>\n                    <div class=\"controls control-radio\">\n                        <input type=\"radio\"\/>\n                    <\/div>\n                <\/div>\n                <div class=\"fp-linktype-4 control-group control-radio clearfix\">\n                    <label class=\"control-label control-radio\">\u4e3a\u6587\u4ef6\u521b\u5efa\u4e00\u4e2a\u522b\u540d\u6216\u5feb\u6377\u65b9\u5f0f<\/label>\n                    <div class=\"controls control-radio\">\n                        <input type=\"radio\"\/>\n                    <\/div>\n                <\/div>\n                <div class=\"fp-saveas control-group clearfix\">\n                    <label class=\"control-label\">\u53e6\u5b58\u4e3a<\/label>\n                    <div class=\"controls\">\n                        <input type=\"text\"\/>\n                    <\/div>\n                <\/div>\n                <div class=\"fp-setauthor control-group clearfix\">\n                    <label class=\"control-label\">\u4f5c\u8005<\/label>\n                    <div class=\"controls\">\n                        <input type=\"text\"\/>\n                    <\/div>\n                <\/div>\n                <div class=\"fp-setlicense control-group clearfix\">\n                    <label class=\"control-label\">\u9009\u62e9\u6388\u6743\u534f\u8bae<\/label>\n                    <div class=\"controls\">\n                        <select><\/select>\n                    <\/div>\n                <\/div>\n        <\/div>\n       <div class=\"fp-select-buttons\">\n            <button class=\"fp-select-confirm btn-primary btn\">\u9009\u62e9\u6b64\u6587\u4ef6<\/button>\n            <button class=\"fp-select-cancel btn-cancel btn\">\u53d6\u6d88<\/button>\n        <\/div>\n    <\/form>\n    <div class=\"fp-info clearfix\">\n        <div class=\"fp-hr\"><\/div>\n        <p class=\"fp-thumbnail\"><\/p>\n        <div class=\"fp-fileinfo\">\n            <div class=\"fp-datemodified\">\u6700\u8fd1\u4fee\u6539<span class=\"fp-value\"><\/span><\/div>\n            <div class=\"fp-datecreated\">\u521b\u5efa<span class=\"fp-value\"><\/span><\/div>\n            <div class=\"fp-size\">\u5927\u5c0f<span class=\"fp-value\"><\/span><\/div>\n            <div class=\"fp-license\">\u8bc1\u4e66<span class=\"fp-value\"><\/span><\/div>\n            <div class=\"fp-author\">\u4f5c\u8005<span class=\"fp-value\"><\/span><\/div>\n            <div class=\"fp-dimensions\">\u5927\u5c0f<span class=\"fp-value\"><\/span><\/div>\n        <\/div>\n    <\/div>\n<\/div>","uploadform":"\n<div class=\"fp-upload-form\">\n    <div class=\"fp-content-center\">\n        <form enctype=\"multipart\/form-data\" method=\"POST\" class=\"form-horizontal\">\n            <div class=\"fp-formset\">\n                <div class=\"fp-file control-group clearfix\">\n                    <label class=\"control-label\">\u9644\u4ef6<\/label>\n                    <div class=\"controls\">\n                        <input type=\"file\"\/>\n                    <\/div>\n                <\/div>\n                <div class=\"fp-saveas control-group clearfix\">\n                    <label class=\"control-label\">\u53e6\u5b58\u4e3a<\/label>\n                    <div class=\"controls\">\n                        <input type=\"text\"\/>\n                    <\/div>\n                <\/div>\n                <div class=\"fp-setauthor control-group clearfix\">\n                    <label class=\"control-label\">\u4f5c\u8005<\/label>\n                    <div class=\"controls\">\n                        <input type=\"text\"\/>\n                    <\/div>\n                <\/div>\n                <div class=\"fp-setlicense control-group clearfix\">\n                    <label class=\"control-label\">\u9009\u62e9\u6388\u6743\u534f\u8bae<\/label>\n                    <div class=\"controls\">\n                        <select ><\/select>\n                    <\/div>\n                <\/div>\n            <\/div>\n        <\/form>\n        <div class=\"mdl-align\">\n            <button class=\"fp-upload-btn btn-primary btn\">\u4e0a\u4f20\u6b64\u6587\u4ef6<\/button>\n        <\/div>\n    <\/div>\n<\/div> ","loading":"\n<div class=\"fp-content-loading\">\n    <div class=\"fp-content-center\">\n        <img src=\"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/core\/1510491239\/i\/loading_small\" \/>\n    <\/div>\n<\/div>","error":"\n<div class=\"fp-content-error\" ><div class=\"fp-error\"><\/div><\/div>","message":"\n<div class=\"file-picker fp-msg\" role=\"alertdialog\" aria-live=\"assertive\" aria-labelledby=\"fp-msg-labelledby\">\n    <p class=\"fp-msg-text\" id=\"fp-msg-labelledby\"><\/p>\n    <button class=\"fp-msg-butok btn-primary btn\">\u786e\u8ba4<\/button>\n<\/div>","processexistingfile":"\n<div class=\"file-picker fp-dlg\">\n    <p class=\"fp-dlg-text\"><\/p>\n    <div class=\"fp-dlg-buttons\">\n        <button class=\"fp-dlg-butoverwrite btn\">\u8986\u76d6<\/button>\n        <button class=\"fp-dlg-butrename btn\"><\/button>\n        <button class=\"fp-dlg-butcancel btn btn-cancel\">\u53d6\u6d88<\/button>\n    <\/div>\n<\/div>","processexistingfilemultiple":"\n<div class=\"file-picker fp-dlg\">\n    <p class=\"fp-dlg-text\"><\/p>\n    <a class=\"fp-dlg-butoverwrite fp-panel-button\" href=\"#\">\u8986\u76d6<\/a>\n    <a class=\"fp-dlg-butcancel fp-panel-button\" href=\"#\">\u53d6\u6d88<\/a>\n    <a class=\"fp-dlg-butrename fp-panel-button\" href=\"#\"><\/a>\n    <br\/>\n    <a class=\"fp-dlg-butoverwriteall fp-panel-button\" href=\"#\">\u5168\u90e8\u8986\u76d6<\/a>\n    <a class=\"fp-dlg-butrenameall fp-panel-button\" href=\"#\">\u5168\u90e8\u91cd\u547d\u540d<\/a>\n<\/div>","loginform":"\n<div class=\"fp-login-form\">\n    <div class=\"fp-content-center\">\n        <form class=\"form-horizontal\">\n            <div class=\"fp-formset\">\n                <div class=\"fp-login-popup control-group clearfix\">\n                    <div class=\"controls fp-popup\">\n                        <button class=\"fp-login-popup-but btn-primary btn\">\u767b\u5f55\u60a8\u7684\u8d26\u53f7<\/button>\n                    <\/div>\n                <\/div>\n                <div class=\"fp-login-textarea control-group clearfix\">\n                    <div class=\"controls\"><textarea><\/textarea><\/div>\n                <\/div>\n                <div class=\"fp-login-select control-group clearfix\">\n                    <label class=\"control-label\"><\/label>\n\n                    <div class=\"controls\"><select><\/select><\/div>\n                <\/div><div class=\"hide\"><input type=\"text\" class=\"ignoredirty\" \/><input type=\"password\" class=\"ignoredirty\" \/><\/div>\n                <div class=\"fp-login-input control-group clearfix\">\n                    <label class=\"control-label\"><\/label>\n                    <div class=\"controls\"><input\/><\/div>\n                <\/div>\n                <div class=\"fp-login-radiogroup control-group clearfix\">\n                    <label class=\"control-label\"><\/label>\n                    <div class=\"controls fp-login-radio\"><input \/> <label><\/label><\/div>\n                <\/div>\n            <\/div>\n            <p><button class=\"fp-login-submit btn-primary btn\">\u63d0\u4ea4<\/button><\/p>\n        <\/form>\n    <\/div>\n<\/div>"});  M.util.js_complete('random5aaa33185e4545'); });  M.util.js_complete('random5aaa33185e4545'); });
        M.util.js_pending('random5aaa33185e4546'); Y.on('domready', function() {  M.util.js_pending('random5aaa33185e4546'); Y.use('editor_tinymce', function(Y) { M.editor_tinymce.init_editor(Y, "id_message", {"mode":"exact","elements":"id_message","relative_urls":false,"document_base_url":"http:\/\/online.bit.edu.cn\/moodle","moodle_plugin_base":"http:\/\/online.bit.edu.cn\/moodle\/lib\/editor\/tinymce\/plugins\/","content_css":"http:\/\/online.bit.edu.cn\/moodle\/theme\/styles.php\/lambda\/1510491239\/editor","language":"zh_cn","directionality":"ltr","plugin_insertdate_dateFormat ":"%Y\u5e74%m\u6708%d\u65e5 %A","plugin_insertdate_timeFormat ":"%H:%M","theme":"advanced","skin":"moodle","apply_source_formatting":true,"remove_script_host":false,"entity_encoding":"raw","plugins":"lists,table,style,layer,advhr,advlink,emotions,inlinepopups,searchreplace,paste,directionality,fullscreen,nonbreaking,contextmenu,insertdatetime,save,iespell,preview,print,noneditable,visualchars,xhtmlxtras,template,pagebreak,-moodlenolink,-tiny_mce_wiris,-wrap,-moodleimage,-moodlemedia,-managefiles,-ctrlhelp,-pdw","gecko_spellcheck":true,"theme_advanced_font_sizes":"1,2,3,4,5,6,7","theme_advanced_layout_manager":"SimpleLayout","theme_advanced_toolbar_align":"left","theme_advanced_fonts":"Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings","theme_advanced_resize_horizontal":true,"theme_advanced_resizing":true,"theme_advanced_resizing_min_height":30,"min_height":30,"theme_advanced_toolbar_location":"top","theme_advanced_statusbar_location":"bottom","language_load":false,"langrev":1520889073,"theme_advanced_buttons1":"pdw_toggle,wrap,formatselect,wrap,bold,forecolor,italic,wrap,bullist,numlist,wrap,link,unlink,moodlenolink,wrap,image,moodlemedia,managefiles","theme_advanced_buttons2":"undo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl,wrap,nonbreaking,charmap,table","theme_advanced_buttons3":"fontselect,fontsizeselect,code,search,replace,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen,tiny_mce_wiris_formulaEditor,tiny_mce_wiris_formulaEditorChemistry,tiny_mce_wiris_CAS","extended_valid_elements":"nolink,tex,algebra,lang[lang]","custom_elements":"nolink,~tex,~algebra,lang","init_instance_callback":"M.editor_tinymce.onblur_event","moodle_init_plugins":"moodlenolink:loader.php\/moodlenolink\/2015111600\/editor_plugin.js,tiny_mce_wiris:loader.php\/tiny_mce_wiris\/2017040600\/editor_plugin.js,wrap:loader.php\/wrap\/2015111600\/editor_plugin.js,moodleimage:loader.php\/moodleimage\/2015111600\/editor_plugin.js,moodlemedia:loader.php\/moodlemedia\/2015111600\/editor_plugin.js,managefiles:loader.php\/managefiles\/2015111600\/editor_plugin.js,ctrlhelp:loader.php\/ctrlhelp\/2015111600\/editor_plugin.js,pdw:loader.php\/pdw\/2015111600\/editor_plugin.js","file_browser_callback":"M.editor_tinymce.filepicker","managefiles":{"usercontext":124108,"context":164104,"areamaxbytes":-1,"maxbytes":"209715200","subdirs":0,"return_types":3},"pdw_toggle_on":1,"pdw_toggle_toolbars":"2,3"});  M.util.js_complete('random5aaa33185e4546'); });  M.util.js_complete('random5aaa33185e4546'); });
        M.util.js_pending('random5aaa33185e4547'); Y.on('domready', function() {  M.util.js_pending('random5aaa33185e4547'); Y.use('editor_tinymce', function(Y) { M.editor_tinymce.init_filepicker(Y, "id_message", {"image":{"defaultlicense":"allrightsreserved","licenses":[{"shortname":"unknown","fullname":"\u5176\u5b83"},{"shortname":"allrightsreserved","fullname":"\u4fdd\u7559\u4e00\u5207\u6743\u5229"},{"shortname":"public","fullname":"\u516c\u6709\u9886\u57df"},{"shortname":"cc","fullname":"\u521b\u4f5c\u5171\u7528"},{"shortname":"cc-nd","fullname":"\u521b\u4f5c\u5171\u7528 - \u7981\u6b62\u6f14\u7ece"},{"shortname":"cc-nc-nd","fullname":"\u521b\u4f5c\u5171\u7528 - \u975e\u5546\u4e1a\uff0c\u7981\u6b62\u6f14\u7ece"},{"shortname":"cc-nc","fullname":"\u521b\u4f5c\u5171\u7528 - \u975e\u5546\u4e1a"},{"shortname":"cc-nc-sa","fullname":"\u521b\u4f5c\u5171\u7528 - \u975e\u5546\u4e1a\uff0c\u76f8\u540c\u65b9\u5f0f\u5171\u4eab"},{"shortname":"cc-sa","fullname":"\u521b\u4f5c\u5171\u7528 - \u76f8\u540c\u65b9\u5f0f\u5171\u4eab"}],"author":"\u5f20\u7d2b\u7f18","repositories":{"3":{"id":"3","name":"\u4e0a\u4f20\u4e00\u4e2a\u6587\u4ef6","type":"upload","icon":"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/repository_upload\/1510491239\/icon","supported_types":[],"return_types":2,"sortorder":1},"6":{"id":"6","name":"\u6700\u8fd1\u4f7f\u7528\u7684\u6587\u4ef6","type":"recent","icon":"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/repository_recent\/1510491239\/icon","supported_types":[],"return_types":2,"sortorder":2},"5":{"id":"5","name":"Google Drive","type":"googledocs","icon":"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/repository_googledocs\/1510491239\/icon","supported_types":[],"return_types":2,"sortorder":3},"7":{"id":"7","name":"\u5185\u5d4c\u6587\u4ef6","type":"areafiles","icon":"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/repository_areafiles\/1510491239\/icon","supported_types":[],"return_types":1,"sortorder":4}},"externallink":true,"userprefs":{"recentrepository":"3","recentlicense":"allrightsreserved","recentviewmode":""},"accepted_types":[".gif",".jpe",".jpeg",".jpg",".png",".svg",".svgz"],"return_types":3,"context":{"id":164104,"contextlevel":70,"instanceid":"65655","path":"\/1\/155514\/158114\/159969\/164104","depth":"5"},"client_id":"5aaa33186cc31","maxbytes":"209715200","areamaxbytes":-1,"env":"editor","itemid":456390648},"media":{"defaultlicense":"allrightsreserved","licenses":[{"shortname":"unknown","fullname":"\u5176\u5b83"},{"shortname":"allrightsreserved","fullname":"\u4fdd\u7559\u4e00\u5207\u6743\u5229"},{"shortname":"public","fullname":"\u516c\u6709\u9886\u57df"},{"shortname":"cc","fullname":"\u521b\u4f5c\u5171\u7528"},{"shortname":"cc-nd","fullname":"\u521b\u4f5c\u5171\u7528 - \u7981\u6b62\u6f14\u7ece"},{"shortname":"cc-nc-nd","fullname":"\u521b\u4f5c\u5171\u7528 - \u975e\u5546\u4e1a\uff0c\u7981\u6b62\u6f14\u7ece"},{"shortname":"cc-nc","fullname":"\u521b\u4f5c\u5171\u7528 - \u975e\u5546\u4e1a"},{"shortname":"cc-nc-sa","fullname":"\u521b\u4f5c\u5171\u7528 - \u975e\u5546\u4e1a\uff0c\u76f8\u540c\u65b9\u5f0f\u5171\u4eab"},{"shortname":"cc-sa","fullname":"\u521b\u4f5c\u5171\u7528 - \u76f8\u540c\u65b9\u5f0f\u5171\u4eab"}],"author":"\u5f20\u7d2b\u7f18","repositories":{"3":{"id":"3","name":"\u4e0a\u4f20\u4e00\u4e2a\u6587\u4ef6","type":"upload","icon":"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/repository_upload\/1510491239\/icon","supported_types":[],"return_types":2,"sortorder":1},"6":{"id":"6","name":"\u6700\u8fd1\u4f7f\u7528\u7684\u6587\u4ef6","type":"recent","icon":"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/repository_recent\/1510491239\/icon","supported_types":[],"return_types":2,"sortorder":2},"5":{"id":"5","name":"Google Drive","type":"googledocs","icon":"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/repository_googledocs\/1510491239\/icon","supported_types":[],"return_types":2,"sortorder":3},"7":{"id":"7","name":"\u5185\u5d4c\u6587\u4ef6","type":"areafiles","icon":"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/repository_areafiles\/1510491239\/icon","supported_types":[],"return_types":1,"sortorder":4}},"externallink":true,"userprefs":{"recentrepository":"3","recentlicense":"allrightsreserved","recentviewmode":""},"accepted_types":[".3gp",".avi",".dv",".dif",".flv",".f4v",".mov",".movie",".mp4",".m4v",".mpeg",".mpe",".mpg",".ogv",".qt",".rmvb",".rv",".swf",".swfl",".webm",".wmv",".asf",".aac",".aif",".aiff",".aifc",".au",".m3u",".mp3",".m4a",".oga",".ogg",".ra",".ram",".rm",".wav",".wma"],"return_types":3,"context":{"id":164104,"contextlevel":70,"instanceid":"65655","path":"\/1\/155514\/158114\/159969\/164104","depth":"5"},"client_id":"5aaa33186e82b","maxbytes":"209715200","areamaxbytes":-1,"env":"editor","itemid":456390648},"link":{"defaultlicense":"allrightsreserved","licenses":[{"shortname":"unknown","fullname":"\u5176\u5b83"},{"shortname":"allrightsreserved","fullname":"\u4fdd\u7559\u4e00\u5207\u6743\u5229"},{"shortname":"public","fullname":"\u516c\u6709\u9886\u57df"},{"shortname":"cc","fullname":"\u521b\u4f5c\u5171\u7528"},{"shortname":"cc-nd","fullname":"\u521b\u4f5c\u5171\u7528 - \u7981\u6b62\u6f14\u7ece"},{"shortname":"cc-nc-nd","fullname":"\u521b\u4f5c\u5171\u7528 - \u975e\u5546\u4e1a\uff0c\u7981\u6b62\u6f14\u7ece"},{"shortname":"cc-nc","fullname":"\u521b\u4f5c\u5171\u7528 - \u975e\u5546\u4e1a"},{"shortname":"cc-nc-sa","fullname":"\u521b\u4f5c\u5171\u7528 - \u975e\u5546\u4e1a\uff0c\u76f8\u540c\u65b9\u5f0f\u5171\u4eab"},{"shortname":"cc-sa","fullname":"\u521b\u4f5c\u5171\u7528 - \u76f8\u540c\u65b9\u5f0f\u5171\u4eab"}],"author":"\u5f20\u7d2b\u7f18","repositories":{"3":{"id":"3","name":"\u4e0a\u4f20\u4e00\u4e2a\u6587\u4ef6","type":"upload","icon":"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/repository_upload\/1510491239\/icon","supported_types":[],"return_types":2,"sortorder":1},"6":{"id":"6","name":"\u6700\u8fd1\u4f7f\u7528\u7684\u6587\u4ef6","type":"recent","icon":"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/repository_recent\/1510491239\/icon","supported_types":[],"return_types":2,"sortorder":2},"5":{"id":"5","name":"Google Drive","type":"googledocs","icon":"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/repository_googledocs\/1510491239\/icon","supported_types":[],"return_types":2,"sortorder":3},"7":{"id":"7","name":"\u5185\u5d4c\u6587\u4ef6","type":"areafiles","icon":"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/repository_areafiles\/1510491239\/icon","supported_types":[],"return_types":1,"sortorder":4}},"externallink":true,"userprefs":{"recentrepository":"3","recentlicense":"allrightsreserved","recentviewmode":""},"accepted_types":[],"return_types":3,"context":{"id":164104,"contextlevel":70,"instanceid":"65655","path":"\/1\/155514\/158114\/159969\/164104","depth":"5"},"client_id":"5aaa331870025","maxbytes":"209715200","areamaxbytes":-1,"env":"editor","itemid":456390648}});  M.util.js_complete('random5aaa33185e4547'); });  M.util.js_complete('random5aaa33185e4547'); });
        M.util.js_pending('random5aaa33185e4548'); Y.on('domready', function() {  M.util.js_pending('random5aaa33185e4548'); Y.use('form_filemanager', function(Y) { M.form_filemanager.set_templates(Y, {"iconfilename":"\n<div class=\"fp-file\">\n    <a href=\"#\">\n    <div style=\"position:relative;\">\n        <div class=\"fp-thumbnail\"><\/div>\n        <div class=\"fp-reficons1\"><\/div>\n        <div class=\"fp-reficons2\"><\/div>\n    <\/div>\n    <div class=\"fp-filename-field\">\n        <div class=\"fp-filename\"><\/div>\n    <\/div>\n    <\/a>\n    <a class=\"fp-contextmenu\" href=\"#\"><img class=\"smallicon\" alt=\"\u25b6\" title=\"\u25b6\" src=\"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/core\/1510491239\/i\/menu\" \/><\/a>\n<\/div>","listfilename":"\n<span class=\"fp-filename-icon\">\n    <a href=\"#\">\n    <span class=\"fp-icon\"><\/span>\n    <span class=\"fp-reficons1\"><\/span>\n    <span class=\"fp-reficons2\"><\/span>\n    <span class=\"fp-filename\"><\/span>\n    <\/a>\n    <a class=\"fp-contextmenu\" href=\"#\" onclick=\"return false;\"><img class=\"smallicon\" alt=\"\u25b6\" title=\"\u25b6\" src=\"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/core\/1510491239\/i\/menu\" \/><\/a>\n<\/span>","mkdir":"\n<div class=\"filemanager fp-mkdir-dlg\" role=\"dialog\" aria-live=\"assertive\" aria-labelledby=\"fp-mkdir-dlg-title\">\n    <div class=\"fp-mkdir-dlg-text\">\n        <label id=\"fp-mkdir-dlg-title\">\u65b0\u6587\u4ef6\u5939\u540d<\/label><br\/>\n        <input type=\"text\" \/>\n    <\/div>\n    <button class=\"fp-dlg-butcreate btn-primary btn\">\u65b0\u5efa\u6587\u4ef6\u5939<\/button>\n    <button class=\"fp-dlg-butcancel btn-cancel btn\">\u53d6\u6d88<\/button>\n<\/div>","message":"\n<div class=\"file-picker fp-msg\" role=\"alertdialog\" aria-live=\"assertive\" aria-labelledby=\"fp-msg-labelledby\">\n    <p class=\"fp-msg-text\" id=\"fp-msg-labelledby\"><\/p>\n    <button class=\"fp-msg-butok btn-primary btn\">\u786e\u8ba4<\/button>\n<\/div>","fileselectlayout":"\n<div class=\"filemanager fp-select\">\n    <div class=\"fp-select-loading\">\n        <img src=\"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/core\/1510491239\/i\/loading_small\" \/>\n    <\/div>\n    <form class=\"form-horizontal\">\n        <button class=\"fp-file-download\">\u4e0b\u8f7d<\/button>\n        <button class=\"fp-file-delete\">\u5220\u9664<\/button>\n        <button class=\"fp-file-setmain\">\u8bbe\u4e3a\u4e3b\u6587\u4ef6<\/button>\n        <span class=\"fp-file-setmain-help\"><span class=\"helptooltip\"><a href=\"http:\/\/online.bit.edu.cn\/moodle\/help.php?component=repository&amp;identifier=setmainfile&amp;lang=zh_cn\" title=\"\u5173\u4e8e\u201c\u8bbe\u4e3a\u4e3b\u6587\u4ef6\u201d\u7684\u5e2e\u52a9\" aria-haspopup=\"true\" target=\"_blank\"><img src=\"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/core\/1510491239\/help\" alt=\"\u5173\u4e8e\u201c\u8bbe\u4e3a\u4e3b\u6587\u4ef6\u201d\u7684\u5e2e\u52a9\" class=\"iconhelp\" \/><\/a><\/span><\/span>\n        <button class=\"fp-file-zip\">\u538b\u7f29<\/button>\n        <button class=\"fp-file-unzip\">\u89e3\u538b<\/button>\n        <div class=\"fp-hr\"><\/div>\n\n        <div class=\"fp-forminset\">\n                <div class=\"fp-saveas control-group clearfix\">\n                    <label class=\"control-label\">\u540d\u5b57<\/label>\n                    <div class=\"controls\">\n                        <input type=\"text\"\/>\n                    <\/div>\n                <\/div>\n                <div class=\"fp-author control-group clearfix\">\n                    <label class=\"control-label\">\u4f5c\u8005<\/label>\n                    <div class=\"controls\">\n                        <input type=\"text\"\/>\n                    <\/div>\n                <\/div>\n                <div class=\"fp-license control-group clearfix\">\n                    <label class=\"control-label\">\u9009\u62e9\u6388\u6743\u534f\u8bae<\/label>\n                    <div class=\"controls\">\n                        <select><\/select>\n                    <\/div>\n                <\/div>\n                <div class=\"fp-path control-group clearfix\">\n                    <label class=\"control-label\">\u8def\u5f84<\/label>\n                    <div class=\"controls\">\n                        <select><\/select>\n                    <\/div>\n                <\/div>\n                <div class=\"fp-original control-group clearfix\">\n                    <label class=\"control-label\">\u539f\u59cb\u7684<\/label>\n                    <div class=\"controls\">\n                        <span class=\"fp-originloading\"><img class=\"smallicon\" alt=\"\u52a0\u8f7d\u4e2d...\" title=\"\u52a0\u8f7d\u4e2d...\" src=\"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/core\/1510491239\/i\/loading_small\" \/> \u52a0\u8f7d\u4e2d...<\/span><span class=\"fp-value\"><\/span>\n                    <\/div>\n                <\/div>\n                <div class=\"fp-reflist control-group clearfix\">\n                    <label class=\"control-label\">\u522b\u540d\u6216\u5feb\u6377\u65b9\u5f0f<\/label>\n                    <div class=\"controls\">\n                        <p class=\"fp-refcount\"><\/p>\n                        <span class=\"fp-reflistloading\"><img class=\"smallicon\" alt=\"\u52a0\u8f7d\u4e2d...\" title=\"\u52a0\u8f7d\u4e2d...\" src=\"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/core\/1510491239\/i\/loading_small\" \/> \u52a0\u8f7d\u4e2d...<\/span>\n                        <ul class=\"fp-value\"><\/ul>\n                    <\/div>\n                <\/div>\n        <\/div>\n        <div class=\"fp-select-buttons\">\n            <button class=\"fp-file-update btn-primary btn\">\u66f4\u6539<\/button>\n            <button class=\"fp-file-cancel btn-cancel btn\">\u53d6\u6d88<\/button>\n        <\/div>\n    <\/form>\n    <div class=\"fp-info clearfix\">\n        <div class=\"fp-hr\"><\/div>\n        <p class=\"fp-thumbnail\"><\/p>\n        <div class=\"fp-fileinfo\">\n            <div class=\"fp-datemodified\">\u6700\u8fd1\u4fee\u6539 <span class=\"fp-value\"><\/span><\/div>\n            <div class=\"fp-datecreated\">\u521b\u5efa <span class=\"fp-value\"><\/span><\/div>\n            <div class=\"fp-size\">\u5927\u5c0f <span class=\"fp-value\"><\/span><\/div>\n            <div class=\"fp-dimensions\">\u5927\u5c0f <span class=\"fp-value\"><\/span><\/div>\n        <\/div>\n    <\/div>\n<\/div>","confirmdialog":"\n<div class=\"filemanager fp-dlg\">\n    <div class=\"fp-dlg-text\"><\/div>\n    <button class=\"fp-dlg-butconfirm btn-primary btn\">\u786e\u8ba4<\/button>\n    <button class=\"fp-dlg-butcancel btn-cancel btn\">\u53d6\u6d88<\/button>\n<\/div>"});  M.util.js_complete('random5aaa33185e4548'); });  M.util.js_complete('random5aaa33185e4548'); });
        M.util.js_pending('random5aaa33185e4549'); Y.on('domready', function() {  M.util.js_pending('random5aaa33185e4549'); Y.use('form_filemanager', function(Y) { M.form_filemanager.init(Y, {"path":[{"name":"\u6587\u4ef6","path":"\/"}],"itemid":950929203,"list":[],"filecount":0,"mainfile":"","maxbytes":"1048576","maxfiles":"9","client_id":"5aaa33187143c","subdirs":0,"target":"id_attachments","accepted_types":"*","return_types":2,"context":{"id":164104,"contextlevel":70,"instanceid":"65655","path":"\/1\/155514\/158114\/159969\/164104","depth":"5"},"areamaxbytes":-1,"author":"\u5f20\u7d2b\u7f18","licenses":[{"shortname":"unknown","fullname":"\u5176\u5b83"},{"shortname":"allrightsreserved","fullname":"\u4fdd\u7559\u4e00\u5207\u6743\u5229"},{"shortname":"public","fullname":"\u516c\u6709\u9886\u57df"},{"shortname":"cc","fullname":"\u521b\u4f5c\u5171\u7528"},{"shortname":"cc-nd","fullname":"\u521b\u4f5c\u5171\u7528 - \u7981\u6b62\u6f14\u7ece"},{"shortname":"cc-nc-nd","fullname":"\u521b\u4f5c\u5171\u7528 - \u975e\u5546\u4e1a\uff0c\u7981\u6b62\u6f14\u7ece"},{"shortname":"cc-nc","fullname":"\u521b\u4f5c\u5171\u7528 - \u975e\u5546\u4e1a"},{"shortname":"cc-nc-sa","fullname":"\u521b\u4f5c\u5171\u7528 - \u975e\u5546\u4e1a\uff0c\u76f8\u540c\u65b9\u5f0f\u5171\u4eab"},{"shortname":"cc-sa","fullname":"\u521b\u4f5c\u5171\u7528 - \u76f8\u540c\u65b9\u5f0f\u5171\u4eab"}],"defaultlicense":"allrightsreserved","filepicker":{"defaultlicense":"allrightsreserved","licenses":[{"shortname":"unknown","fullname":"\u5176\u5b83"},{"shortname":"allrightsreserved","fullname":"\u4fdd\u7559\u4e00\u5207\u6743\u5229"},{"shortname":"public","fullname":"\u516c\u6709\u9886\u57df"},{"shortname":"cc","fullname":"\u521b\u4f5c\u5171\u7528"},{"shortname":"cc-nd","fullname":"\u521b\u4f5c\u5171\u7528 - \u7981\u6b62\u6f14\u7ece"},{"shortname":"cc-nc-nd","fullname":"\u521b\u4f5c\u5171\u7528 - \u975e\u5546\u4e1a\uff0c\u7981\u6b62\u6f14\u7ece"},{"shortname":"cc-nc","fullname":"\u521b\u4f5c\u5171\u7528 - \u975e\u5546\u4e1a"},{"shortname":"cc-nc-sa","fullname":"\u521b\u4f5c\u5171\u7528 - \u975e\u5546\u4e1a\uff0c\u76f8\u540c\u65b9\u5f0f\u5171\u4eab"},{"shortname":"cc-sa","fullname":"\u521b\u4f5c\u5171\u7528 - \u76f8\u540c\u65b9\u5f0f\u5171\u4eab"}],"author":"\u5f20\u7d2b\u7f18","repositories":{"3":{"id":"3","name":"\u4e0a\u4f20\u4e00\u4e2a\u6587\u4ef6","type":"upload","icon":"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/repository_upload\/1510491239\/icon","supported_types":[],"return_types":2,"sortorder":1},"6":{"id":"6","name":"\u6700\u8fd1\u4f7f\u7528\u7684\u6587\u4ef6","type":"recent","icon":"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/repository_recent\/1510491239\/icon","supported_types":[],"return_types":2,"sortorder":2},"5":{"id":"5","name":"Google Drive","type":"googledocs","icon":"http:\/\/online.bit.edu.cn\/moodle\/theme\/image.php\/lambda\/repository_googledocs\/1510491239\/icon","supported_types":[],"return_types":2,"sortorder":3}},"externallink":true,"userprefs":{"recentrepository":"3","recentlicense":"allrightsreserved","recentviewmode":""},"accepted_types":[],"return_types":2}});  M.util.js_complete('random5aaa33185e4549'); });  M.util.js_complete('random5aaa33185e4549'); });
        M.util.js_pending('random5aaa33185e45410'); Y.on('domready', function() { M.util.js_complete("init");  M.util.js_complete('random5aaa33185e45410'); });
    })();
    //]]>
</script>



<!--[if lte IE 9]>
<script src="http://online.bit.edu.cn/moodle/theme/lambda/javascript/ie/iefix.js"></script>
<![endif]-->


<script>
    jQuery(document).ready(function ($) {
        $('.navbar .dropdown').hover(function() {
            $(this).addClass('extra-nav-class').find('.dropdown-menu').first().stop(true, true).delay(250).slideDown();
        }, function() {
            var na = $(this)
            na.find('.dropdown-menu').first().stop(true, true).delay(100).slideUp('fast', function(){ na.removeClass('extra-nav-class') })
        });

    });

    jQuery(document).ready(function() {
        var offset = 220;
        var duration = 500;
        jQuery(window).scroll(function() {
            if (jQuery(this).scrollTop() > offset) {
                jQuery('.back-to-top').fadeIn(duration);
            } else {
                jQuery('.back-to-top').fadeOut(duration);
            }
        });

        jQuery('.back-to-top').click(function(event) {
            event.preventDefault();
            jQuery('html, body').animate({scrollTop: 0}, duration);
            return false;
        })
    });
</script>


</body>
</html>

