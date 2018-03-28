package com.springmvc.service;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.springmvc.entity.CompanyData;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.Calendar;

public class companyDataTable {
    /*
	 *
create table companyDataTable(
companyDataId int NOT NULL primary key auto_increment,
id int NOT NULL,
csPeople int NOT NULL,
surveyPeople int NOT NULL,
addition varchar(50),
reduceType varchar(50),
mainReason varchar(50),
mR_instruction varchar(50),
secondReason varchar(50),
sR_instruction varchar(50),
thirdReason varchar(50),
tR_instruction varchar(50),
accountYear int NOT NULL,
accountMonth int NOT NULL,
accountDay int NOT NULL,
accountSeason int NOT NULL) default charset = utf8;
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

    public boolean insert(CompanyData companyData) {

        String sql = "insert into companyDataTable(id,csPeople,surveyPeople,addition,reduceType," +
                "mainReason,mR_instruction,secondReason,sR_instruction,thirdReason,tR_instruction,accountYear,accountMonth,accountDay,accountSeason) " +
                "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH) + 1;
        int day = c.get(Calendar.DAY_OF_MONTH);
        try {
            Connection conn = getConnection();
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
            ps.setInt(1, companyData.id);
            ps.setInt(2, Integer.parseInt(companyData.csPeople));
            ps.setInt(3, Integer.parseInt(companyData.surveyPeople));
            ps.setString(4, companyData.addition);
            ps.setString(5, companyData.reduceType);
            ps.setString(6, companyData.mainReason);
            ps.setString(7, companyData.mR_instruction);
            ps.setString(8, companyData.secondReason);
            ps.setString(9, companyData.sR_instruction);
            ps.setString(10, companyData.thirdReason);
            ps.setString(11, companyData.tR_instruction);
            ps.setInt(12, year);
            ps.setInt(13, month);
            ps.setInt(14, day);
            if (month >= 1 && month <= 3){
                ps.setInt(15, 1);
            }else if(month >= 4 && month <= 6){
                ps.setInt(15, 2);
            }else if (month >= 7 && month <= 9){
                ps.setInt(15, 3);
            }else {
                ps.setInt(15, 4);
            }
            int row = ps.executeUpdate();
            ps.close();
            conn.close();
            if(row > 0) {
                System.out.println("ok");
                return true;
            }else {
                System.out.println("fail");
                return false;
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void findId(CompanyData companyData){
        try{
            Connection connection = getConnection();
            String sql = "SELECT * FROM companyDataTable WHERE id=" + companyData.id + " AND companyDataId>" + companyData.companyDataId;
            PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
            Statement stmt = (Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()){
                companyData.companyDataId = rs.getInt("companyDataId");
            }
            rs.close();
            stmt.close();
            ps.close();
            connection.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
