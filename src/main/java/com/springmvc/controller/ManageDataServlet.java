package com.springmvc.controller;

import com.springmvc.other.AreaCode;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

public class ManageDataServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String place = request.getParameter("Place");
        String enterpriseNature = request.getParameter("xz");
        String industry = request.getParameter("hy");
        String startTime = request.getParameter("ks");
        String name = request.getParameter("num");
        String id = request.getParameter("id");
        String rank = request.getParameter("rank");
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH);
        int day = c.get(Calendar.DAY_OF_MONTH);
        out.print(name);
        if (startTime.equals("本月")){
            month++;
        }else {
        }
        //out.print("place = " + place + ",enterpriseNature = " + enterpriseNature + "industry = " + industry);
        if(name.equals("") || name.equals("企业名称或编号")){
            AreaCode areaCode = new AreaCode();
            String placecode = areaCode.toCode(place);
            String enterpriseNaturecode = areaCode.enterpriseNatureToCode(enterpriseNature);
            String industrycode = areaCode.industryToCode(industry);
            response.sendRedirect("/province3.jsp?id=" + id + "&rank=" + rank + "&industrycode=" + industrycode + "&placecode=" + placecode
            + "&enterpriseNaturecode=" + enterpriseNaturecode + "&year=" + year + "&month=" + month + "&choose=1");
        }else {
        }
    }
}
