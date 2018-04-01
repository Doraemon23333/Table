package com.springmvc.controller;

import com.springmvc.entity.Browser;
import com.springmvc.entity.Company;
import com.springmvc.entity.Role;
import com.springmvc.entity.User;
import com.springmvc.other.AreaCode;
import com.springmvc.service.RoleTable;
import com.springmvc.service.browserTable;
import com.springmvc.service.companyTable;
import com.springmvc.service.userTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

public class CompanyServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=utf-8");
        String id = request.getParameter("id");
        //out.println("id = " + id);
        Company company = new Company();
        company.id = Integer.parseInt(id);
        companyTable tableT = new companyTable();
        Company company1 = new Company();
        company1.id = Integer.parseInt(id);
        tableT.show(company1);
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
        AreaCode areaCode = new AreaCode();

        if (company.fax.equals("") || company.telephone.equals("") || company.postalCode.equals("") || company.Address.equals("") || company.People.equals("") ||
                company.mainBusiness.equals("") ||
                company.enterprisesNature.equals("") ||
                company.industry.equals("") ||
                company.nameCode.equals("") ||
                company.name.equals("") ||
                company.originalArea.equals("") ||
                company.id < 1){
            out.print("Error!!!, something needed to be written");
        }else if (areaCode.toCode(company.originalArea).equals("fail")){
            out.println("请输入正确地级市名称");
        }else{
            browserTable table1 = new browserTable();
            userTable table2 = new userTable();
            User user = new User();
            table2.findById(Integer.parseInt(request.getParameter("id")), user);
            Browser browser = new Browser();
            Calendar c = Calendar.getInstance();
            int year = c.get(Calendar.YEAR);
            int month = c.get(Calendar.MONTH);
            int day = c.get(Calendar.DAY_OF_MONTH);
            browser.broswerDay = day;
            browser.broswerYear = year;
            browser.broswerMonth = month + 1;
            browser.id = Integer.parseInt(id);
            browser.rank = 1;

            if (table.find(company.id)){
                table.insert(company);
                browser.content = user.accompanyName + "提交了企业备案";
                table1.insert(browser);
                out.print("添加成功, 请重新登陆");
            }else {
                int ch = 0;
                if (company1.originalArea.equals("山东")){
                    table.updateS(company.id, "originalArea", company.originalArea);
                    ch ++;
                }
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
                browser.content = user.accompanyName + "更新了企业备案";
                table1.insert(browser);
                out.print("更新成功");
                if (ch > 0){
                    response.sendRedirect("/companyhome.jsp?id=" + id);
                }
            }
        }
    }
}
