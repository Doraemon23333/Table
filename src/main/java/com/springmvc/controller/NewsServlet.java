package com.springmvc.controller;

import com.springmvc.entity.Notification;
import com.springmvc.service.notificationTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class NewsServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String rank = request.getParameter("rank");
        String noid = request.getParameter("notification_id");
        PrintWriter out = response.getWriter();
        Notification notification = new Notification();
        notification.notification_id = Integer.parseInt(noid);
        //out.println(notification.notification_id);
        notificationTable table = new notificationTable();
        table.find(notification);
        out.println(notification.title);
        out.println(notification.content);
    }
}
