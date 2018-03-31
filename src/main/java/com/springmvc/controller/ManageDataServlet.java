package com.springmvc.controller;

import com.springmvc.entity.Role;
import com.springmvc.entity.User;
import com.springmvc.other.AreaCode;
import com.springmvc.service.RoleTable;
import com.springmvc.service.userTable;

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
        if (startTime.equals("")){
            startTime = "0";
        }

        if (rank.equals("3")){
            RoleTable roleTable = new RoleTable();
            Role role = new Role();
            userTable table = new userTable();
            User user = new User();
            table.findById(Integer.parseInt(id), user);
            role.id = user.id;
            roleTable.findbyId(role);
            if (role.SearchData == 1 || role.ifroot == 1){
                if(name.equals("") || name.equals("企业名称或编号")){
                    AreaCode areaCode = new AreaCode();
                    String placecode = areaCode.toCode(place);
                    String enterpriseNaturecode = areaCode.enterpriseNatureToCode(enterpriseNature);
                    String industrycode = areaCode.industryToCode(industry);
                    response.sendRedirect("/province3.jsp?id=" + id + "&rank=" + rank + "&industrycode=" + industrycode + "&placecode=" + placecode
                            + "&enterpriseNaturecode=" + enterpriseNaturecode + "&choose=1&investigationId=" + startTime);
                }
            }else {
                out.println("您没有查看企业数据的权限");
            }
        }else {
            if(name.equals("") || name.equals("企业名称或编号")){
                AreaCode areaCode = new AreaCode();
                String placecode = areaCode.toCode(place);
                String enterpriseNaturecode = areaCode.enterpriseNatureToCode(enterpriseNature);
                String industrycode = areaCode.industryToCode(industry);
                response.sendRedirect("/province3.jsp?id=" + id + "&rank=" + rank + "&industrycode=" + industrycode + "&placecode=" + placecode
                        + "&enterpriseNaturecode=" + enterpriseNaturecode + "&choose=1&investigationId=" + startTime);
            }else {
            }
        }
    }
}
