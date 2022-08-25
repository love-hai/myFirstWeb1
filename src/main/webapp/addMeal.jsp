<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: xiahaifeng
  Date: 2022/7/30
  Time: 22:21
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

    function addMeal(){
        let location=document.getElementById("Location").value;
        let name=document.getElementById("meal_name").value;
        if(name==""){
            alert("输入正确的名称！");
        }else {
        document.getElementById("meal_name").value="";
        window.location.href="addMealGo.jsp?location="+location+"&name=" +name;}

    }
</script>


    <table>
        <tr>
            <td><p> 位置:</p></td>
            <td>
                <select class="selectStyle" id="Location" onchange="selectLocation()">
                    <%  mongodb db=new mongodb();
                        List<String> list1=db.checkQuanityOfLocation();
                        int quanity=list1.size();
                        for (int i=0;i<quanity;i++){
                    %>
                    <option class="optionStyle" value="<%=list1.get(i)%>"><%=list1.get(i)%></option>
                    <%
                        }
                    %>

                </select>
            </td>
        </tr>

        <tr>
            <td><p>店铺名称:</p></td>

            <td><input type="text" id="meal_name" value="" /></td>
        </tr>

        <tr>
            <td></td>
            <td><button value="添加店铺" onclick="addMeal()" style="width:40%;">添加</button></td>

        </tr>
    </table>

</body>
</html>
