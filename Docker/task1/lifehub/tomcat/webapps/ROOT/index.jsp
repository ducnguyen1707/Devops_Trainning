<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tomcat Hello</title>
</head>
<body>
    <h1>Hello from Tomcat running on port 8080!</h1>
    <% 
        java.time.LocalDateTime now = java.time.LocalDateTime.now();
        out.println("Current time: " + now);
    %>
</body>
</html>