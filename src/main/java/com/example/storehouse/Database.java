package com.example.storehouse;

import java.util.ArrayList;

import static java.util.UUID.randomUUID;

public class Database {
    public static ArrayList<Products> productList ;
    public static ArrayList<Order> orderList ;
    public static ArrayList<Client> clientList;

    public static void Init (int productNum, int clientNum){
        productList = new ArrayList<>();
        clientList = new ArrayList<>();
        for(int i = 0; i < productNum; i++){
            Database.productList.add(new Products());
        }
        for(int i = 0; i < clientNum; i++){
            Database.clientList.add(new Client());
        }
    }
    public static Products getProductByID(int id){
        for (Products product : productList) {
            int productId = product.getId();
            if (id == productId) {
                return product;
            }
        }
        return null;
    }
    public static Client getClientByID(int id){
        for (Client client : clientList) {
            int clientId = client.getId();
            if (id == clientId) {
                return client;
            }
        }
        return null;
    }
}
