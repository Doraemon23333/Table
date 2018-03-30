package com.springmvc.controller;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.springmvc.entity.User;
import com.springmvc.service.cityTable;
import com.springmvc.service.companyDataTable;
import com.springmvc.service.companyTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;

public class BingtuServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rank = request.getParameter("rank");
        String id = request.getParameter("id");
        PrintWriter out = response.getWriter();
        if (rank.equals("2")){
            cityTable table = new cityTable();
            User city = new User();
            table.findById(Integer.parseInt(id), city);
            int gyqy = countS("国有企业", city.area);
            int jtqy = countS("集体企业", city.area);
            int lyqy = countS("联营企业", city.area);
            int gfhzzqy = countS("股份合作制企业", city.area);
            int syqy = countS("私营企业", city.area);
            int gth = countS("个体户", city.area);
            int hzqy = countS("合伙企业", city.area);
            int yxhzgs = countS("有限责任公司", city.area);
            String url = "/bingtu.jsp?id=" + id + "&rank=" + rank + "&gyqy=" + gyqy
                    + "&jtqy=" + jtqy
                    + "&lyqy=" + lyqy
                    + "&gfhzzqy=" + gfhzzqy
                    + "&syqy=" + syqy
                    + "&gth=" + gth
                    + "&hzqy=" + hzqy
                    + "&yxhzgs=" + yxhzgs;
            response.sendRedirect(url);
        }else if (rank.equals("3")){
            int c0531 = count("济南");
            int c0532 = count("青岛");
            int c0533 = count("淄博");
            int c0534 = count("德州");
            int c0535 = count("烟台");
            int c0536 = count("潍坊");
            int c0537 = count("济宁");
            int c0538 = count("泰安");
            int c0539 = count("临沂");
            int c0530 = count("菏泽");
            int c0543 = count("滨州");
            int c0546 = count("东营");
            int c0631 = count("威海");
            int c0632 = count("枣庄");
            int c0633 = count("日照");
            int c0634 = count("莱芜");
            int c0635 = count("聊城");
            int cOther = count("山东");
            String url = "/bingtu.jsp?id=" + id + "&rank=" + rank +"&c0531=" + c0531
                    + "&c0532=" + c0532
                    + "&c0533=" + c0533
                    + "&c0534=" + c0534
                    + "&c0535=" + c0535
                    + "&c0536=" + c0536
                    + "&c0537=" + c0537
                    + "&c0538=" + c0538
                    + "&c0539=" + c0539
                    + "&c0530=" + c0530
                    + "&c0543=" + c0543
                    + "&c0546=" + c0546
                    + "&c0631=" + c0631
                    + "&c0632=" + c0632
                    + "&c0633=" + c0633
                    + "&c0634=" + c0634
                    + "&c0635=" + c0635
                    + "&cOther=" + cOther;
            response.sendRedirect(url);
        }
    }

    public int count(String area){
        try {
            companyTable table = new companyTable();
            Connection connection = table.getConnection();
            String sql = "SELECT count(originalArea) from companyTable WHERE originalArea='" + area + "'";
            System.out.println(sql);
            PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
            Statement stmt = (Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int row = 0;
            while (rs.next()){
                row = rs.getInt("count(originalArea)");
            }
            rs.close();
            stmt.close();
            ps.close();
            connection.close();
            return row;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    public int countS(String enterprisesNature, String area){
        try {
            companyTable table = new companyTable();
            Connection connection = table.getConnection();
            String sql = "SELECT count(enterprisesNature) from companyTable WHERE originalArea='" + area + "' AND enterprisesNature='"  + enterprisesNature + "'";
            System.out.println(sql);
            PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
            Statement stmt = (Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int row = 0;
            while (rs.next()){
                row = rs.getInt("count(enterprisesNature)");
            }
            rs.close();
            stmt.close();
            ps.close();
            connection.close();
            return row;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }
}
