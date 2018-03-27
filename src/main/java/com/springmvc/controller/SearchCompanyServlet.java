package com.springmvc.controller;

import com.springmvc.entity.Company;
import com.springmvc.entity.Role;
import com.springmvc.entity.User;
import com.springmvc.service.RoleTable;
import com.springmvc.service.companyTable;
import com.springmvc.service.userTable;

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
        String rank = request.getParameter("rank");
        Company company = new Company();
        company.originalArea = request.getParameter("Place");
        company.enterprisesNature = request.getParameter("xz");
        company.industry = request.getParameter("hy");
        String choose = request.getParameter("num");
        PrintWriter out = response.getWriter();

        if (rank.equals("3")){
            RoleTable roleTable = new RoleTable();
            Role role = new Role();
            userTable tableU = new userTable();
            User user = new User();
            tableU.findById(Integer.parseInt(id), user);
            role.id = user.id;
            roleTable.findbyId(role);
            if (role.ifroot == 1 || role.SearchData == 1){
                companyTable table = new companyTable();
                List<Company> companyList = new ArrayList<Company>();
                table.search(company, companyList, choose, Integer.parseInt(id));
                if (companyList.size() == 0){
                    out.print("没有找到符合条件的企业");
                }else if (companyList.size() == 1){
                    Company com = null;
                    for (Company company1: companyList){
                        com = company1;
                    }
                    String direction = "/province1.jsp?id=" + id + "&companyid=" + com.id + "&rank=" + rank;
                    response.sendRedirect(direction);
                }else {
                    out.print("Error, company number more than one");
                }
            }else {
                out.println("您没有查看企业备案的权限");
            }
        }else {
            companyTable table = new companyTable();
            List<Company> companyList = new ArrayList<Company>();
            table.search(company, companyList, choose, Integer.parseInt(id));
            if (companyList.size() > 0){
                Company city = new Company();
                city.id = Integer.parseInt(id);
                table.show(city);
                for (Company c: companyList){
                    if (c.originalArea.equals(city.originalArea)){
                    }else {
                        companyList.remove(c);
                    }
                }
            }
            if (companyList.size() == 0){
                out.print("没有找到符合条件的企业");
            }else if (companyList.size() == 1){
                Company com = null;
                for (Company company1: companyList){
                    com = company1;
                }
                String direction = "/province1.jsp?id=" + id + "&companyid=" + com.id + "&rank=" + rank;
                response.sendRedirect(direction);
            }else {
                out.print("Error, company number more than one");
            }
        }
    }
}
