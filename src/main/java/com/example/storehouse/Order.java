package com.example.storehouse;

public class Order {
    private int id;
    private String dateTime;
    private Products product;
    private Client client;
    private int quantity;
    private boolean direction;

    public Order(int id, String dateTime, Products product, int quantity, boolean direction) {
        this.id = id;
        this.dateTime = dateTime;
        this.product = product;
        this.quantity = quantity;
        this.direction = direction;
        this.client = new Client();
    }

    public int getId() {
        return id;
    }

    public Products getProduct() {
        return product;
    }

    public String getDateTime() {
        return dateTime;
    }

    public int getQuantity() {
        return quantity;
    }
}
