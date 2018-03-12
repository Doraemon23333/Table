package com.springmvc.service;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.springmvc.entity.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.Calendar;
import java.util.List;

public class userTable {
/*
 * create table userTable(
id int NOT NULL primary key auto_increment,
usingCondition varchar(20)  NOT NULL,
rank int NOT NULL,
password varchar(20),
account varchar(20) NOT NULL,
registerYear int NOT NULL,
registerMonth int NOT NULL,
registerDay int NOT NULL,
unregisterYear int,
unregisterMonth int,
unregisterDay int,
accompanyName varchar(100) NOT NULL) default charset = utf8;
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

    public boolean register(int rank, String password, String accompanyName) {

        User user = new User();
        user.id = -1;
        find(accompanyName, "accompanyName", user);

        if(user.id == -1) {
            user.accompanyName = accompanyName;
            user.rank = rank;
            user.password = password;
            insert(user);
            find("accompanyName", accompanyName, user);
            int id = user.id;
            String account = String.valueOf(id);
            if (account.length() < 7){
                for(int i = account.length(); i < 6; i++){
                    account = "0" + account;
                }
                account = "1" + account;
                updateS(user.id, "account", account);
            }
        }
        else {
            System.out.println("failed");
        }
        return false;
    }

    public boolean login(String account, String password){
        try {
            Connection conn = getConnection();
            String sql = "SELECT * from userTable WHERE account='" + account
                    + "' AND password='" + password + "' AND usingCondition='online'" ;
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

    public void insert(User user){
        String sql = "insert into userTable(usingCondition,rank,password,account,registerYear,registerMonth,registerDay,accompanyName) values(?,?,?,?,?,?,?,?)";
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH);
        int day = c.get(Calendar.DAY_OF_MONTH);
        try {
            Connection conn = getConnection();
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
            ps.setString(1, "online");
            ps.setInt(2, user.rank);
            ps.setString(3, user.password);
            ps.setString(4, "1000000");
            ps.setInt(5, year);
            ps.setInt(6, month);
            ps.setInt(7, day);
            ps.setString(8, user.accompanyName);
            int row = ps.executeUpdate();
            ps.close();
            conn.close();
        }catch(Exception e) {
            e.printStackTrace();
        }
    }

    public void find(String name, String data, User user) {
        String sql = "select * from userTable where " + name +"='" + data + "'";
        System.out.println(sql);
        int ch = 0;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
            Statement stmt = (Statement) conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int length = rs.getRow();
            if (length > 0){
                rs.next();
                user.id = rs.getInt("id");
                user.rank = rs.getInt("rank");
                user.usingCondition = rs.getString("usingCondition");
                user.account = rs.getString("account");
                user.password = rs.getString("password");
                user.registerYear = rs.getInt("registerYear");
                user.registerMonth = rs.getInt("registerMonth");
                user.registerDay = rs.getInt("registerDay");
                user.unregisterDay = rs.getInt("unregisterDay");
                user.unregisterMonth = rs.getInt("unregisterMonth");
                user.unregisterYear = rs.getInt("unregisterYear");
                user.accompanyName = rs.getString("accompanyName");
            }
            rs.close();
            stmt.close();
            ps.close();
            conn.close();
        }catch(Exception e) {
            e.printStackTrace();
        }
    }

    public boolean updateS(int id, String name, String data) {
        try {
            Connection conn = getConnection();
            String sql = "update userTable set " + name + "=? where id=?";
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
            ps.setString(1, data);
            ps.setInt(2, id);
            ps.executeUpdate();
            if (name.equals("usingCondition") && data.equals("unonline")){
                Calendar c = Calendar.getInstance();
                int year = c.get(Calendar.YEAR);
                int month = c.get(Calendar.MONTH);
                int day = c.get(Calendar.DAY_OF_MONTH);
                String sql2 = "update userTable set unregisterYear=? where id=?";
                ps = (PreparedStatement) conn.prepareStatement(sql2);
                ps.setInt(1, year);
                ps.setInt(2, id);
                ps.executeUpdate();
                String sql3 = "update userTable set unregisterMonth=? where id=?";
                ps = (PreparedStatement) conn.prepareStatement(sql3);
                ps.setInt(1, month);
                ps.setInt(2, id);
                ps.executeUpdate();
                String sql4 = "update userTable set unregisterDay=? where id=?";
                ps = (PreparedStatement) conn.prepareStatement(sql4);
                ps.setInt(1, day);
                ps.setInt(2, id);
                ps.executeUpdate();
            }
            ps.close();
            conn.close();
            return true;
        }catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateI(int id, String name, int data) {
        try {
            Connection conn = getConnection();
            String sql = "update userTable set " + name + "=? where id=?";
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
            ps.setInt(1, data);
            ps.setInt(2, id);
            ps.executeUpdate();
            ps.close();
            conn.close();
            return true;
        }catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
