<%@ page import="com.db.mongodb" %><%--
  Created by IntelliJ IDEA.
  User: xiahaifeng
  Date: 2022/7/31
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String location=request.getParameter("location");
    String name=request.getParameter("name");
    mongodb db=new mongodb();
    db.addMeal(location,name);
%>
</body>
<script>
    window.location.href="addMeal.jsp";
</script>
</html>
