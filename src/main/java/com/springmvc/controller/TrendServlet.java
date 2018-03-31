package com.springmvc.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class TrendServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String id = request.getParameter("id");
        String rank = request.getParameter("rank");
        String beginTime = request.getParameter("beginTime");
        PrintWriter out = response.getWriter();
        if (beginTime.equals("")){
            out.println("请输入时间");
        }else {
            String url = "/trend.jsp?id=" + id + "&rank=" + rank + "&beginTime=" + beginTime + "&choose=1";
            response.sendRedirect(url);
        }
    }
}
