<%--
  Created by IntelliJ IDEA.
  User: xiahaifeng
  Date: 2022/7/31
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.db.*" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" type="text/css" href="Suspended.css">
<body>
<style type="text/css">
    p{
        font-size: 20px;
        font-family:"隶书";
        color:black;
        font-weight:800;
        font-style:italic;
    }
    .selectStyle{
        position:relative;
        margin-left:0;
        width: 100%;height: 40px;
        font-weight:bold;
        border-style: outset;
        border-radius: 20px;

        border-color: black;

    }
    .optionStyle{
        width: 80px;height: 40px;
        color:black;
        font-size: 14px;
        font-family:楷体;
        font-weight:bold;
        border-style: inset;
        border-color: #E0FFFF;
    }

</style>
</head>
<script>

    function addLocation(){
        let location=document.getElementById("meal_Location").value;
        if(Location==""){
            alert("输入正确的地址！");
        }else {
            document.getElementById("meal_Location").value = "";
            window.location.href = "addLocationGo.jsp?location="+location;
        }

    }
</script>


<table>


    <tr>
        <td><p>位置:</p></td>

        <td><input type="text" id="meal_Location" value="" /></td>
    </tr>

    <tr>
        <td></td>
        <td><button value="添加" onclick="addLocation()" style="width:60%;height: 40px;">添加地址</button></td>

    </tr>
</table>

</body>
</html>