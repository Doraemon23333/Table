package com.springmvc.controller;

import com.springmvc.entity.Browser;
import com.springmvc.entity.Investigation;
import com.springmvc.entity.Role;
import com.springmvc.entity.User;
import com.springmvc.other.AreaCode;
import com.springmvc.service.InvestigationTable;
import com.springmvc.service.RoleTable;
import com.springmvc.service.browserTable;
import com.springmvc.service.provinceTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

public class EditInvestigationServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String id = request.getParameter("id");
        String rank = request.getParameter("rank");
        String choose = request.getParameter("choose");
        String begin = request.getParameter("begin");
        String end = request.getParameter("end");
        PrintWriter out = response.getWriter();

        if (rank.equals("2")){
            out.println("市没有权限修改调查期");
        }else if (rank.equals("3")){
            provinceTable table = new provinceTable();
            User province = new User();
            table.findById(Integer.parseInt(id), province);

            Role role = new Role();
            role.RoleNum = province.roleId;
            RoleTable roleTable = new RoleTable();
            roleTable.find(role);
            if (role.ifroot == 1 || role.SetDate == 1){
                Investigation investigation = new Investigation();
                Investigation old = new Investigation();
                old.investigationId = Integer.parseInt(choose);
                InvestigationTable investigationTable = new InvestigationTable();
                investigationTable.findById(old);

                String yearb = begin.substring(0, 4);
                String monthb = begin.substring(5, 7);
                String dayb = begin.substring(8);
                String yeare = end.substring(0, 4);
                String monthe = end.substring(5, 7);
                String daye = end.substring(8);

                investigation.beginDay = Integer.parseInt(dayb);
                investigation.beginMonth = Integer.parseInt(monthb);
                investigation.beginYear = Integer.parseInt(yearb);
                investigation.endYear = Integer.parseInt(yeare);
                investigation.endMonth = Integer.parseInt(monthe);
                investigation.endDay = Integer.parseInt(daye);
                investigation.publishId = Integer.parseInt(choose);
                investigation.investigationId = old.investigationId;

                if(investigationTable.findTheSame(investigation)){
                    out.println("该调查期已存在");
                }else {
                    boolean ch = investigationTable.update(investigation);
                    if (ch){
                        Browser browser = new Browser();
                        Calendar c = Calendar.getInstance();
                        int year = c.get(Calendar.YEAR);
                        int month = c.get(Calendar.MONTH);
                        int day = c.get(Calendar.DAY_OF_MONTH);
                        browser.broswerDay = day;
                        browser.broswerYear = year;
                        browser.broswerMonth = month;
                        browser.content = province.accompanyName;
                        browser.rank = Integer.parseInt(rank);
                        browser.id = Integer.parseInt(id);
                        browser.content = province.accompanyName + "更新了调查期";
                        browserTable table1 = new browserTable();
                        table1.insert(browser);

                        out.println("调查期更新成功");
                    }
                    else out.println("更新失败");
                }
            }else {
                out.println("您没有增加调查期的权限");
            }
        }
    }
}
