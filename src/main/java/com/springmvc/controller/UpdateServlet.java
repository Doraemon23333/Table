package com.springmvc.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdateServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String rank = request.getParameter("rank");
        String beforename = request.getParameter("beforename");
        response.sendRedirect("alterUserInfo.jsp?id=" + id + "&rank=" + rank + "&choose=1&beforename=" + beforename);
    }
}
