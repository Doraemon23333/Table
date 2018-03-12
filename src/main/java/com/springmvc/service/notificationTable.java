package com.springmvc.service;

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
}
