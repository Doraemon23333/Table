package com.springmvc.controller;

import com.springmvc.entity.Company;
import com.springmvc.service.companyTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class SearchCompanyServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String id = request.getParameter("id");
        Company company = new Company();
        company.originalArea = request.getParameter("Place");
        company.enterprisesNature = request.getParameter("xz");
        company.industry = request.getParameter("hy");
        String choose = request.getParameter("num");
        PrintWriter out = response.getWriter();
        //out.print("originalArea = " + company.originalArea);
        //out.print("enterprisesNature = " + company.enterprisesNature);
        //out.print("industry = " + company.industry);
        //out.print("choose = " + choose);
        companyTable table = new companyTable();
        List<Company> companyList = new ArrayList<Company>();
        table.search(company, companyList, choose);
        //out.print("搜到结果" + companyList.size());
        if (companyList.size() == 0){
            out.print("没有找到符合条件的企业");
        }else if (companyList.size() == 1){
            Company com = null;
            for (Company company1: companyList){
                com = company1;
            }
            String direction = "/province1.jsp?id=" + id + "&companyid=" + com.id;
            response.sendRedirect(direction);
            /*for(Company company1: companyList){
                out.print("originalArea = " + company1.originalArea);
                out.print("enterprisesNature = " + company1.enterprisesNature);
                out.print("industry = " + company1.industry);
                out.print("<br>");
            }*/
        }else {
            out.print("Error, company number more than one");
        }
    }
}
