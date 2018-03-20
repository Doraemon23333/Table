package com.springmvc.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class DataSelectServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String time = request.getParameter("inspectTime");
        PrintWriter out = response.getWriter();
        String year = time.substring(0, 4);
        String mouth = time.substring(5, 7);
        String day = time.substring(8);
        response.sendRedirect("/companyDataSelect.jsp?id=" + id + "&choose=1&year=" + year + "&mouth=" + mouth + "&day=" + day);
    }
}
