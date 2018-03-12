<%@ page import="com.springmvc.service.userTable" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String account, password;
    userTable user = new userTable();
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
