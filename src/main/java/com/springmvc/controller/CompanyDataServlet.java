package com.springmvc.controller;

import com.springmvc.entity.Browser;
import com.springmvc.entity.CompanyData;
import com.springmvc.entity.User;
import com.springmvc.service.browserTable;
import com.springmvc.service.companyDataTable;
import com.springmvc.service.userTable;

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
        companyDataTable dataTable = new companyDataTable();
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
            boolean end = dataTable.insert(companyData);
            if (end){
                User user = new User();
                userTable table = new userTable();
                table.findById(Integer.parseInt(id), user);
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
            }
            else out.println("插入失败");
        }
    }
}
