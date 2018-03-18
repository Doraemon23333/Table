package com.springmvc.controller;

import com.springmvc.service.userTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class UnRegisterServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        userTable userTable = new userTable();
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String rank = request.getParameter("rank");
        PrintWriter out = response.getWriter();
        if (rank.equals("2")){
            out.print("您没有注销用户的权力");
        }else {
            boolean end = userTable.unregister(1, name);
            if (end){
                out.print("注销成功");
            }else {
                out.print("注销失败，用户可能未注册或已经注销");
            }
        }
    }
}
