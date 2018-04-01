package com.springmvc.controller;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.springmvc.entity.CompanyData;
import com.springmvc.entity.User;
import com.springmvc.service.companyDataTable;
import com.springmvc.service.userTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;

public class AnalysisServlet extends HttpServlet{
    int sum = 0, csSum = 0, surSum = 0;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String id = request.getParameter("id");
        String rank = request.getParameter("rank");
        String firstTime = request.getParameter("firstTime");
        String secondTime = request.getParameter("secondTime");
        String analyze = request.getParameter("analyze");
        String property = request.getParameter("property");
        PrintWriter out = response.getWriter();
        if (secondTime.equals("") || firstTime.equals("")){
            out.println("请输入时间");
        }else if (analyze.equals("")){
            out.println("请选择分析方式");
        }else if (property.equals("")){
            out.println("请选择分析指标");
        }else {
            int choose = 0;
            if (analyze.equals("地区")){
                if (property.equals("企业总数")){
                    choose = 11;
                }else if (property.equals("建档期总岗位数")){
                    choose = 12;
                }else if (property.equals("调查期总岗位数")){
                    choose = 13;
                }
            }else if (analyze.equals("企业性质")){
                if (property.equals("企业总数")){
                    choose = 21;
                }else if (property.equals("建档期总岗位数")){
                    choose = 22;
                }else if (property.equals("调查期总岗位数")){
                    choose = 23;
                }
            }else if (analyze.equals("行业")){
                if (property.equals("企业总数")){
                    choose = 31;
                }else if (property.equals("建档期总岗位数")){
                    choose = 32;
                }else if (property.equals("调查期总岗位数")){
                    choose = 33;
                }
            }
            response.sendRedirect("/compareAnalysis.jsp?id=" + id + "&rank=" + rank + "&choose=" + choose
            + "&firstTime=" + firstTime + "&secondTime=" + secondTime);
        }
    }
}
