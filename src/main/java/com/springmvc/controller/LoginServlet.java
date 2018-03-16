package com.springmvc.controller;

import com.springmvc.entity.User;
import com.springmvc.service.userTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

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
            if(user.rank == 1)
                response.sendRedirect("/companyhome.jsp?id=" + user.id);
            else if (user.rank == 3){
                response.sendRedirect("/provincehome.jsp?id=" + user.id);
            }
            else {
                out.print("waiting for coming true");
            }
        }
    }
}
