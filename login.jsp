<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Form</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body class="black-theme">
    <div class="login-container">
        <h1>Login</h1>
        
        <form action="LoginServlet" method="post">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Login">
            <%-- Display error message using JSTL --%>
        	<c:if test="${not empty errorMessage}">
           	 <p class="error-message">${errorMessage}</p>
       		</c:if>
        </form>
    </div>
</body>
</html>
    
