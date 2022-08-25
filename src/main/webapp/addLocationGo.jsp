<%@ page import="com.db.mongodb" %><%--
  Created by IntelliJ IDEA.
  User: xiahaifeng
  Date: 2022/7/31
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    String location=request.getParameter("location");
    mongodb db=new mongodb();
    db.addLocation(location);
%>
<script>
    window.location.href="addLocation.jsp";
</script>
<body>

</body>
</html>
