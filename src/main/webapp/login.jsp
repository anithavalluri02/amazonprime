<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Amazon Prime Login</title>
</head>
<body>
    <h2>Login to Amazon Prime</h2>

    <c:if test="${not empty error}">
        <p style="color:red">${error}</p>
    </c:if>

    <form action="login" method="post">
        Username: <input type="text" name="username" /><br/><br/>
        Password: <input type="password" name="password" /><br/><br/>
        <input type="submit" value="Login" />
    </form>
</body>
</html>

