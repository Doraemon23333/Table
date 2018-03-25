package com.springmvc.service;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.springmvc.entity.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.Calendar;

public class userTable {
/*
 * create table userTable(
id int NOT NULL primary key auto_increment,
roleId int,
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
accompanyName varchar(100) NOT NULL) default charset=utf8;
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

    public boolean insert(User user){
        try {
            Connection connection = getConnection();
            String sql = "insert into userTable(accompanyName,password,account,usingCondition,registerYear,registerMonth,registerDay,unregisterYear" +
                    ",unregisterMonth,unregisterDay,rank)" +
                    " values(?,?,?,?,?,?,?,?,?,?,?)";
            Calendar c = Calendar.getInstance();
            int year = c.get(Calendar.YEAR);
            int month = c.get(Calendar.MONTH);
            month++;
            int day = c.get(Calendar.DAY_OF_MONTH);
            PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
            ps.setString(1, user.accompanyName);
            ps.setString(2, user.password);
            ps.setString(3, "1000000000");//ten
            ps.setString(4, "online");
            ps.setInt(5, year);
            ps.setInt(6, month);
            ps.setInt(7, day);
            ps.setInt(8, user.unregisterYear);
            ps.setInt(9, user.unregisterMonth);
            ps.setInt(10, user.unregisterDay);
            ps.setInt(11, 1);
            int row = ps.executeUpdate();
            ps.close();
            connection.close();
            if (row > 0){
                find("accompanyName", user.accompanyName, user);
                String account = String.valueOf(user.id);
                int length = account.length();
                for (int i = length; i < 6; i++){
                    account = "0" + account;
                }
                account = "1" + account;
                boolean end = updateS("account", account, user.id);
                if (end)
                    return true;
                else return false;
            }else return false;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public boolean find(String name, String data, User user){
        try {
            Connection connection = getConnection();
            String sql = "select * from userTable where " + name +"='" + data + "'";
            //System.out.println(sql);
            PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
            Statement stmt = (Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int row = 0;
            while (rs.next()){
                user.id = rs.getInt("id");
                user.account = rs.getString("account");
                user.accompanyName = rs.getString("accompanyName");
                user.password = rs.getString("password");
                user.usingCondition = rs.getString("usingCondition");
                user.registerYear = rs.getInt("registerYear");
                user.registerMonth = rs.getInt("registerMonth");
                user.registerDay = rs.getInt("registerDay");
                user.unregisterYear = rs.getInt("unregisterYear");
                user.unregisterMonth = rs.getInt("unregisterMonth");
                user.unregisterDay = rs.getInt("unregisterDay");
                user.rank = rs.getInt("rank");
                user.roleId = rs.getInt("roleId");
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

    public boolean findById(int id, User user){
        try {
            Connection connection = getConnection();
            String sql = "select * from userTable where id=" + id;
            //System.out.println(sql);
            PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
            Statement stmt = (Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int row = 0;
            while (rs.next()){
                user.id = rs.getInt("id");
                user.account = rs.getString("account");
                user.accompanyName = rs.getString("accompanyName");
                user.password = rs.getString("password");
                user.usingCondition = rs.getString("usingCondition");
                user.registerYear = rs.getInt("registerYear");
                user.registerMonth = rs.getInt("registerMonth");
                user.registerDay = rs.getInt("registerDay");
                user.unregisterYear = rs.getInt("unregisterYear");
                user.unregisterMonth = rs.getInt("unregisterMonth");
                user.unregisterDay = rs.getInt("unregisterDay");
                user.rank = rs.getInt("rank");
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

    public boolean updateS(String name, String data, int id){
        try {
            Connection conn = getConnection();
            String sql = "update userTable set " + name + "=? where id=?";
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
            ps.setString(1, data);
            ps.setInt(2, id);
            int row = ps.executeUpdate();
            ps.close();
            conn.close();
            if (row > 0){
                return true;
            }else return false;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateI(String name, int data, int id){
        try {
            Connection conn = getConnection();
            String sql = "update userTable set " + name + "=? where id=?";
            System.out.println(sql);
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
            ps.setInt(1, data);
            ps.setInt(2, id);
            int row = ps.executeUpdate();
            ps.close();
            conn.close();
            if (row > 0){
                return true;
            }else return false;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
}
