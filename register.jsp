<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Form</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body class="black-theme">
    <div class="register-container">
        <h1>Register</h1>
        <form action="RegisterServlet" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="age">Age:</label>
            <input type="number" id="age" name="age" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="contact">Contact:</label>
            <input type="text" id="contact" name="contact" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Register">
            
            <%-- Display success message using JSTL --%>
        	<c:if test="${not empty successMessage}">
           	 <p class="error-message">${successMessage}</p>
       		</c:if>
            
             <%-- Display error message using JSTL --%>
        	<c:if test="${not empty errorMessage}">
           	 <p class="error-message">${errorMessage}</p>
       		</c:if>
       		
        </form>
    </div>
</body>
</html>
