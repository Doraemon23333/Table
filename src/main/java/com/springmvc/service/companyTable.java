package com.springmvc.service;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.springmvc.entity.Company;
import com.springmvc.entity.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.List;

public class companyTable {
    /*
create table companyTable(
originalArea varchar(50) NOT NULL,
id int NOT NULL primary key,
name varchar(50) NOT NULL,
nameCode varchar(10) NOT NULL,
enterprisesNature varchar(50) NOT NULL,
industry varchar(50) NOT NULL,
mainBusiness varchar(50) NOT NULL,
People varchar(50) NOT NULL,
Address varchar(50) NOT NULL,
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

    public void insert(Company company){
        if(find(company.id) && findTheSame(company.name) && findTheSame(company.nameCode)) {
            String sql = "insert into companyTable(originalArea,id,name,enterprisesNature,industry,"
                    + "mainBusiness,People,Address,postalCode,telephone,"
                    + "fax,email,nameCode"
                    + ") values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            try {
                Connection conn = getConnection();
                PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
                ps.setString(1, company.originalArea);
                ps.setInt(2, company.id);
                ps.setString(3, company.name);
                ps.setString(4, company.enterprisesNature);
                ps.setString(5, company.industry);
                ps.setString(6, company.mainBusiness);
                ps.setString(7, company.People);
                ps.setString(8, company.Address);
                ps.setString(9, company.postalCode);
                ps.setString(10, company.telephone);
                ps.setString(11, company.fax);
                ps.setString(12, company.email);
                ps.setString(13, company.nameCode);
                ps.executeUpdate();
                ps.close();
                conn.close();
            }catch(Exception e) {
                e.printStackTrace();
            }
        }else {
            System.out.println("failed");
        }
    }

    public boolean find(int id) {//false为找到
        String sql = "select * from companyTable where id=" + id;
        int ch = 0;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
            Statement stmt = (Statement) conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()) {
                ch++;
            }
            rs.close();
            stmt.close();
            ps.close();
            conn.close();
        }catch(Exception e) {
            e.printStackTrace();
        }
        if(ch == 0) {
            return true;
        }else {
            return false;
        }
    }

    public boolean updateS(int id, String name, String data){//更新  false为失败 true为成功
        int ch = 0;
        if (name.equals("name") || name.equals("nameCode")){
            if(findTheSame(data)){
                ch = 0;
            }else ch = 1;
        }
        if (ch == 0){
            try {
                Connection conn = getConnection();
                String sql = "update companyTable set " + name + "=? where id=?";
                PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
                ps.setString(1, data);
                ps.setInt(2, id);
                ps.executeUpdate();
                ps.close();
                conn.close();
                return true;
            }catch(Exception e) {
                e.printStackTrace();
            }
            return false;
        }else {
            return false;
        }
    }

    public void search(Company company, List<Company> companies, String choose, int mainid){//查找company
        User user = new User();
        userTable table = new userTable();
        table.findById(mainid, user);
        Company com1 = new Company();
        com1.id = mainid;
        show(com1);
        try{
            Connection conn = getConnection();
            /*String sql = "select * from companyTable where originalArea=" + company.originalArea +
                    " and enterprisesNature=" + company.enterprisesNature +
                    " and industry=" + company.industry;*/
            String sql = "select * FROM companyTable";
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
            Statement stmt = (Statement) conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()) {
                Company com = new Company();
                com.originalArea = rs.getString("originalArea");
                com.id = rs.getInt("id");
                com.name = rs.getString("name");
                com.nameCode = rs.getString("nameCode");
                com.enterprisesNature = rs.getString("enterprisesNature");
                com.industry = rs.getString("industry");
                com.mainBusiness = rs.getString("mainBusiness");
                com.People = rs.getString("People");
                com.Address = rs.getString("Address");
                com.postalCode = rs.getString("postalCode");
                com.telephone = rs.getString("telephone");
                com.fax = rs.getString("fax");
                com.email = rs.getString("email");
                if ((com.nameCode.equals(choose) || com.name.equals(choose)) && com.industry.equals(company.industry) && com.enterprisesNature.equals(
                        company.enterprisesNature) && com.originalArea.equals(company.originalArea)){
                    if (user.rank == 2){
                        if (com.originalArea.equals(com1.originalArea)){
                            companies.add(com);
                        }
                    }else {
                        companies.add(com);
                    }
                }
            }
            rs.close();
            stmt.close();
            ps.close();
            conn.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void show(Company com){//调取company的信息
        if (find(com.id)){

        }else {
            String sql = "select * from companyTable where id=" + com.id;
            try {
                Connection conn = getConnection();
                PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
                Statement stmt = (Statement) conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                while(rs.next()) {
                    com.originalArea = rs.getString("originalArea");
                    com.id = rs.getInt("id");
                    com.name = rs.getString("name");
                    com.nameCode = rs.getString("nameCode");
                    com.enterprisesNature = rs.getString("enterprisesNature");
                    com.industry = rs.getString("industry");
                    com.mainBusiness = rs.getString("mainBusiness");
                    com.People = rs.getString("People");
                    com.Address = rs.getString("Address");
                    com.postalCode = rs.getString("postalCode");
                    com.telephone = rs.getString("telephone");
                    com.fax = rs.getString("fax");
                    com.email = rs.getString("email");
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

    public boolean findTheSame(String name){//检查name nameCode 是否重复
        int ch = 0;
        String sql = "select * from companyTable where name=" + name;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
            Statement stmt = (Statement) conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()){
                ch++;
                break;
            }
            rs.close();
            stmt.close();
            ps.close();
            conn.close();
        }catch(Exception e) {
            e.printStackTrace();
        }
        String sql1 = "select * from companyTable where nameCode=" + name;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql1);
            Statement stmt = (Statement) conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql1);
            while (rs.next()){
                ch++;
                break;
            }
            rs.close();
            stmt.close();
            ps.close();
            conn.close();
        }catch(Exception e) {
            e.printStackTrace();
        }
        if (ch == 0){
            return true;
        }else return false;
    }
}
