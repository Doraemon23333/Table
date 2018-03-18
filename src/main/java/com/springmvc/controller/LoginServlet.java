package com.springmvc.controller;

import com.springmvc.entity.Browser;
import com.springmvc.entity.User;
import com.springmvc.service.browserTable;
import com.springmvc.service.userTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account, password;
        PrintWriter out = response.getWriter();
        userTable userTable = new userTable();
        User user = new User();
        user.id = -1;
        account = request.getParameter("account");
        password = request.getParameter("password");
        boolean end = userTable.login(account, password);
        userTable.find("account", account, user);
        response.setContentType("text/html;charset=utf-8");
        if(end == false){
            out.print("login failed, password Error");
        }else {
            browserTable table1 = new browserTable();
            Browser browser = new Browser();
            Calendar c = Calendar.getInstance();
            int year = c.get(Calendar.YEAR);
            int month = c.get(Calendar.MONTH);
            int day = c.get(Calendar.DAY_OF_MONTH);
            browser.broswerDay = day;
            browser.broswerYear = year;
            browser.broswerMonth = month;
            browser.content = user.accompanyName + "登录了系统";
            table1.insert(browser);
            if(user.rank == 1)
                response.sendRedirect("/companyhome.jsp?id=" + user.id);
            else{
                response.sendRedirect("/provincehome.jsp?id=" + user.id);
            }
        }
    }
}
