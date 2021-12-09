package com.example.storehouse;

import java.util.Random;

public class Admin {
    public static void addProduct(String name, String type, int price, String expireDate, int quantity, int location){
        Products product = new Products(name, type, price, expireDate, quantity, location);
        Database.productList.add(product);
    }
    public static void removeProduct(int id){
        Database.productList.remove(Database.getProductByID(id));
    }
    public static void addClient(String name, String address, String email, String phone, String role){
        Client client = new Client(name, address, email, phone, role);
        Database.clientList.add(client);
    }
    public static void removeClient(int id){
        Database.clientList.remove(Database.getClientByID(id));
    }
    public static void addOrder(String dateTime, Products product, int quantity, String direction, Client client){
        Order order = new Order(dateTime, product, quantity, direction, client);
        Database.orderList.add(order);
    }
    public static void removeOrder(int id){
        Database.orderList.remove(Database.getOrderByID(id));
    }
}
