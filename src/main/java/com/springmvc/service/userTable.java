package com.springmvc.service;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class userTable {
/*
 * create table userTable(
id int NOT NULL primary key auto_increment,
usingCondition varchar(20)  NOT NULL,
rank int NOT NULL,
password varchar(20),
accompanyName varchar(100)) default charset = utf8;
*/
    public Connection getConnection() {
        java.sql.Connection conn = null;
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

    public boolean insert_user(int rank, String password, String accompanyName) {

        int end = check(accompanyName);
        System.out.println(end);

        if(end == 1) {
            String sql = "insert into userTable(usingCondition,rank,password,accompanyName) values(?,?,?,?)";
            System.out.println(sql);
            try {
                Connection conn = getConnection();
                PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
                ps.setString(1, "online");
                ps.setInt(2, rank);
                ps.setString(3, password);
                ps.setString(4, accompanyName);
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
            System.out.println("�ù�˾�ѱ�ע��");
        }
        return false;
    }

    public int check(String accompanyName) {
        String sql = "select * from userTable where accompanyName='" + accompanyName + "'";
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
            System.out.println("ch = " + ch);
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

    public void update_password(int id, String password) {
        try {
            Connection conn = getConnection();
            String sql = "update userTable set password=? where id=?";
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
            ps.setString(1, password);
            ps.setInt(2, id);
            ps.executeUpdate();
            ps.close();
            conn.close();
        }catch(Exception e) {
            e.printStackTrace();
        }
    }

    public boolean login(String account, String password){
        try {
            Connection conn = getConnection();
            String sql = "SELECT * from userTable WHERE accompanyName='" + account
            + "' AND password='" + password + "'";
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
            Statement stmt = (Statement) conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int ch = 0;
            while(rs.next()) {
                ch++;
            }
            rs.close();
            stmt.close();
            ps.close();
            conn.close();
            if (ch > 0){
                return true;
            }else {
                return false;
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
