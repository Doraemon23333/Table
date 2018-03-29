package com.springmvc.service;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.springmvc.entity.Investigation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.Calendar;

public class InvestigationTable {
/*
create table investigationTable(
investigationId int NOT NULL primary key auto_increment,
beginYear int NOT NULL,
beginMonth int NOT NULL,
beginDay int NOT NULL,
endYear int NOT NULL,
endMonth int NOT NULL,
endDay int NOT NULL,
publishId int NOT NULL) default charset=utf8;
*/
    public Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/company";
            String username = "root";
            String password = "22003x";
            conn = DriverManager.getConnection(url, username, password);
        }catch(Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public boolean insert(Investigation investigation){
        if (findTheSame(investigation)){
            return false;
        }else{
            try {
                Connection connection = getConnection();
                String sql = "insert into investigationTable(beginYear,beginMonth,beginDay,publishId,endYear,endMonth,endDay)" +
                        " values(?,?,?,?,?,?,?)";
                PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
                ps.setInt(1, investigation.beginYear);
                ps.setInt(2, investigation.beginMonth);
                ps.setInt(3, investigation.beginDay);
                ps.setInt(4, investigation.publishId);
                ps.setInt(5, investigation.endYear);
                ps.setInt(6, investigation.endMonth);
                ps.setInt(7, investigation.endDay);
                int row = ps.executeUpdate();
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
    }

    public boolean lastData(Investigation investigation){
        try {
            Connection connection = getConnection();
            String sql = "select count(*) from investigationTable";
            PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
            Statement stmt = (Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int row = 0;
            while (rs.next()){
                investigation.investigationId = rs.getInt("count(*)");
                row++;
            }
            rs.close();
            stmt.close();
            ps.close();
            connection.close();
            if (row > 0){
                findById(investigation);
                return true;
            }else return false;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public boolean findById(Investigation investigation){
        try {
            Connection connection = getConnection();
            String sql = "select * from investigationTable WHERE investigationId=" + investigation.investigationId;
            PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
            Statement stmt = (Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int row = 0;
            while (rs.next()){
                investigation.endDay = rs.getInt("endDay");
                investigation.endMonth = rs.getInt("endMonth");
                investigation.endYear = rs.getInt("endYear");
                investigation.investigationId = rs.getInt("investigationId");
                investigation.publishId = rs.getInt("publishId");
                investigation.beginYear = rs.getInt("beginYear");
                investigation.beginMonth = rs.getInt("beginMonth");
                investigation.beginDay = rs.getInt("beginDay");
                row++;
            }
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

    public boolean findTheSame(Investigation investigation){
        try {
            Connection connection = getConnection();
            String sql = "select * from investigationTable WHERE beginYear=" + investigation.beginYear + " AND beginMonth="
                    + investigation.beginMonth + " AND beginDay=" + investigation.beginDay + " AND endYear=" + investigation.endYear
                    + " AND endMonth=" + investigation.endMonth + " AND endDay=" + investigation.endDay;
            PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
            Statement stmt = (Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int row = 0;
            while (rs.next()){
                row++;
            }
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

    public boolean update(Investigation investigation){
        try {
            Connection connection = getConnection();
            String sql = "update investigationTable set beginYear="+ investigation.beginYear
                    + ",beginMonth=" + investigation.beginMonth
                    + ",beginDay=" + investigation.beginDay
                    + ",endYear=" + investigation.endYear
                    + ",endMonth=" + investigation.endMonth
                    + ",endDay=" + investigation.endDay
                    + " WHERE investigationId=" + investigation.investigationId;
            System.out.println(sql);
            PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
            int row = ps.executeUpdate();
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
}
