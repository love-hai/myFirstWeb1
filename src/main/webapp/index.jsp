<%@ page  contentType="text/html; charset=utf-8"  pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>xiahaifeng</title>
    <style>
        .notion{

            height: 15%;
            position: relative;
            background-color: #5C5858


        }
        .notion1{
            margin-left: 20%;
            position: relative;
            font-family: "Montserrat", sans-serif;
            letter-spacing: -0.2px;
            font-size: 50px;
            color:White;
        }
        .select{

            height: 10%;
            margin-left: 20%;
            position: relative;
        }
        .select1{
            width: 15%;
            border-radius:0;
        }
        .content{
            width: 800px;
            margin-left: 20%;
            position: relative;
            height: 800px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="Suspended.css">
</head>
<script>
    var examtime= new Date('2022/12/23 00:00:00');
    var s2=Date.parse(examtime);
    function shownotiontime(){
        var nowdate = new Date();
        var hour=23-nowdate.getHours();
        var min=59-nowdate.getMinutes();
        var sec=59-nowdate.getSeconds();
        var s1=Date.parse(nowdate);
        var total=(s2-s1)/1000;
        var day = parseInt(total/ (24*60*60));
        var x='距离考研还剩 '+day +'天 '+hour+'时 '+min+'分 '+sec+'秒 ！';
        document.getElementById("Notion").innerHTML=x;
        setTimeout("shownotiontime()",1000);
    }

    function changePage(url) {
        document.getElementById("Content").src=url;
    }
</script>


<body>
<div class="notion">
    <p class="notion1" id="Notion">welcome!</p>
</div>
<div class="select">
    <button id="button1" class="select1" onclick="changePage('meal.jsp')">今天吃点什么</button>
</div>

<iframe src="meal.jsp" id="Content" class="content" src=""></iframe>

</body>
<script>
    setTimeout("shownotiontime()",900);
</script>
</html>