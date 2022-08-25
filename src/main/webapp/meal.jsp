<%--
  Created by IntelliJ IDEA.
  User: xiahaifeng
  Date: 2022/7/30
  Time: 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.db.mongodb" import="com.model.meal"%>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<%@ page import="com.mongodb.MongoClientURI" %>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="com.mongodb.client.FindIterable" %>
<%@ page import="com.mongodb.client.MongoCursor" %>
<%@ page import="com.mongodb.client.model.Filters" %>
<html>
<link rel="stylesheet" type="text/css" href="Suspended.css">
<head>
    <style>
        .meal{
            position:relative;
            width: 80px;height: 80px;
            color:black;
            font-size: 24px;
            font-family:隶书;
            font-weight:bold;
            border-style: outset;
            border-width: 8px;
            border-radius: 16px;
            border-color: #E0FFFF;
          }
        .mealOfselected{
            position:relative;
            width: 80px;height: 80px;
            color:black;
            font-size: 30px;
            font-family:隶书;
            font-weight:bold;
            border-style: outset;
            border-width: 8px;
            border-radius: 16px;
            border-color: #E0FFFF;
        }
        .selectStyle{
            position:relative;
            margin-left: 80px;
            width: 160px;height: 40px;
            font-weight:bold;
            border-style: outset;
            border-width: 4px;

            border-color: #E0FF00;

        }
        .optionStyle{
            width: 80px;height: 40px;
            color:black;
            font-size: 24px;
            font-family:楷体;
            font-weight:bold;
            border-style: inset;
            border-color: #E0FFFF;
        }
    </style>
    <script>
        function changeStyle(b,asel) {
            if(b<=asel){
                document.getElementById("meal"+(b-1)).style="border-color: #E0FFFF;";
                document.getElementById("meal"+b).style="border-color: #F75D59;";
                b=b+1;
                setTimeout("changeStyle("+b+","+asel+")",200);
            }
        }
        function selectMeal(num){
            for(var i=0;i<num;i++){
                document.getElementById("meal"+i).style="border-color: #E0FFFF;";
            }
            let asel = Math.random()*10000;
            asel=asel%num;
            let b = 1;
            document.getElementById("meal0").style="border-color: #F75D59;";
            if(asel!==0){
                setTimeout("changeStyle("+b+","+asel+")",200);
            }
        }
        function openWindow(){
            window.location.href="addMealAndLocation.jsp";


        }
        function selectLocation(){
           var location=document.getElementById("selectLocation").value;
            window.location.href='meal.jsp?location='+location;
        }
    </script>
</head>
<body>
<%

    String location=request.getParameter("location");
    if(location==null||location.equals("")){
        location="东苑";
    }
    %>
<select class="selectStyle" id="selectLocation" onchange="selectLocation()">
    <option class="optionStyle" value="<%=location%>"><%=location%></option>
    <%  class mongodb {
        private MongoClient mongoClient;
        private MongoDatabase mongoDatabase=null;
        public mongodb()
        {

            try{   String mongoUri = "mongodb://root:123456@123.56.138.15:27017/admin";
                MongoClientURI connStr = new MongoClientURI(mongoUri);
                mongoClient = new MongoClient(connStr);
                mongoDatabase = mongoClient.getDatabase("myWeb");
                System.out.println("myWeb选择成功");
            }catch(Exception e){
                System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            }
        }
        public List<meal> findMealByLocation(String location){

            List<meal> list=new ArrayList<meal>();
            MongoCollection<Document> collection = mongoDatabase.getCollection("meal");
            FindIterable<Document> iter = collection.find(new Document("location",location));
            MongoCursor<Document> mongoCursor = iter.iterator();
            if(!mongoCursor.hasNext()) {
                return null;
            }
            while(mongoCursor.hasNext()) {
                Document document=mongoCursor.next();
                meal Meal=new meal();
                Meal.setLocation(document.getString("location").toString());
                Meal.setName(document.getString("name").toString());
                list.add(Meal);
            }
            return list;
        }

        public List<String> checkQuanityOfLocation(){
            List<String> list =new ArrayList<String>();
            MongoCollection<Document> collection = mongoDatabase.getCollection("meal");
            FindIterable<Document> iter = collection.find(new Document("name","meal"));
            MongoCursor<Document> mongoCursor = iter.iterator();
            if(!mongoCursor.hasNext()) {
                return null;
            }
            Document document=mongoCursor.next();
            int quanity=document.getInteger("quanity");
            for(int i=1;i<=quanity;i++){
                list.add(document.getString("location"+i).toString());
            }

            return list;
        }
        public void addMeal(String location,String name){
            MongoCollection<Document> collection = mongoDatabase.getCollection("meal");


            Document document = new Document("location", location).append("name",name);

            collection.insertOne(document);
            System.out.println("meal插入成功");

        }
        public void addLocation(String location){
            MongoCollection<Document> collection = mongoDatabase.getCollection("meal");
            FindIterable<Document> iter = collection.find(new Document("name","meal"));
            MongoCursor<Document> mongoCursor = iter.iterator();

            if(!mongoCursor.hasNext()) {

            }else {
                Document document=mongoCursor.next();
                int quanity=document.getInteger("quanity");
                quanity++;
                System.out.println("insert is no chenggo"+quanity);
                collection.updateOne(Filters.eq("name", "meal"),new Document("$set",new Document("quanity",quanity)));
                collection.updateOne(Filters.eq("name", "meal"),new Document("$set", new Document("location"+quanity,location)));

            }





        }}
        mongodb db=new mongodb();
        List<String> list1=db.checkQuanityOfLocation();
        int quanity=list1.size();
        for (int i=0;i<quanity;i++){
            if(list1.get(i).equals(location)){
                continue;
            }
    %>
    <option class="optionStyle" value="<%=list1.get(i)%>"><%=list1.get(i)%></option>
    <%
        }
    %>

</select>
<%
    List<meal> list=new ArrayList<meal>();
    list=db.findMealByLocation(location);
    int col=8;
    int num=0;
    if(list!=null){
    num=list.size();

%>
<table>
    <tr>
        <%
            int n=0;
            for(int i=0;i<num;i++) {
                meal Meal=list.get(i);
                if(n<col){n++;
        %>
        <td>
            <div class="meal" id="meal<%=i%>">
                <%=Meal.getName() %>
            </div>
        </td>
                <%}
                else{
                    n=n%col;
                    i--;
                    %>
                </tr>

                <tr>
               <% }
               }
            }%>
    </tr>
</table>
<div style="position: relative;width: 100%;left: 0">
    <input type="button" style="position: relative;top:0;left:0;width:20%;" value="开选" onclick="selectMeal(<%=num %>);" />
    <input type="button" style="position: relative;top:0;left:0;width:20%;" value="添加食堂和店铺" onclick="openWindow();" />
</div>
</body>
</html>
