package com.springmvc.controller;

import com.springmvc.entity.User;
import com.springmvc.service.userTable;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account, password;
        userTable userTable = new userTable();
        User user = new User();
        account = request.getParameter("account");
        password = request.getParameter("password");
        boolean end = userTable.login(account, password);
        userTable.find("account", account, user);
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        if(end == false){
            out.print("login failed, password Error");
        }else {
            response.sendRedirect("/companyhome.jsp?id=" + user.id);
        }
    }
}
