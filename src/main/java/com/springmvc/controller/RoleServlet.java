package com.springmvc.controller;

import com.springmvc.entity.Role;
import com.springmvc.entity.User;
import com.springmvc.service.RoleTable;
import com.springmvc.service.provinceTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class RoleServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String id = request.getParameter("id");
        String rank = request.getParameter("rank");
        PrintWriter out = response.getWriter();
        if (rank.equals("3")){
            User province = new User();
            provinceTable table  = new provinceTable();
            table.findById(Integer.parseInt(request.getParameter("id")), province);
            Role role = new Role();
            role.RoleNum = province.roleId;
            RoleTable roleTable = new RoleTable();
            roleTable.find(role);
            if (role.ifroot == 1){
                int SearchCompany = Integer.parseInt(request.getParameter("SearchCompany"));
                int SearchData = Integer.parseInt(request.getParameter("SearchData"));
                int SetDate = Integer.parseInt(request.getParameter("SetDate"));
                int SetRole = Integer.parseInt(request.getParameter("SetRole"));
                int SetSystem = Integer.parseInt(request.getParameter("SetSystem"));
                int SetUser = Integer.parseInt(request.getParameter("SetUser"));
                int CreateNews = Integer.parseInt(request.getParameter("CreateNews"));
                Role role1 = new Role();
                role1.RoleNum = Integer.parseInt(request.getParameter("roleNum"));
                roleTable.updateI("SearchCompany", SearchCompany, role1.RoleNum);
                roleTable.updateI("SearchData", SearchData, role1.RoleNum);
                roleTable.updateI("SetDate", SetDate, role1.RoleNum);
                roleTable.updateI("SetRole", SetRole, role1.RoleNum);
                roleTable.updateI("SetSystem", SetSystem, role1.RoleNum);
                roleTable.updateI("SetUser", SetUser, role1.RoleNum);
                roleTable.updateI("CreateNews", CreateNews, role1.RoleNum);
                out.println("修改成功");
            }else{
                out.println("非管理员无法修改权限");
            }
        }else out.println("您没有该权限");
    }
}
