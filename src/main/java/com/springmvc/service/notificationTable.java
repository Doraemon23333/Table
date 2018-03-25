package com.springmvc.service;

import com.mysql.jdbc.PreparedStatement;
import com.springmvc.entity.Notification;

import java.sql.Connection;
import java.sql.DriverManager;

public class notificationTable {
    /*

create table notificationTable(
notification_id int NOT NULL primary key,
title varchar(50) NOT NULL,
content varchar(4000) NOT NULL,
publishYear int NOT NULL,
publishMonth int NOT NULL,
publishDay int NOT NULL,
id int NOT NULL) default charset = utf8;
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
        String sql = "insert into userTable(notification_id,title,content,publishYear,publishMonth,publishDay,id) " +
                "values(?,?,?,?,?,?,?)";
        System.out.println(sql);
        try {
            Connection conn = getConnection();
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
            ps.setInt(1, notification.notification_id);
            ps.setString(2, notification.title);
            ps.setString(3, notification.content);
            ps.setInt(4, notification.publishYear);
            ps.setInt(5, notification.publishMonth);
            ps.setInt(6, notification.publishDay);
            ps.setInt(7, notification.id);
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


}
