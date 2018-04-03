package com.springmvc.controller;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.springmvc.entity.CompanyData;
import com.springmvc.entity.Role;
import com.springmvc.entity.User;
import com.springmvc.other.AreaCode;
import com.springmvc.service.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class ManageDataServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String place = request.getParameter("Place");
        String enterpriseNature = request.getParameter("xz");
        String industry = request.getParameter("hy");
        String startTime = request.getParameter("ks");
        String name = request.getParameter("num");
        String id = request.getParameter("id");
        String rank = request.getParameter("rank");
        if (startTime.equals("")){
            startTime = "0";
        }

        if (rank.equals("3")){
            RoleTable roleTable = new RoleTable();
            Role role = new Role();
            userTable table = new userTable();
            User user = new User();
            table.findById(Integer.parseInt(id), user);
            role.id = user.id;
            roleTable.findbyId(role);
            if (role.SearchData == 1 || role.ifroot == 1){
                if(name.equals("") || name.equals("企业名称或编号")){
                    AreaCode areaCode = new AreaCode();
                    String placecode = areaCode.toCode(place);
                    String enterpriseNaturecode = areaCode.enterpriseNatureToCode(enterpriseNature);
                    String industrycode = areaCode.industryToCode(industry);
                    response.sendRedirect("/province3.jsp?id=" + id + "&rank=" + rank + "&industrycode=" + industrycode + "&placecode=" + placecode
                            + "&enterpriseNaturecode=" + enterpriseNaturecode + "&choose=1&investigationId=" + startTime);
                }else {
                    companyDataTable table1 = new companyDataTable();
                    List<CompanyData> companyDataList = new ArrayList<CompanyData>();
                    companyTable table2 = new companyTable();
                    try {
                        Connection connection = table2.getConnection();
                        String sql = "select * from companyTable where name='" + name + "' or nameCode='" + name + "'";
                        System.out.println(sql);
                        PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
                        Statement stmt = (Statement) connection.createStatement();
                        ResultSet rs = stmt.executeQuery(sql);
                        while (rs.next()){
                            Connection connection1 = table1.getConnection();
                            String sql1 = "select * from companyDataTable where id=" + rs.getInt("id");
                            System.out.println(sql1);
                            PreparedStatement ps1 = (PreparedStatement) connection1.prepareStatement(sql1);
                            Statement stmt1 = (Statement) connection1.createStatement();
                            ResultSet rs1 = stmt1.executeQuery(sql1);
                            while (rs1.next()){
                                CompanyData companyData = new CompanyData();
                                companyData.companyDataId = rs1.getInt("companyDataId");
                                companyDataList.add(companyData);
                            }
                            rs1.close();
                            stmt1.close();
                            ps1.close();
                            connection1.close();
                        }
                        rs.close();
                        stmt.close();
                        ps.close();
                        connection.close();
                        if (companyDataList.size() == 0){
                            out.println("未发现相关信息");
                        }else if (companyDataList.size() == 1){
                            for(CompanyData companyData: companyDataList){
                                response.sendRedirect("/province4.jsp?id=" + request.getParameter("id") + "&rank=3&companyDataId="
                                + companyData.companyDataId);
                            }
                        }else {
                            response.sendRedirect("/province3.jsp?id=" + request.getParameter("id") + "&rank=3&choose=2&name=" + name);
                        }
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                }
            }else {
                out.println("您没有查看企业数据的权限");
            }
        }else {
            if(name.equals("") || name.equals("企业名称或编号")){
                AreaCode areaCode = new AreaCode();
                String placecode = areaCode.toCode(place);
                String enterpriseNaturecode = areaCode.enterpriseNatureToCode(enterpriseNature);
                String industrycode = areaCode.industryToCode(industry);
                response.sendRedirect("/province3.jsp?id=" + id + "&rank=" + rank + "&industrycode=" + industrycode + "&placecode=" + placecode
                        + "&enterpriseNaturecode=" + enterpriseNaturecode + "&choose=1&investigationId=" + startTime);
            }else {
                companyDataTable table1 = new companyDataTable();
                List<CompanyData> companyDataList = new ArrayList<CompanyData>();
                companyTable table2 = new companyTable();
                cityTable table = new cityTable();
                User city = new User();
                table.findById(Integer.parseInt(id), city);
                try {
                    Connection connection = table2.getConnection();
                    String sql = "select * from companyTable where (name='" + name + "' or nameCode='" + name + "') AND originalArea='" +
                            city.area + "'";
                    System.out.println(sql);
                    PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
                    Statement stmt = (Statement) connection.createStatement();
                    ResultSet rs = stmt.executeQuery(sql);
                    while (rs.next()){
                        Connection connection1 = table1.getConnection();
                        String sql1 = "select * from companyDataTable where id=" + rs.getInt("id");
                        System.out.println(sql1);
                        PreparedStatement ps1 = (PreparedStatement) connection1.prepareStatement(sql1);
                        Statement stmt1 = (Statement) connection1.createStatement();
                        ResultSet rs1 = stmt1.executeQuery(sql1);
                        while (rs1.next()){
                            CompanyData companyData = new CompanyData();
                            companyData.companyDataId = rs1.getInt("companyDataId");
                            companyDataList.add(companyData);
                        }
                        rs1.close();
                        stmt1.close();
                        ps1.close();
                        connection1.close();
                    }
                    rs.close();
                    stmt.close();
                    ps.close();
                    connection.close();
                    if (companyDataList.size() == 0){
                        out.println("未发现相关信息");
                    }else if (companyDataList.size() == 1){
                        for(CompanyData companyData: companyDataList){
                            response.sendRedirect("/province4.jsp?id=" + request.getParameter("id") + "&rank=3&companyDataId="
                                    + companyData.companyDataId);
                        }
                    }else {
                        response.sendRedirect("/province3.jsp?id=" + request.getParameter("id") + "&rank=3&choose=2&name=" + name);
                    }
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        }
    }
}
