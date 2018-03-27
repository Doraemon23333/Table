package com.springmvc.controller;

import com.springmvc.entity.Browser;
import com.springmvc.entity.Company;
import com.springmvc.entity.Role;
import com.springmvc.entity.User;
import com.springmvc.service.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

public class RegisterServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        PrintWriter out = response.getWriter();

        String id = request.getParameter("id");
        String rank = request.getParameter("rank");
        String rank2 = request.getParameter("rank2");
        User province = new User();
        provinceTable tableP = new provinceTable();
        tableP.findById(Integer.parseInt(id), province);

        if (rank.equals("3")){
            Role role = new Role();
            role.RoleNum = province.roleId;
            RoleTable roleTable = new RoleTable();
            roleTable.find(role);
            out.println("SetUser = " + role.SetUser + ", ifroot = " + role.ifroot);
            if ((role.SetUser == 1 || role.ifroot == 1) && (name.equals("") == false) && password.equals("") == false){
                Browser browser = new Browser();
                Calendar c = Calendar.getInstance();
                int year = c.get(Calendar.YEAR);
                int month = c.get(Calendar.MONTH);
                int day = c.get(Calendar.DAY_OF_MONTH);
                browser.broswerDay = day;
                browser.broswerYear = year;
                browser.broswerMonth = month;
                browser.content = province.accompanyName;
                browser.rank = Integer.parseInt(rank);
                browser.id = Integer.parseInt(id);

                User user = new User();
                if (rank2.equals("1")){
                    userTable table = new userTable();
                    boolean end = table.find("accompanyName", name, user);
                    if (end){
                        out.print("该用户无法注册");
                    }else {
                        user.accompanyName = name;
                        user.password = password;
                        boolean end2 = table.insert(user);
                        if (end2){
                            table.find("accompanyName", name, user);

                            browser.content = browser.content + "注册了一个新公司, 名叫" + user.accompanyName;
                            browserTable table1 = new browserTable();
                            table1.insert(browser);
                            out.print("新用户账户为: " + user.account);
                            companyTable table2 = new companyTable();
                            Company company = new Company();
                            company.id = user.id;
                            company.originalArea = "山东";
                            company.name = user.accompanyName;
                            company.nameCode = user.accompanyName;
                            company.enterprisesNature = "";
                            company.industry = "";
                            company.email = "";
                            company.mainBusiness = "";
                            company.People = "";
                            company.Address = "";
                            company.postalCode = "";
                            company.telephone = "";
                            company.fax = "";
                            table2.insert(company);
                        }else {
                            out.print("注册失败");
                        }
                    }
                }else if (rank2.equals("2")){
                    cityTable table = new cityTable();
                    boolean end = table.find("accompanyName", name, user);
                    if (end){
                        out.print("该用户无法注册");
                    }else {
                        user.accompanyName = name;
                        user.password = password;
                        user.area = name;
                        user.areaCode = name;
                        boolean end2 = table.insert(user);
                        if (end2){
                            table.find("accompanyName", name, user);

                            browser.content = browser.content + "注册了一个新用户, 名叫" + user.accompanyName;
                            browserTable table1 = new browserTable();
                            table1.insert(browser);
                            out.print("新用户账户为: " + user.account);
                        }else {
                            out.print("注册失败");
                        }
                    }
                }else if (rank2.equals("3")){
                    provinceTable table = new provinceTable();
                    boolean end = table.find("accompanyName", name, user);
                    if (end){
                        out.print("该用户无法注册");
                    }else {
                        user.accompanyName = name;
                        user.password = password;
                        boolean end2 = table.insert(user);
                        if (end2){
                            table.find("accompanyName", name, user);
                            Role role1 = new Role();
                            role1.id = user.id;
                            role1.SetDate = 1;
                            role1.SearchCompany = 1;
                            role1.SearchData = 1;
                            role1.ifroot = 1;
                            roleTable.insert(role1);
                            roleTable.findbyId(role1);
                            user.roleId = role1.RoleNum;
                            table.updateI("roleId", user.roleId, user.id);

                            browser.content = browser.content + "注册了一个新用户, 名叫" + user.accompanyName;
                            browserTable table1 = new browserTable();
                            table1.insert(browser);
                            out.print("新用户账户为: " + user.account);
                        }else {
                            out.print("注册失败");
                        }
                    }
                }
            }else if (name.equals("") || password.equals("")){
                out.println("不能为空");
            } else {
                out.println("您没有该权限");
            }
        }else if (rank.equals("2")){
            out.println("市没有该权限");
        }
    }
}
