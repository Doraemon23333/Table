package com.springmvc.service;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.springmvc.entity.Browser;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.List;

public class browserTable {
/*
create table �����¼(
id int NOT NULL primary key,
notification_id int NOT NULL,
broswer_time varchar(50))

create table browserTable(
id int NOT NULL,
rank int NOT NULL,
browserYear int NOT NULL,
browserMonth int NOT NULL,
browserDay int NOT NULL,
content varchar(100)) default charset=utf8;
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

	public void insert(Browser browser) {

		String sql = "insert into browserTable(browserYear, browserMonth, browserDay, content,id, rank) " +
				"values(?,?,?,?,?,?)";
		//System.out.println(sql);
		try {
			Connection conn = getConnection();
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.setInt(1, browser.broswerYear);
			ps.setInt(2, browser.broswerMonth);
			ps.setInt(3, browser.broswerDay);
			ps.setString(4, browser.content);
			ps.setInt(5, browser.id);
			ps.setInt(6, browser.rank);
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

	public void find(List<Browser> browsers){
		String sql = "select * from browserTable";
		try {
			Connection conn = getConnection();
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			Statement stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				Browser browser = new Browser();
				browser.broswerDay = rs.getInt("browserDay");
				browser.broswerMonth = rs.getInt("browserMonth");
				browser.broswerYear = rs.getInt("browserYear");
				browser.content = rs.getString("content");
				browser.id = rs.getInt("id");
				browser.rank = rs.getInt("rank");
				browsers.add(browser);
			}
			rs.close();
			stmt.close();
			ps.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
