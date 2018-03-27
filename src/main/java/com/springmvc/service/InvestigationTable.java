package com.springmvc.service;

import java.sql.Connection;
import java.sql.DriverManager;

public class InvestigationTable {
/*
create table investigationTable(
investigationId int NOT NULL primary key auto_increment,
investigationYear int NOT NULL,
investigationMonth int NOT NULL,
investigationDay int NOT NULL,
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
}
