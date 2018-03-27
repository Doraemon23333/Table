package com.springmvc.controller;

import com.springmvc.entity.*;
import com.springmvc.service.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

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
        if(companyData.csPeople.equals("") || companyData.surveyPeople.equals("") || companyData.addition.equals("")){
            out.println("Error, something needed to be written");
        }else {
            User user = new User();
            table.findById(Integer.parseInt(id), user);
            Company company = new Company();
            company.id = user.id;
            tableC.findbyId(company);
            User city = new User();
            citytable.find("area", company.originalArea, city);

            boolean end = dataTable.insert(companyData);
            if (end){
                Browser browser = new Browser();
                Calendar c = Calendar.getInstance();
                int year = c.get(Calendar.YEAR);
                int month = c.get(Calendar.MONTH);
                int day = c.get(Calendar.DAY_OF_MONTH);
                browser.broswerDay = day;
                browser.broswerYear = year;
                browser.broswerMonth = month;
                browser.id = Integer.parseInt(id);
                browser.rank = 1;
                browser.content = user.accompanyName + "提交了一个新的企业数据";
                browserTable table1 = new browserTable();
                table1.insert(browser);
                out.println("插入成功");

                Notification notification = new Notification();
                notification.publishYear = year;
                notification.publishMonth = month;
                notification.publishDay = day;
                notification.id = Integer.parseInt(id);
                notification.rank = 1;
                notification.receiverRank = 2;
                notification.receiverId = city.id;
                notification.content = "<p>建档期就业人数: "+ companyData.csPeople + "</p><p>调查期就业人数: " + companyData.surveyPeople
                        + "</p><p>其他原因: " + companyData.addition + "</p><p>就业人数减少类型: " + companyData.reduceType
                        + "</p><p>主要原因: " + companyData.mainReason + "</p><p>主要原因说明: " + companyData.mR_instruction
                        + "</p><p>次要原因: " + companyData.secondReason + "</p><p>次要原因说明: " + companyData.sR_instruction
                        + "</p><p>第三原因: " + companyData.thirdReason + "</p><p>第三原因说明: " + companyData.tR_instruction + "</p>";
                notification.title = user.accompanyName + "提交了一份企业数据有待审核";
                notificationTable table2 = new notificationTable();
                table2.insert(notification);
            }
            else out.println("插入失败");
        }
    }
}
