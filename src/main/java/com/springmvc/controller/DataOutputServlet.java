package com.springmvc.controller;

import com.google.gson.JsonArray;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.springmvc.entity.Company;
import com.springmvc.entity.CompanyData;
import com.springmvc.entity.Role;
import com.springmvc.entity.User;
import com.springmvc.other.Excel;
import com.springmvc.service.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;

public class DataOutputServlet extends HttpServlet{//数据输出api
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=utf-8");
        Excel excel = new Excel();
        excel.outputDataToExcel();
        PrintWriter out = response.getWriter();
        JSONArray data = new JSONArray();
        try {
            userTable tableU = new userTable();
            companyTable tableC = new companyTable();
            Connection connection = tableU.getConnection();
            String sql = "select * from userTable";
            PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
            Statement stmt = (Statement) connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()){
                User user = new User();
                Company company = new Company();
                user.id = rs.getInt("id");
                user.account = rs.getString("account");
                user.accompanyName = rs.getString("accompanyName");
                user.password = rs.getString("password");
                user.usingCondition = rs.getString("usingCondition");
                user.registerYear = rs.getInt("registerYear");
                user.registerMonth = rs.getInt("registerMonth");
                user.registerDay = rs.getInt("registerDay");
                user.unregisterYear = rs.getInt("unregisterYear");
                user.unregisterMonth = rs.getInt("unregisterMonth");
                user.unregisterDay = rs.getInt("unregisterDay");
                user.rank = rs.getInt("rank");
                user.companyDataId = rs.getInt("companyDataId");
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("id", user.id);
                jsonObject.put("account", user.account);
                jsonObject.put("accompanyName", user.account);
                jsonObject.put("password", user.password);
                jsonObject.put("registerYear", user.registerYear);
                jsonObject.put("registerMonth", user.registerMonth);
                jsonObject.put("registerDay", user.registerDay);
                jsonObject.put("usingCondition", user.usingCondition);
                jsonObject.put("rank", user.rank);
                jsonObject.put("unregisterYear", user.unregisterYear);
                jsonObject.put("unregisterMonth", user.unregisterMonth);
                jsonObject.put("unregisterDay", user.unregisterDay);
                company.id = user.id;
                tableC.findbyId(company);
                jsonObject.put("area", company.originalArea);
                jsonObject.put("nameCode", company.nameCode);
                jsonObject.put("enterprisesNature", company.enterprisesNature);
                jsonObject.put("industry", company.industry);
                jsonObject.put("mainBusiness", company.mainBusiness);
                jsonObject.put("People", company.People);
                jsonObject.put("Address", company.Address);
                jsonObject.put("postalCode", company.postalCode);
                jsonObject.put("telephone", company.telephone);
                jsonObject.put("fax", company.fax);
                jsonObject.put("email", company.email);
                companyDataTable tableD = new companyDataTable();
                CompanyData companyData = new CompanyData();
                companyData.companyDataId = user.companyDataId;
                tableD.find(companyData);
                jsonObject.put("csPeople", companyData.csPeople);
                jsonObject.put("surveyPeople", companyData.surveyPeople);
                jsonObject.put("addition", companyData.addition);
                jsonObject.put("reduceType", companyData.reduceType);
                jsonObject.put("mainReason", companyData.mainReason);
                jsonObject.put("mR_instruction", companyData.mR_instruction);
                jsonObject.put("secondReason", companyData.secondReason);
                jsonObject.put("sR_instruction", companyData.sR_instruction);
                jsonObject.put("thirdReason", companyData.thirdReason);
                jsonObject.put("tR_instruction", companyData.tR_instruction);
                jsonObject.put("setTime", companyData.accountYear + "-" + companyData.accountMonth + "-" + companyData.accountDay);
                data.add(jsonObject);
            }
            rs.close();
            stmt.close();
            ps.close();
            connection.close();
            out.println(data.toString());
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
