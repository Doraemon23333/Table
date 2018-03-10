<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<form action="main.jsp" method="post" onsubmit="return check(this);">
    <table align="center" width="250">
        <tr>
            <td align="center" colspan="2">
                <h2>Table</h2>
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
            <td colspan="2" align="center"><input type="submit" value="登陆"></td>
        </tr>
    </table>
</form>
</body>
</html>
