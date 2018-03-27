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

public class ChangeCompanyServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String id = request.getParameter("id");
        String rank = request.getParameter("rank");
        String name = request.getParameter("name");
        String nameCode = request.getParameter("nameCode");
        String companyid = request.getParameter("companyid");
        String password = request.getParameter("password");
        PrintWriter out = response.getWriter();

        if (rank.equals("2")){
            out.println("您没有该权限");
        }else if (rank.equals("3")){
            RoleTable roleTable = new RoleTable();
            Role role = new Role();
            userTable tableU = new userTable();
            User user = new User();
            tableU.findById(Integer.parseInt(id), user);
            role.id = user.id;
            roleTable.findbyId(role);
            if (role.SetUser == 1 || role.ifroot == 1){
                companyTable table = new companyTable();
                Company company = new Company();
                company.id = Integer.parseInt(companyid);
                table.findbyId(company);
                table.updateS(Integer.parseInt(companyid), "name", name);
                table.updateS(Integer.parseInt(companyid), "nameCode", nameCode);

                userTable table1 = new userTable();
                User user1 = new User();
                table1.findById(Integer.parseInt(companyid), user1);
                table1.updateS("accompanyName", name, Integer.parseInt(companyid));
                table1.updateS("password", password, Integer.parseInt(companyid));

                out.println("修改成功");
            } else {
                out.println("您没有相关权限");
            }
        }
    }
}
