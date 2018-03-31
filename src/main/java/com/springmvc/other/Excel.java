package com.springmvc.other;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.springmvc.entity.Company;
import com.springmvc.entity.CompanyData;
import com.springmvc.entity.User;
import com.springmvc.service.companyDataTable;
import com.springmvc.service.companyTable;
import com.springmvc.service.userTable;

import java.io.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class Excel{
    public void outputDataToExcel(){
        List<Content> contents = new ArrayList<Content>();
        companyTable tableD = new companyTable();
        userTable table = new userTable();
        List<User> users = new ArrayList<User>();
        try {
            Connection connection = table.getConnection();
            String sql = "select * from userTable";
            PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
            Statement stmt = (Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()){
                User user = new User();
                Company company = new Company();
                user.id = rs.getInt("id");
                user.account = rs.getString("account");
                company.id = user.id;
                tableD.findbyId(company);
                Content content = new Content();
                content.name = rs.getString("accompanyName");
                content.password = rs.getString("password");
                content.area = company.originalArea;
                content.enterprisesNature = company.enterprisesNature;
                content.industry = company.industry;
                content.mainBusiness = company.mainBusiness;
                content.address = company.Address;
                content.people = company.People;
                content.nameCode = company.nameCode;
                content.fax = company.fax;
                content.email = company.email;
                content.postalCode = company.postalCode;
                content.telephone = company.telephone;
                contents.add(content);
            }
            rs.close();
            stmt.close();
            ps.close();
            connection.close();
        }catch (Exception e){
            e.printStackTrace();
        }

        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("用户表一");
        HSSFRow row = sheet.createRow(0);
        HSSFCell cell = row.createCell(0);
        cell.setCellValue("企业名称");
        cell = row.createCell(1);
        cell.setCellValue("密码");
        cell = row.createCell(2);
        cell.setCellValue("所在地区");
        cell = row.createCell(3);
        cell.setCellValue("组织机构代码");
        cell = row.createCell(4);
        cell.setCellValue("企业性质");
        cell = row.createCell(5);
        cell.setCellValue("所属行业");
        cell = row.createCell(6);
        cell.setCellValue("主要经营业务");
        cell = row.createCell(7);
        cell.setCellValue("联系人");
        cell = row.createCell(8);
        cell.setCellValue("联系地址");
        cell = row.createCell(9);
        cell.setCellValue("邮政编码");
        cell = row.createCell(10);
        cell.setCellValue("联系电话");
        cell = row.createCell(11);
        cell.setCellValue("传真");
        cell = row.createCell(12);
        cell.setCellValue("email");

        for (int i = 0; i < contents.size(); i++) {
            HSSFRow row1 = sheet.createRow(i + 1);
            Content content = contents.get(i);
            //创建单元格设值
            row1.createCell(0).setCellValue(content.name);
            row1.createCell(1).setCellValue(content.password);
            row1.createCell(2).setCellValue(content.area);
            row1.createCell(3).setCellValue(content.nameCode);
            row1.createCell(4).setCellValue(content.enterprisesNature);
            row1.createCell(5).setCellValue(content.industry);
            row1.createCell(6).setCellValue(content.mainBusiness);
            row1.createCell(7).setCellValue(content.people);
            row1.createCell(8).setCellValue(content.address);
            row1.createCell(9).setCellValue(content.postalCode);
            row1.createCell(10).setCellValue(content.telephone);
            row1.createCell(11).setCellValue(content.fax);
            row1.createCell(12).setCellValue(content.email);
        }

        try {
            delete("E:\\user1.xls");
            FileOutputStream fos = new FileOutputStream("E:\\user1.xls");
            workbook.write(fos);
            System.out.println("写入成功");
            fos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void delete(String fileName) {
        File file = new File(fileName);
        if (file.exists()) {
            file.delete();
        }
    }
}
