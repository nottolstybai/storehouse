package com.example.storehouse;

import java.util.Random;

public class Admin {
    public static void addProduct(int id, String name, String type, int price, String expireDate, int quantity, int location){
        Products product = new Products(id, name, type, price, expireDate, quantity, location);
        Database.productList.add(product);
    }
    public static void removeProduct(int id){
        Database.productList.remove(Database.getProductByID(id));
    }
    public static void addClient(int id, String name, String address, String email, String phone){
        Client client = new Client(id, name, address, email, phone);
        Database.clientList.add(client);
    }
    public static void removeClient(int id){
        Database.productList.remove(Database.getClientByID(id));
    }
}
