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
                tableC.findById(Integer.parseInt(id), city);
                tableU.findById(notification.id, user);

                Notification notification1 = new Notification();
                notification1.type = 0;
                notification1.id = Integer.parseInt(id);
                notification1.rank = 2;
                notification1.title = "数据更新结果(市)";
                notification1.content = "市政府批准了数据更新请求";
                notification1.receiverRank = notification.rank;
                notification1.receiverId = notification.id;
                notification1.publishYear = year;
                notification1.publishMonth = month;
                notification1.publishDay = day;
                notification1.companyDataId = notification.companyDataId;

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

                Notification notification3 = new Notification();
                notification3.publishYear = year;
                notification3.publishMonth = month;
                notification3.publishDay = day;
                notification3.receiverRank = 3;
                notification3.receiverId = city.id;
                notification3.id = notification.id;
                notification3.rank = 1;
                notification3.type = 1;
                notification3.companyDataId = notification.companyDataId;
                notification3.content = notification.content;
                notification3.title = city.accompanyName + "批准了" + user.accompanyName + "的数据更新请求，有待审核";
                tableN.insert(notification3);
            }else if (end.equals("0")){
                Notification notification = new Notification();
                User city = new User();
                notification.notification_id = Integer.parseInt(notificationId);

                notificationTable tableN = new notificationTable();

                Notification notification1 = new Notification();
                notification1.type = 0;
                notification1.id = Integer.parseInt(id);
                notification1.rank = 2;
                notification1.title = "数据更新结果(市)";
                notification1.content = "市政府驳回了数据更新请求";
                notification1.receiverRank = notification.rank;
                notification1.receiverId = notification.id;
                notification1.publishYear = year;
                notification1.publishMonth = month;
                notification1.publishDay = day;
                notification1.companyDataId = 0;
                tableN.insert(notification1);

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
            if (end.equals("1")){
                CompanyData companyData = new CompanyData();
                Notification notification = new Notification();
                User province = new User();
                User user = new User();
                notification.notification_id = Integer.parseInt(notificationId);

                notificationTable tableN = new notificationTable();
                userTable tableU = new userTable();
                provinceTable tableP = new provinceTable();

                tableN.find(notification);
                companyData.companyDataId = notification.companyDataId;
                tableU.updateI("companyDataId", companyData.companyDataId, notification.id);
                tableN.delete(notification);
                tableP.findById(Integer.parseInt(id), province);
                tableU.findById(notification.id, user);

                Notification notification1 = new Notification();
                notification1.type = 0;
                notification1.id = Integer.parseInt(id);
                notification1.rank = 3;
                notification1.title = "数据更新结果(省)";
                notification1.content = province.accompanyName + "批准了数据更新请求";
                notification1.receiverRank = notification.rank;
                notification1.receiverId = notification.id;
                notification1.publishYear = year;
                notification1.publishMonth = month;
                notification1.publishDay = day;
                notification1.companyDataId = 0;
                tableN.insert(notification1);

                Browser browser = new Browser();
                browser.broswerDay = day;
                browser.broswerYear = year;
                browser.broswerMonth = month;
                browser.id = Integer.parseInt(id);
                browser.rank = 1;
                browser.content = province.accompanyName + "处理了一个新的企业数据";
                browserTable table1 = new browserTable();
                table1.insert(browser);
                out.println("处理成功");

                Notification notification2 = new Notification();
                notification2.publishYear = year;
                notification2.publishMonth = month;
                notification2.publishDay = day;
                notification2.receiverRank = 2;
                notification2.id = Integer.parseInt(id);
                notification2.receiverId = notification.receiverId;
                notification2.rank = 3;
                notification2.content = province.accompanyName + "批准了一项市政府申请的企业" + user.accompanyName + "数据更新";
                notification2.title = "数据更新结果(省)";
                notification2.type = 0;
                notification2.companyDataId = 0;
                tableN.insert(notification2);
            }else if (end.equals("0")){
                Notification notification = new Notification();
                User province = new User();
                notification.notification_id = Integer.parseInt(notificationId);

                notificationTable tableN = new notificationTable();
                provinceTable tableP = new provinceTable();

                tableP.findById(Integer.parseInt(id), province);
                Notification notification1 = new Notification();
                notification1.type = 0;
                notification1.id = Integer.parseInt(id);
                notification1.rank = 3;
                notification1.title = "数据更新结果(省)";
                notification1.content = province.accompanyName + "驳回了数据更新请求";
                notification1.receiverRank = notification.rank;
                notification1.receiverId = notification.id;
                notification1.publishYear = year;
                notification1.publishMonth = month;
                notification1.publishDay = day;
                notification1.companyDataId = 0;
                tableN.insert(notification1);

                Notification notification2 = new Notification();
                notification2.type = 0;
                notification2.id = Integer.parseInt(id);
                notification2.rank = 3;
                notification2.title = "数据更新结果(省)";
                notification2.content = province.accompanyName + "驳回了数据更新请求";
                notification2.receiverRank = 2;
                notification2.receiverId = notification.receiverId;
                notification2.publishYear = year;
                notification2.publishMonth = month;
                notification2.publishDay = day;
                notification2.companyDataId = 0;
                tableN.insert(notification2);

                Browser browser = new Browser();
                browser.broswerDay = day;
                browser.broswerYear = year;
                browser.broswerMonth = month;
                browser.id = Integer.parseInt(id);
                browser.rank = 1;
                browser.content = province.accompanyName + "处理了一个新的企业数据";
                browserTable table1 = new browserTable();
                table1.insert(browser);
                tableN.delete(notification);
                out.println("处理成功");
            }
        }
    }
}
