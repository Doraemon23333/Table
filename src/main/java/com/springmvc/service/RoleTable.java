package com.springmvc.service;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.springmvc.entity.Role;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class RoleTable {
/*
CREATE TABLE RoleTable(
RoleNum INT PRIMARY KEY NOT NULL auto_increment,
SearchCompany INT DEFAULT 0 ,
SearchData INT DEFAULT 0 ,
CreateNews INT DEFAULT 0 ,
SetDate INT DEFAULT 0 ,
SetRole INT DEFAULT 0 ,
SetSystem INT DEFAULT 0 ,
SetUser INT DEFAULT 0 ,
ifroot INT DEFAULT 0,
rank INT NOT NULL,
id int NOT NULL) default charset=utf8;
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

    public boolean insert(Role role){
        try {
            Connection connection = getConnection();
            String sql = "insert into RoleTable(SearchCompany,SearchData,CreateNews,SetDate,SetRole,SetSystem,SetUser,rank,id,ifroot) values"
                    + "(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
            ps.setInt(1, role.SearchCompany);
            ps.setInt(2, role.SearchData);
            ps.setInt(3, role.CreateNews);
            ps.setInt(4, role.SetDate);
            ps.setInt(5, role.SetRole);
            ps.setInt(6, role.SetSystem);
            ps.setInt(7, role.SetUser);
            ps.setInt(8, role.rank);
            ps.setInt(9, role.id);
            ps.setInt(10, role.ifroot);
            int row = ps.executeUpdate();
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

    public boolean find(Role role){
        try{
            Connection connection = getConnection();
            String sql = "select * from RoleTable where RoleNum=" + role.RoleNum;
            PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
            Statement stmt = (Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int row = 0;
            while (rs.next()){
                role.RoleNum = rs.getInt("RoleNum");
                role.SearchCompany = rs.getInt("SearchCompany");
                role.SearchData = rs.getInt("SearchData");
                role.CreateNews = rs.getInt("CreateNews");
                role.SetDate = rs.getInt("SetDate");
                role.SetRole = rs.getInt("SetRole");
                role.SetSystem = rs.getInt("SetSystem");
                role.SetUser = rs.getInt("SetUser");
                role.rank = rs.getInt("rank");
                role.ifroot = rs.getInt("ifroot");
                role.id = rs.getInt("id");
                row++;
            }
            if (row > 0){
                return true;
            }else return false;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public boolean findbyId(Role role){
        try{
            Connection connection = getConnection();
            String sql = "select * from RoleTable where id=" + role.id + " and rank=" + role.rank;
            PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
            Statement stmt = (Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int row = 0;
            while (rs.next()){
                role.RoleNum = rs.getInt("RoleNum");
                role.SearchCompany = rs.getInt("SearchCompany");
                role.SearchData = rs.getInt("SearchData");
                role.CreateNews = rs.getInt("CreateNews");
                role.SetDate = rs.getInt("SetDate");
                role.SetRole = rs.getInt("SetRole");
                role.SetSystem = rs.getInt("SetSystem");
                role.SetUser = rs.getInt("SetUser");
                role.rank = rs.getInt("rank");
                role.ifroot = rs.getInt("ifroot");
                role.id = rs.getInt("id");
                row++;
            }
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
