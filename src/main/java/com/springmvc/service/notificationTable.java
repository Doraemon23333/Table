package com.springmvc.service;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.springmvc.entity.Notification;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class notificationTable {
    /*

create table notificationTable(
notification_id int NOT NULL primary key auto_increment,
title varchar(50) NOT NULL,
content varchar(4000) NOT NULL,
publishYear int NOT NULL,
publishMonth int NOT NULL,
publishDay int NOT NULL,
id int NOT NULL,
rank int NOT NULL,
receiverId int NOT NULL,
receiverRank int NOT NULL)default charset = utf8;
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

    public void insert(Notification notification){
        String sql = "insert into notificationTable(id,title,content,publishYear,publishMonth,publishDay,rank,receiverId,receiverRank) " +
                "values(?,?,?,?,?,?,?,?,?)";
        System.out.println(sql);
        try {
            Connection conn = getConnection();
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
            ps.setInt(1, notification.id);
            ps.setString(2, notification.title);
            ps.setString(3, notification.content);
            ps.setInt(4, notification.publishYear);
            ps.setInt(5, notification.publishMonth);
            ps.setInt(6, notification.publishDay);
            ps.setInt(7, notification.rank);
            ps.setInt(8, notification.receiverId);
            ps.setInt(9, notification.receiverRank);
            int row = ps.executeUpdate();
            ps.close();
            conn.close();
            if(row > 0) {
                System.out.println("ok");
            }else {
                System.out.println("fail");
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
    }

    public boolean find(Notification notification){
        try {
            Connection connection = getConnection();
            String sql = "select * from notificationTable where notification_id=" + notification.notification_id;
            System.out.println(sql);
            PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
            Statement stmt = (Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int row = 0;
            while (rs.next()){
                notification.id = rs.getInt("id");
                notification.rank = rs.getInt("rank");
                notification.title = rs.getString("title");
                notification.content = rs.getString("content");
                notification.publishYear = rs.getInt("publishYear");
                notification.publishMonth = rs.getInt("publishMonth");
                notification.publishDay = rs.getInt("publishDay");
                notification.notification_id = rs.getInt("notification_id");
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
}
