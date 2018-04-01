package com.springmvc.controller;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.springmvc.entity.*;
import com.springmvc.service.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.Calendar;

public class NotificationServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String id = request.getParameter("id");
        String rank = request.getParameter("rank");
        String title = request.getParameter("subject");
        String type = request.getParameter("type");
        String content = request.getParameter("message[text]");
        PrintWriter out = response.getWriter();
        //out.print(title + "," + content + "," + id);

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
        notification.rank = Integer.parseInt(rank);
        notification.content = content;
        notification.title = title;
        notification.type = Integer.parseInt(type);
        notification.companyDataId = 0;
        notification.receiverRank = 0;


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
                out.println("发布成功");
            }else {
                out.println("您没有该权限");
            }
        }else if(rank.equals("2")){
            User city = new User();
            cityTable tableC = new cityTable();
            tableC.findById(Integer.parseInt(id), city);
            companyTable table1 = new companyTable();
            try {
                Connection connection = table1.getConnection();
                String sql = "select * from companyTable";
                PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
                Statement stmt = (Statement) connection.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()){
                    if (rs.getString("originalArea").equals(city.area)){
                        notification.receiverId = rs.getInt("id");
                        notificationTable table2 = new notificationTable();
                        table2.insert(notification);
                    }
                }
                rs.close();
                stmt.close();
                ps.close();
                connection.close();
                out.println("发布成功");
            }catch (Exception e){
                e.printStackTrace();
                out.println("发布失败");
            }
        }
    }
}
