package com.springmvc.controller;

import com.springmvc.entity.Investigation;
import com.springmvc.entity.Role;
import com.springmvc.entity.User;
import com.springmvc.service.InvestigationTable;
import com.springmvc.service.RoleTable;
import com.springmvc.service.provinceTable;
import com.springmvc.service.userTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class SetInvestigationServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String id = request.getParameter("id");
        String rank = request.getParameter("rank");
        String begin = request.getParameter("begin");
        String end = request.getParameter("end");
        PrintWriter out = response.getWriter();

        String yearb = begin.substring(0, 4);
        String monthb = begin.substring(5, 7);
        String dayb = begin.substring(8);
        String yeare = end.substring(0, 4);
        String monthe = end.substring(5, 7);
        String daye = end.substring(8);

        if (rank.equals("3")){
            provinceTable table = new provinceTable();
            User province = new User();
            table.findById(Integer.parseInt(id), province);

            Role role = new Role();
            role.RoleNum = province.roleId;
            RoleTable roleTable = new RoleTable();
            roleTable.find(role);
            if (role.ifroot == 1 || role.SetDate == 1){
                Investigation investigation = new Investigation();
                investigation.beginDay = Integer.parseInt(dayb);
                investigation.beginMonth = Integer.parseInt(monthb);
                investigation.beginYear = Integer.parseInt(yearb);
                investigation.publishId = Integer.parseInt(id);
                investigation.endYear = Integer.parseInt(yeare);
                investigation.endMonth = Integer.parseInt(monthe);
                investigation.endDay = Integer.parseInt(daye);

                InvestigationTable investigationTable = new InvestigationTable();
                boolean message =investigationTable.insert(investigation);
                if (message)
                out.println("新增调查期成功");
                else {
                    out.println("新增调查期失败，可能该调查期已经建立");
                }
            }else {
                out.println("您没有增加调查期的权限");
            }
        }else if (rank.equals("2")){
            out.println("您没有增加调查期的权限");
        }
    }
}
