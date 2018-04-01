package com.springmvc.controller;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.springmvc.entity.*;
import com.springmvc.other.AreaCode;
import com.springmvc.service.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CompanyDataServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=utf-8");
        String id = request.getParameter("id");

        userTable table = new userTable();
        cityTable citytable = new cityTable();
        companyDataTable dataTable = new companyDataTable();
        companyTable tableC = new companyTable();

        CompanyData companyData = new CompanyData();
        companyData.id = Integer.parseInt(id);
        companyData.csPeople = request.getParameter("RecordNum");
        //out.println("csPeople = " + companyData.csPeople);
        companyData.surveyPeople = request.getParameter("resNum");
        //out.println("surveyPeople = " + companyData.surveyPeople);
        companyData.addition = request.getParameter("otherReason");
        //out.println("addition = " + companyData.addition);
        companyData.mainReason = request.getParameter("mainReason");
        //out.println("mainReason = " + companyData.mainReason);
        companyData.reduceType = request.getParameter("otherReason2");
        //out.println("reduceType = " + companyData.reduceType);
        companyData.mR_instruction = request.getParameter("mainReasonExplain");
        //out.println("mR_instruction = " + companyData.mR_instruction);
        companyData.secondReason = request.getParameter("secReason");
        //out.println("secondReason = " + companyData.secondReason);
        companyData.sR_instruction = request.getParameter("secReasonExplain");
        //out.println("sR_instruction = " + companyData.sR_instruction);
        companyData.thirdReason = request.getParameter("thirdReason");
        //out.println("thirdReason = " + companyData.thirdReason);
        companyData.tR_instruction = request.getParameter("thirdReasonExplain");
        //out.println("tR_instruction = " + companyData.tR_instruction);
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH);
        int day = c.get(Calendar.DAY_OF_MONTH);
        AreaCode areaCode = new AreaCode();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        month++;
        String data = areaCode.checkYear(year) + "-" + areaCode.checkMonth(month) + "-" + areaCode.checkDay(day);
        String rank = request.getParameter("rank");
        if(companyData.csPeople.equals("") || companyData.surveyPeople.equals("") || companyData.addition.equals("")){
            out.println("Error, something needed to be written");
        }else {
            int inte1 = Integer.parseInt(companyData.csPeople);
            int inte2 = Integer.parseInt(companyData.surveyPeople);
            if (inte1 <= inte2){
                if (rank.equals("1")){
                    User user = new User();
                    table.findById(Integer.parseInt(id), user);
                    Company company = new Company();
                    company.id = user.id;
                    tableC.findbyId(company);
                    User city = new User();
                    citytable.find("area", company.originalArea, city);

                    int ch = 0;
                    InvestigationTable investigationTable = new InvestigationTable();
                    try {
                        Date date = df.parse(data);
                        Connection connection = investigationTable.getConnection();
                        String sql = "select * from investigationTable";
                        PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
                        Statement stmt = (Statement) connection.createStatement();
                        ResultSet rs = stmt.executeQuery(sql);
                        while (rs.next()){
                            String yearb = areaCode.checkYear(rs.getInt("beginYear"));
                            String monthb = areaCode.checkMonth(rs.getInt("beginMonth"));
                            String dayb = areaCode.checkDay(rs.getInt("beginDay"));
                            String yeare = areaCode.checkYear(rs.getInt("endYear"));
                            String monthe = areaCode.checkMonth(rs.getInt("endMonth"));
                            String daye = areaCode.checkDay(rs.getInt("endDay"));
                            String beginC = yearb + "-" + monthb + "-" + dayb;
                            String endC = yeare + "-" + monthe + "-" + daye;
                            Date begin = df.parse(beginC);
                            Date end = df.parse(endC);
                            if (date.getTime() >= begin.getTime() && date.getTime() <= end.getTime()){
                                ch = 1;
                                break;
                            }
                        }
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                    if (ch > 0){
                        if (dataTable.insert(companyData)){
                            Browser browser = new Browser();
                            browser.broswerDay = day;
                            browser.broswerYear = year;
                            browser.broswerMonth = month;
                            browser.id = Integer.parseInt(id);
                            browser.rank = 1;
                            browser.content = user.accompanyName + "提交了一个新的企业数据";
                            browserTable table1 = new browserTable();
                            table1.insert(browser);
                            out.println("提交成功");

                            dataTable.findId(companyData);

                            Notification notification = new Notification();
                            notification.publishYear = year;
                            notification.publishMonth = month;
                            notification.publishDay = day;
                            notification.id = Integer.parseInt(id);
                            notification.rank = 1;
                            notification.receiverRank = 2;
                            notification.receiverId = city.id;
                            notification.type = 1;
                            notification.companyDataId = companyData.companyDataId;
                            notification.content = "<p>建档期就业人数: "+ companyData.csPeople + "</p><p>调查期就业人数: " + companyData.surveyPeople
                                    + "</p><p>其他原因: " + companyData.addition + "</p><p>就业人数减少类型: " + companyData.reduceType
                                    + "</p><p>主要原因: " + companyData.mainReason + "</p><p>主要原因说明: " + companyData.mR_instruction
                                    + "</p><p>次要原因: " + companyData.secondReason + "</p><p>次要原因说明: " + companyData.sR_instruction
                                    + "</p><p>第三原因: " + companyData.thirdReason + "</p><p>第三原因说明: " + companyData.tR_instruction + "</p>";
                            notification.title = user.accompanyName + "提交了一份企业数据有待审核";
                            notificationTable table2 = new notificationTable();
                            table2.insert(notification);
                        }else out.println("插入失败");
                    }else out.println("调查期外无法更新企业数据");
                }else if (rank.equals("3")){
                    User user = new User();
                    provinceTable table1 = new provinceTable();
                    table1.findById(Integer.parseInt(id), user);

                    Browser browser = new Browser();
                    browser.broswerDay = day;
                    browser.broswerYear = year;
                    browser.broswerMonth = month;
                    browser.id = Integer.parseInt(id);
                    browser.rank = 1;
                    browser.content = user.accompanyName + "修改了一个企业数据";
                    browserTable table2 = new browserTable();
                    table2.insert(browser);
                    out.println("提交成功");

                    int companyDataId = Integer.parseInt(request.getParameter("companyDataId"));
                    companyDataTable table3 = new companyDataTable();
                    table3.updateI("csPeople", Integer.parseInt(companyData.csPeople), companyDataId);
                    table3.updateI("surveyPeople", Integer.parseInt(companyData.surveyPeople), companyDataId);
                    table3.updateS("addition", companyData.addition, companyDataId);
                    table3.updateS("reduceType", companyData.reduceType, companyDataId);
                    table3.updateS("mainReason", companyData.mainReason, companyDataId);
                    table3.updateS("mR_instruction", companyData.mR_instruction, companyDataId);
                    table3.updateS("secondReason", companyData.secondReason, companyDataId);
                    table3.updateS("sR_instruction", companyData.sR_instruction, companyDataId);
                    table3.updateS("thirdReason", companyData.thirdReason, companyDataId);
                    table3.updateS("tR_instruction", companyData.tR_instruction, companyDataId);
                }else if (rank.equals("2")){
                    out.println("市无法修改企业数据");
                }
            }else {
                out.println("请表明人员减少原因");
            }
        }
    }
}
