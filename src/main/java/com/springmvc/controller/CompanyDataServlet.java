package com.springmvc.controller;

import com.springmvc.entity.CompanyData;
import com.springmvc.service.companyDataTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

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
        out.println("csPeople = " + companyData.csPeople);
        companyData.surveyPeople = request.getParameter("resNum");
        out.println("surveyPeople = " + companyData.surveyPeople);
        companyData.addition = request.getParameter("otherReason");
        out.println("addition = " + companyData.addition);
        companyData.mainReason = request.getParameter("mainReason");
        out.println("mainReason = " + companyData.mainReason);
        companyData.reduceType = request.getParameter("otherReason2");
        out.println("reduceType = " + companyData.reduceType);
        companyData.mR_instruction = request.getParameter("mainReasonExplain");
        out.println("mR_instruction = " + companyData.mR_instruction);
        companyData.secondReason = request.getParameter("secReason");
        out.println("secondReason = " + companyData.secondReason);
        companyData.sR_instruction = request.getParameter("secReasonExplain");
        out.println("sR_instruction = " + companyData.sR_instruction);
        companyData.thirdReason = request.getParameter("thirdReason");
        out.println("thirdReason = " + companyData.thirdReason);
        companyData.tR_instruction = request.getParameter("thirdReasonExplain");
        out.println("tR_instruction = " + companyData.tR_instruction);
        if(companyData.csPeople.equals("") || companyData.surveyPeople.equals("") || companyData.addition.equals("")){
            out.println("Error, something needed to be written");
        }else {
            boolean end = dataTable.insert(companyData);
            if (end)
            out.println("插入成功");
            else out.println("插入失败");
        }
    }
}
