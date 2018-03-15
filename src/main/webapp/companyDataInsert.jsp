<%--
  Created by IntelliJ IDEA.
  User: zfr
  Date: 2018/3/14
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
     <title>企业数据查询</title>

    <meta name="description" content="This is page-header (.page-header &amp;gt; h1)"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script src="js/companyRecordInfo.js" type="text/javascript" ></script>
    <link href="css/companyRecordInfo.css" type="text/css" rel="stylesheet" media="screen, projection" />
    <!--<link href="css/companyRecord2.css" type="text/css" rel="stylesheet" media="screen, projection" />
    <link href="css/companyRecord3.css" type="text/css" rel="stylesheet" media="screen, projection" />-->
    <link href="css/companyRecord4.css" type="text/css" rel="stylesheet" media="screen, projection" />

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
<%! String userid = null;%>
<%
    String id = request.getParameter("id");
    userid = id;
%>
<div class="nav-box">
    <ul class="container nav">
        <li><a href="companyhome.jsp?id=<%=request.getParameter("id")%>">首页</a></li>
        <li><a href="companyRecordInfo.jsp?id=<%=request.getParameter("id")%>">备案信息</a></li>
        <li><a href="companyDataInsert.jsp?id=<%=request.getParameter("id")%>">数据填报</a></li>
        <li><a href="companyDataSelect.jsp?id=<%=request.getParameter("id")%>">数据查询</a></li>
        <li><a href="/">退出</a></li>
    </ul>
</div>

<div class="main-container container no-sidebar">
    <div class="main-content">

        <div class="page-content">
            <div class="row-fluid">
                <!--PAGE CONTENT BEGINS HERE-->
                <div class="content">

                    <!--<div class="hr dotted"></div>-->
                    <form action="/userProject/saveInfo/5801" method="post" class="form-horizontal" >

                        <input type="hidden" name="version" value="0" id="version" />
                        <table class="table table-striped">
                            <tr class="">

                                <td><b class="blue">数据项</b></td>
                                <td></td>
                            </tr>

                            <tr class="">
                                <td>建档期就业人数</td>
                                <td>
                                    <input type="text" id="recordNum" name="RecordNum" style="height: 30px;"value="初次建档时监测点就业人数" onfocus="javascript:if(this.value=='初次建档时监测点就业人数')this.value='';"/>
                                    <b class="red">*为必填</b>
                                </td>
                            </tr>

                            <tr class="">
                                <td>调查期就业人数</td>
                                <td>
                                    <input type="text" id="resNum" name="resNum" style="height: 30px;"value="本次调查期当时的监测点就业人数" onfocus="javascript:if(this.value=='本次调查期当时的监测点就业人数')this.value='';"/>
                                    <b class="red">*</b>
                                </td>
                            </tr>

                            <tr class="">
                                <td>其他原因</td>
                                <td>
                                    <input type="text" id="otherReason" name="otherReason" style="height: 30px;"value="" />
                                    <b class="red">*</b>
                                </td>
                            </tr>

                            <tr class="">
                                <td>就业人数减少类型</td>
                                <td>
                                    <input type="text" id="decType" name="otherReason" style="height: 30px;"value="" />
                                </td>
                            </tr>

                            <tr class="">

                                <td><b class="blue">就业人数减少原因</b></td>
                                <td></td>
                            </tr>

                            <tr class="">

                                <td>主要原因</td>
                                <td>
                                    <select name="mainReason" id="mainReason" >
                                        <option value="产业结构调整" >产业结构调整</option>
                                        <option value="重大技术改革" >重大技术改革</option>
                                        <option value="节能减排、淘汰落后产能">节能减排、淘汰落后产能</option>
                                        <option value="订单不足">订单不足</option>
                                        <option value="原材料涨价">原材料涨价</option>
                                        <option value="工资、社保等用工成本上升">工资、社保等用工成本上升</option>
                                        <option value="自然减员">自然减员</option>
                                        <option value="经营资金困难">经营资金困难</option>
                                        <option value="税收政策变化（包括税负增加或出口退税减少等）">税收政策变化（包括税负增加或出口退税减少等）</option>
                                        <option value="季节性用工">季节性用工</option>
                                        <option value="自行离职">自行离职</option>
                                        <option value="工作调动、企业内部调剂">工作调动、企业内部调剂</option>
                                        <option value="劳动关系转移、劳务派遣">劳动关系转移、劳务派遣</option>
                                        <option value="其他">其他</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="">

                                <td>主要原因说明</td>
                                <td>
                                    <input type="text" name="mainReasonExplain" value="" id="mainReasonExplain"style="height: 30px;"/>
                                </td>
                            </tr>
                            <tr class="">

                                <td>次要原因</td>
                                <td>

                                    <select name="secReason" id="secReason" >
                                        <option value="产业结构调整" >产业结构调整</option>
                                        <option value="重大技术改革" >重大技术改革</option>
                                        <option value="节能减排、淘汰落后产能">节能减排、淘汰落后产能</option>
                                        <option value="订单不足">订单不足</option>
                                        <option value="原材料涨价">原材料涨价</option>
                                        <option value="工资、社保等用工成本上升">工资、社保等用工成本上升</option>
                                        <option value="自然减员">自然减员</option>
                                        <option value="经营资金困难">经营资金困难</option>
                                        <option value="税收政策变化（包括税负增加或出口退税减少等）">税收政策变化（包括税负增加或出口退税减少等）</option>
                                        <option value="季节性用工">季节性用工</option>
                                        <option value="自行离职">自行离职</option>
                                        <option value="工作调动、企业内部调剂">工作调动、企业内部调剂</option>
                                        <option value="劳动关系转移、劳务派遣">劳动关系转移、劳务派遣</option>
                                        <option value="其他">其他</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="">

                                <td>次要原因说明</td>
                                <td>
                                    <input type="text" name="secReasonExplain" value="" id="secReasonExplain" style="height: 30px;"/>
                                </td>
                            </tr>
                            <tr class="">

                                <td>第三原因</td>
                                <td>
                                    <select name="thirdReason" id="thirdReason" >
                                        <option value="产业结构调整" >产业结构调整</option>
                                        <option value="重大技术改革" >重大技术改革</option>
                                        <option value="节能减排、淘汰落后产能">节能减排、淘汰落后产能</option>
                                        <option value="订单不足">订单不足</option>
                                        <option value="原材料涨价">原材料涨价</option>
                                        <option value="工资、社保等用工成本上升">工资、社保等用工成本上升</option>
                                        <option value="自然减员">自然减员</option>
                                        <option value="经营资金困难">经营资金困难</option>
                                        <option value="税收政策变化（包括税负增加或出口退税减少等）">税收政策变化（包括税负增加或出口退税减少等）</option>
                                        <option value="季节性用工">季节性用工</option>
                                        <option value="自行离职">自行离职</option>
                                        <option value="工作调动、企业内部调剂">工作调动、企业内部调剂</option>
                                        <option value="劳动关系转移、劳务派遣">劳动关系转移、劳务派遣</option>
                                        <option value="其他">其他</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="">

                                <td>第三原因说明</td>
                                <td>
                                    <input type="text" name="thirdReasonExplain" value="" id="thirdReasonExplain" style="height: 30px;"/>
                                </td>
                            </tr>

                        </table>



                        <div class="form-actions">

                            <button type="submit" class="btn btn-primary">
                                填报
                            </button>
                        </div>
                    </form>

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
