package com.springmvc.service;

import com.mysql.jdbc.PreparedStatement;

import java.sql.Connection;
import java.sql.DriverManager;

public class browserTable {
/*
create table �����¼(
id int NOT NULL primary key,
notification_id int NOT NULL,
broswer_time varchar(50))

create table borswerTable(
id int NOT NULL primary key,
notification_id int NOT NULL,
broswerYear int NOT NULL,
broswerMonth int NOT NULL,
broswerDay int NOT NULL) default charset=utf8;
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

	public void insert(int id, int notification_id, String broswerTime) {

		String sql = "insert into userTable(id,notification_id, broswerTime) " +
				"values(?,?,?)";
		System.out.println(sql);
		try {
			Connection conn = getConnection();
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setInt(2, notification_id);
			ps.setString(3, broswerTime);
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
