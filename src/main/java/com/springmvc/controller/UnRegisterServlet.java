package com.springmvc.controller;

import com.springmvc.entity.Browser;
import com.springmvc.entity.Role;
import com.springmvc.entity.User;
import com.springmvc.service.RoleTable;
import com.springmvc.service.browserTable;
import com.springmvc.service.provinceTable;
import com.springmvc.service.userTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

public class UnRegisterServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String rank = request.getParameter("rank");
        PrintWriter out = response.getWriter();
        if (rank.equals("2")){
            out.print("您没有注销用户的权限");
        }else {
            userTable table = new userTable();
            provinceTable tablep = new provinceTable();
            User province = new User();
            User user = new User();
            tablep.findById(Integer.parseInt(id), province);
            //System.out.println(province.roleId);

            Role role = new Role();
            role.RoleNum = province.roleId;
            RoleTable roleTable = new RoleTable();
            roleTable.find(role);
            System.out.println(role.ifroot + "," + role.SetUser);
            if (role.SetUser == 1 || role.ifroot == 1){
                table.findById(Integer.parseInt(id), province);
                boolean end = table.find("accompanyName", name, user);
                if (end){
                    if (user.usingCondition.equals("online")){
                        Browser browser = new Browser();
                        Calendar c = Calendar.getInstance();
                        int year = c.get(Calendar.YEAR);
                        int month = c.get(Calendar.MONTH);
                        int day = c.get(Calendar.DAY_OF_MONTH);
                        browser.broswerDay = day;
                        browser.broswerYear = year;
                        browser.broswerMonth = month + 1;
                        browser.id = Integer.parseInt(id);
                        browser.rank = Integer.parseInt(rank);
                        browser.content = province.accompanyName + "注销了一个用户，名字为" + name;
                        browserTable table1 = new browserTable();
                        table1.insert(browser);
                        table.updateS("usingCondition", "unonline", user.id);
                        out.print("注销成功");
                    }else out.print("该用户已经注销");
                }else {
                    out.print("注销失败，用户可能未注册");
                }
            }else {
                out.print("您没有注销用户的权限");
            }
        }
    }
}
