package com.springmvc.controller;

import com.springmvc.entity.Browser;
import com.springmvc.entity.CompanyData;
import com.springmvc.entity.Notification;
import com.springmvc.entity.User;
import com.springmvc.service.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

public class CityJudgeDataServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String end = request.getParameter("end");
        String notificationId = request.getParameter("notificationId");
        String id = request.getParameter("id");
        String rank = request.getParameter("rank");
        PrintWriter out = response.getWriter();

        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH);
        int day = c.get(Calendar.DAY_OF_MONTH);
        month++;

        if (rank.equals("2")){
            if (end.equals("1")){
                CompanyData companyData = new CompanyData();
                Notification notification = new Notification();
                User city = new User();
                User user = new User();
                notification.notification_id = Integer.parseInt(notificationId);

                notificationTable tableN = new notificationTable();
                userTable tableU = new userTable();
                cityTable tableC = new cityTable();

                tableN.find(notification);
                companyData.companyDataId = notification.companyDataId;
                tableU.updateI("companyDataId", companyData.companyDataId, notification.id);
                tableN.delete(notification);
                tableC.findById(Integer.parseInt(id), city);
                tableU.findById(notification.id, user);

                Notification notification1 = new Notification();
                notification1.type = 0;
                notification1.id = Integer.parseInt(id);
                notification1.rank = 2;
                notification1.title = "数据更新结果";
                notification1.content = "市政府批准了数据更新请求";
                notification1.receiverRank = notification.rank;
                notification1.receiverId = notification.id;
                notification1.publishYear = year;
                notification1.publishMonth = month;
                notification1.publishDay = day;
                notification1.companyDataId = 0;

                Browser browser = new Browser();
                browser.broswerDay = day;
                browser.broswerYear = year;
                browser.broswerMonth = month;
                browser.id = Integer.parseInt(id);
                browser.rank = 1;
                browser.content = city.accompanyName + "处理了一个新的企业数据";
                browserTable table1 = new browserTable();
                table1.insert(browser);
                out.println("处理成功");

                Notification notification2 = new Notification();
                notification2.publishYear = year;
                notification2.publishMonth = month;
                notification2.publishDay = day;
                notification2.receiverRank = 3;
                notification2.id = Integer.parseInt(id);
                notification2.receiverId = 0;
                notification2.rank = 2;
                notification2.title = city.accompanyName + "批准了企业" + user.accompanyName + "数据更新";
                notification2.content = notification.content;
                notification2.type = 0;
                notification2.companyDataId = 0;
                tableN.insert(notification2);
            }else if (end.equals("0")){
                Notification notification = new Notification();
                User city = new User();
                notification.notification_id = Integer.parseInt(notificationId);

                notificationTable tableN = new notificationTable();

                Notification notification1 = new Notification();
                notification1.type = 0;
                notification1.id = Integer.parseInt(id);
                notification1.rank = 2;
                notification1.title = "数据更新结果";
                notification1.content = "市政府驳回了数据更新请求";
                notification1.receiverRank = notification.rank;
                notification1.receiverId = notification.id;
                notification1.publishYear = year;
                notification1.publishMonth = month;
                notification1.publishDay = day;
                notification1.companyDataId = 0;

                Browser browser = new Browser();
                browser.broswerDay = day;
                browser.broswerYear = year;
                browser.broswerMonth = month;
                browser.id = Integer.parseInt(id);
                browser.rank = 1;
                browser.content = city.accompanyName + "处理了一个新的企业数据";
                browserTable table1 = new browserTable();
                table1.insert(browser);
                tableN.delete(notification);
                out.println("处理成功");
            }
        }else if (rank.equals("3")){

        }
    }
}
