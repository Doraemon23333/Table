package com.springmvc.service;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class companyTable {
    /*
create table companyTable(
originalArea varchar(50) NOT NULL,
id int NOT NULL primary key,
name varchar(50) NOT NULL,
enterprisesNature varchar(50) NOT NULL,
industry varchar(50) NOT NULL,
mainBusiness varchar(50) NOT NULL,
contactPeople varchar(50) NOT NULL,
contactAddress varchar(50) NOT NULL,
postalCode varchar(50) NOT NULL,
telephone varchar(50) NOT NULL,
fax varchar(50) NOT NULL,
email varchar(50)) default charset = utf8;
 * */
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

    public void insert_companyMessage(String originalArea, int id, String name, String enterprisesNature, String industry,
                                      String mainBusiness, String contactPeople, String contactAddress, String postalCode, String telephone,
                                      String fax, String email){
        if(check(id)) {
            String sql = "insert into companyTable(originalArea,id,name,enterprisesNature,industry,"
                    + "mainBusiness,contactPeople,contactAddress,postalCode,telephone,"
                    + "fax,email"
                    + ") values(?,?,?,?,?,?,?,?,?,?,?,?)";
            System.out.println(sql);
            try {
                Connection conn = getConnection();
                PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
                ps.setString(1, originalArea);
                ps.setInt(2, id);
                ps.setString(3, name);
                ps.setString(4, enterprisesNature);
                ps.setString(5, industry);
                ps.setString(6, mainBusiness);
                ps.setString(7, contactPeople);
                ps.setString(8, contactAddress);
                ps.setString(9, postalCode);
                ps.setString(10, telephone);
                ps.setString(11, fax);
                ps.setString(12, email);
                int row = ps.executeUpdate();
                ps.close();
                conn.close();
            }catch(Exception e) {
                e.printStackTrace();
            }
        }else {
            System.out.println("�ù�˾�Ѿ�����");
        }
    }

    public boolean check(int id) {
        String sql = "select * from companyTable where id=" + id;
        System.out.println(sql);
        int ch = 0;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
            Statement stmt = (Statement) conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()) {
                ch++;
            }
            System.out.println("ch = " + ch);
            rs.close();
            stmt.close();
            ps.close();
            conn.close();
        }catch(Exception e) {
            e.printStackTrace();
        }
        if(ch == 0) {
            System.out.println("ok");
            return true;
        }else {
            System.out.println("fail");
            return false;
        }
    }
}
