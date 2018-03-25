package com.springmvc.controller;

import com.springmvc.entity.Browser;
import com.springmvc.entity.Notification;
import com.springmvc.entity.Role;
import com.springmvc.entity.User;
import com.springmvc.service.RoleTable;
import com.springmvc.service.browserTable;
import com.springmvc.service.notificationTable;
import com.springmvc.service.provinceTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

public class NotificationServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String id = request.getParameter("id");
        String rank = request.getParameter("rank");
        String title = request.getParameter("subject");
        String content = request.getParameter("message[text]");
        PrintWriter out = response.getWriter();
        out.print(title + "," + content + "," + id);

        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH);
        int day = c.get(Calendar.DAY_OF_MONTH);
        month++;

        Notification notification = new Notification();
        notification.publishYear = year;
        notification.publishMonth = month;
        notification.publishDay = day;
        notification.id = Integer.parseInt(id);
        notification.content = content;
        notification.title = title;

        Browser browser = new Browser();
        browser.broswerDay = day;
        browser.broswerYear = year;
        browser.broswerMonth = month;
        browser.rank = Integer.parseInt(rank);
        browser.id = Integer.parseInt(id);

        if (rank.equals("3")){
            User province = new User();
            provinceTable table = new provinceTable();
            table.findById(Integer.parseInt(id), province);

            Role role = new Role();
            role.RoleNum = province.roleId;
            RoleTable roleTable = new RoleTable();
            roleTable.find(role);

            if (role.CreateNews == 1 || role.ifroot == 1){
                browser.content = province.accompanyName + "发布了一条新的通知";
                browserTable table1 = new browserTable();
                table1.insert(browser);
                notificationTable table2 = new notificationTable();
                table2.insert(notification);
            }else {
                out.println("您没有该权限");
            }
        }
    }
}
