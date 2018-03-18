package com.springmvc.controller;

import com.springmvc.service.userTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class RegisterServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        userTable userTable = new userTable();
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String id = request.getParameter("id");
        String rank = request.getParameter("rank");
        PrintWriter out = response.getWriter();
        boolean end = userTable.register(1, password, name);
        if (rank.equals("2")){
            out.print("您没有注册用户的权力");
        }else {
            if (end){
                out.print("添加成功");
            }else {
                out.print("添加失败，可能用户已经被注册");
            }
        }
    }
}
