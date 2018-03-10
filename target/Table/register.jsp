<%--
  Created by IntelliJ IDEA.
  User: wpy
  Date: 2018/3/9
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<body>
<form action="main.jsp" method="post" onsubmit="return check(this);">
    <table align="center" width="450">
        <tr>
            <td align="center" colspan="2">
                <h2>登陆</h2>
                <hr>
            </td>
        </tr>
        <tr align="right">
            <td>账户: </td>
            <td><input type="text" name="account"></td>
        </tr>
        <tr align="right">
            <td>密码: </td>
            <td><input type="password" name="password"></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <input type="submit" value="登陆">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
