package com.springmvc.service;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class companyDataTable {
    /*
	 *
create table companyDataTable(
id int NOT NULL primary key,
csPeople int NOT NULL,
surveyPeople int NOT NULL,
addition varchar(50),
reduceType varchar(50)
mainReason varchar(50),
mR_instruction varchar(50),
secondReason varchar(50),
sR_instructon varchar(50),
thirdReason varchar(50),
tR_instruction varchar(50)
accountYear int NOT NULL,
accountMonth int NOT NULL,
accountDay int NOT NULL,
accountSeason int NOT NULL) default charset = utf8;
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

    public boolean insert(int id, int csPeople, int surveyPeople, String addition, String reduceType,
                          String mainReason, String mR_instruction, String secondReason, String sR_instruction,
                          String thridReaaon, String tR_instruction) {

        int end = check(id);
        System.out.println(end);

        if(end == 1) {
            String sql = "insert into userTable(id,csPeople,surveyPeople,addtion, reduceType," +
                    "mainReason,mR_instruction,secondReason,sR_instruction,thridReaaon,tR_instruction) " +
                    "values(?,?,?,?,?,?,?,?,?,?,?)";
            System.out.println(sql);
            try {
                Connection conn = getConnection();
                PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
                ps.setInt(1, id);
                ps.setInt(2, csPeople);
                ps.setInt(3, surveyPeople);
                ps.setString(4, addition);
                ps.setString(5, reduceType);
                ps.setString(6, mainReason);
                ps.setString(7, mR_instruction);
                ps.setString(8, secondReason);
                ps.setString(9, sR_instruction);
                ps.setString(10, thridReaaon);
                ps.setString(11, tR_instruction);
                int row = ps.executeUpdate();
                ps.close();
                conn.close();
                if(row > 0) {
                    System.out.println("ok");
                    return true;
                }else {
                    System.out.println("fail");
                    return false;
                }
            }catch(Exception e) {
                e.printStackTrace();
            }
        }
        else {
            System.out.println("fail");
        }
        return false;
    }

    public int check(int id) {
        String sql = "select * from userTable where id=" + id;
        System.out.println(sql);
        int ch = 0;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
            Statement stmt = (Statement) conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()) {
                ch++;
            }
            rs.close();
            stmt.close();
            ps.close();
            conn.close();
        }catch(Exception e) {
            e.printStackTrace();
        }
        if(ch == 0) {
            return 1;
        }else {
            return 0;
        }
    }
}
