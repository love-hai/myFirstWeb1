<%--
  Created by IntelliJ IDEA.
  User: xiahaifeng
  Date: 2022/7/31
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="Suspended.css">
<html>
<head>
    <title>添加食堂和店铺</title>
</head>
<style>
    .Left{
        position: absolute;
        width: 50%;
        height: 50%;
        top: 0;
        left: 0;
    }
    .Right{
        position: absolute;

        width: 50%;
        height: 50%;
        top: 0;
        right: 0;
    }
</style>
<script type="text/javascript">

</script>
<body>
<iframe id="addMeal" class="Left" src="addMeal.jsp">

</iframe>
<iframe id="addLocation" class="Right" src="addLocation.jsp">

</iframe>
<input type="button" value="关闭" style="position: absolute;bottom:20%;left:40%;width:20%;"onclick="window.location.href='meal.jsp';"/>
</body>
</html>
