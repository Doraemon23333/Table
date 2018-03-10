<%@ page import="com.springmvc.service.userTable" %><%--
  Created by IntelliJ IDEA.
  User: wpy
  Date: 2018/3/9
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    userTable user = new userTable();
    String password, account;
    account = request.getParameter("account");
    password = request.getParameter("password");
    boolean end = user.login(account, password);
    if(end == false){
        out.print("登陆失败");
    }else {
        out.print("登陆成功");
    }
%>
</body>
</html>
