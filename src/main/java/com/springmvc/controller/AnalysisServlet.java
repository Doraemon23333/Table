package com.springmvc.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AnalysisServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String id = request.getParameter("id");
        String rank = request.getParameter("rank");
        String start = request.getParameter("start");
        String second = request.getParameter("second");
        String analysis = request.getParameter("analysis");
        String property = request.getParameter("property");
        PrintWriter out = response.getWriter();
        out.println("start = " + start);
        out.println("second = " + second);
        out.println("analysis = " + analysis);
        out.println("property = " + property);
    }
}
