package com.db;

import com.model.meal;
import com.mongodb.*;
import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import org.bson.Document;

import java.util.ArrayList;
import java.util.List;

public class mongodb {
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





    }
    public static void main( String args[] ){
        mongodb db=new mongodb();
//        List<meal> list=new ArrayList<meal>();
//        list=db.findMealByLocation("东苑");
//        System.out.print(list.get(0).getName());
//
//        List<String> list1=new ArrayList<String >();
//        list1=db.checkQuanityOfLocation();
//        System.out.print(list1.get(0));
//        db.addMeal("东苑","麻辣香锅");
        db.addLocation("北苑");


    }

}
