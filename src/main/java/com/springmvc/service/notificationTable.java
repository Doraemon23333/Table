package com.springmvc.service;

import java.sql.Connection;
import java.sql.DriverManager;

public class notificationTable {
    /*
create table ֪ͨ(
notification_id int NOT NULL primary key,
֪ͨ���� char(100) NOT NULL,
֪ͨ���� char(4000) NOT NULL,
����ʱ�� varchar(50),
������λ varchar(100))

create table notificationTable(
notification_id int NOT NULL primary key,
title varchar(50) NOT NULL,
content varchar(4000) NOT NULL,
publishTime varchar(50),
publishCompany varchar(50)) default charset = utf8;
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
