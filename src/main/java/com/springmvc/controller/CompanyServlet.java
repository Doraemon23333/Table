package com.springmvc.controller;

import com.springmvc.entity.Company;
import com.springmvc.service.companyTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class CompanyServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=utf-8");
        String id = request.getParameter("id");
        //out.println("id = " + id);
        Company company = new Company();
        company.id = Integer.parseInt(id);
        company.originalArea = request.getParameter("owned");
        //out.println("originalArea = " + company.originalArea);
        company.nameCode = request.getParameter("number");
        //out.println("nameCode = " + company.nameCode);
        company.name = request.getParameter("companyName");
        //out.println("name = " + company.name);
        company.industry = request.getParameter("industry");
        //out.println("industry = " + company.industry);
        company.enterprisesNature = request.getParameter("property");
        //out.println("enterprisesNature = " + company.enterprisesNature);
        company.mainBusiness = request.getParameter("mainBusiness");
        //out.println("mainBusiness = " + company.mainBusiness);
        company.People = request.getParameter("contactName");
        //out.println("People = " + company.People);
        company.Address = request.getParameter("place");
        //out.println("Address = " + company.Address);
        company.postalCode = request.getParameter("postalcode");
        //out.println("postalCode = " + company.postalCode);
        company.telephone = request.getParameter("telephone");
        //out.println("telephone = " + company.telephone);
        company.fax = request.getParameter("fax");
        //out.println("fax = " + company.fax);
        company.email = request.getParameter("email");
        //out.println("email = " + company.email);
        companyTable table = new companyTable();
        if (company.fax.equals("") || company.telephone.equals("") || company.postalCode.equals("") || company.Address.equals("") || company.People.equals("") ||
                company.mainBusiness.equals("") ||
                company.enterprisesNature.equals("") ||
                company.industry.equals("") ||
                company.nameCode.equals("") ||
                company.name.equals("") ||
                company.originalArea.equals("") ||
                company.id < 1){
            out.print("Error!!!, something needed to be written");
        }else {
            if (table.find(company.id)){
                table.insert(company);
                out.print("添加成功");
            }else {
                table.updateS(company.id, "originalArea", company.originalArea);
                table.updateS(company.id, "nameCode", company.nameCode);
                table.updateS(company.id, "name", company.name);
                table.updateS(company.id, "industry", company.industry);
                table.updateS(company.id, "enterprisesNature", company.enterprisesNature);
                table.updateS(company.id, "mainBusiness", company.mainBusiness);
                table.updateS(company.id, "People", company.People);
                table.updateS(company.id, "Address", company.Address);
                table.updateS(company.id, "postalCode", company.postalCode);
                table.updateS(company.id, "telephone", company.telephone);
                table.updateS(company.id, "fax", company.fax);
                if (company.email.equals("")){
                }else {
                    table.updateS(company.id, "email", company.email);
                }
                out.print("更新成功");
            }
        }
    }
}
