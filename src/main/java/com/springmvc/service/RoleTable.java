package com.springmvc.service;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.springmvc.entity.Role;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class RoleTable {

    public Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/company";
            String username = "root";
            String password = "1120152080";
            conn = DriverManager.getConnection(url, username, password);
        }catch(Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

/*
    public boolean find( Role role){
        try {
            Connection connection = getConnection();
            String sql = "select * from roletable";
            //System.out.println(sql);
            PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
            Statement stmt = (Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int row = 0;
            while (rs.next()){
                role.RoleNum = rs.getInt("RoleNum");
                role.CreateNews=rs.getBoolean("CreateNews");
                role.SearchCompany=rs.getBoolean("SearchCompany");
                role.SearchData=rs.getBoolean("SearchData");
                role.SetDate=rs.getBoolean("SetDate");
                role.SetRole=rs.getBoolean("SetRole");
                role.SetSystem=rs.getBoolean("SetSystem");
                role.SetUser=rs.getBoolean("SetUser");
                role.rank=rs.getInt("rank");
                row++;
            }
            //System.out.println(row);
            rs.close();
            stmt.close();
            ps.close();
            connection.close();
            if (row > 0){
                return true;
            }else return false;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
    */
}
