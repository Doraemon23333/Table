package com.springmvc.controller;

import com.springmvc.entity.Browser;
import com.springmvc.entity.User;
import com.springmvc.service.browserTable;
import com.springmvc.service.cityTable;
import com.springmvc.service.provinceTable;
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
        String account, password, rank;
        PrintWriter out = response.getWriter();
        User user = new User();
        user.id = -1;
        account = request.getParameter("account");
        password = request.getParameter("password");
        rank = request.getParameter("rank");
        response.setContentType("text/html;charset=utf-8");
        if (rank.equals("1")){
            userTable table = new userTable();
            boolean end = table.find("account", account, user);
            if (end){
                if (user.password.equals(password)){
                    browserTable table1 = new browserTable();
                    Browser browser = new Browser();
                    Calendar c = Calendar.getInstance();
                    int year = c.get(Calendar.YEAR);
                    int month = c.get(Calendar.MONTH);
                    int day = c.get(Calendar.DAY_OF_MONTH);
                    browser.broswerDay = day;
                    browser.broswerYear = year;
                    browser.broswerMonth = month + 1;
                    browser.content = user.accompanyName + "登录了系统";
                    browser.id = user.id;
                    browser.rank = user.rank;
                    table1.insert(browser);
                    response.sendRedirect("/companyhome.jsp?id=" + user.id);
                }else {
                    out.print("登陆有误");
                }
            }else {
                out.print("登陆有误");
            }
        }else if (rank.equals("2")){
            cityTable table = new cityTable();
            boolean end = table.find("account", account, user);
            if (end){
                if (user.password.equals(password)){
                    browserTable table1 = new browserTable();
                    Browser browser = new Browser();
                    Calendar c = Calendar.getInstance();
                    int year = c.get(Calendar.YEAR);
                    int month = c.get(Calendar.MONTH);
                    int day = c.get(Calendar.DAY_OF_MONTH);
                    browser.broswerDay = day;
                    browser.broswerYear = year;
                    browser.broswerMonth = month + 1;
                    browser.content = user.accompanyName + "登录了系统";
                    browser.id = user.id;
                    browser.rank = user.rank;
                    table1.insert(browser);
                    response.sendRedirect("/provincehome.jsp?id=" + user.id + "&rank=" + user.rank);
                }else {
                    out.print("登陆有误");
                }
            }else {
                out.print("登陆有误");
            }
        }else if (rank.equals("3")){
            provinceTable table = new provinceTable();
            boolean end = table.find("account", account, user);
            if (end){
                if (user.password.equals(password)){
                    browserTable table1 = new browserTable();
                    Browser browser = new Browser();
                    Calendar c = Calendar.getInstance();
                    int year = c.get(Calendar.YEAR);
                    int month = c.get(Calendar.MONTH);
                    int day = c.get(Calendar.DAY_OF_MONTH);
                    browser.broswerDay = day;
                    browser.broswerYear = year;
                    browser.broswerMonth = month + 1;
                    browser.content = user.accompanyName + "登录了系统";
                    browser.id = user.id;
                    browser.rank = user.rank;
                    table1.insert(browser);
                    response.sendRedirect("/provincehome.jsp?id=" + user.id + "&rank=" + user.rank);
                }else {
                    out.print("登陆有误");
                }
            }else {
                out.print("登陆有误");
            }
        }
    }
}
