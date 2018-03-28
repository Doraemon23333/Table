package com.springmvc.service;

import com.mysql.jdbc.PreparedStatement;
import com.springmvc.entity.Investigation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Calendar;

public class InvestigationTable {
/*
create table investigationTable(
investigationId int NOT NULL primary key auto_increment,
investigationYear int NOT NULL,
investigationMonth int NOT NULL,
investigationDay int NOT NULL,
usingCondition int NOT NULL,
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
        try {
            Connection connection = getConnection();
            String sql = "insert into userTable(investigationYear,investigationMonth,investigationDay,usingCondition,publishId)" +
                    " values(?,?,?,?,?)";
            Calendar c = Calendar.getInstance();
            int year = c.get(Calendar.YEAR);
            int month = c.get(Calendar.MONTH);
            month++;
            int day = c.get(Calendar.DAY_OF_MONTH);
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
