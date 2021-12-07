package com.example.storehouse;

public class Products {
    private int id;
    private String type;
    private int price;
    private Person person;
    private String expireDate;
    private int quantity;
    private String location;

    public Products(int id, String type, int price, Person person, String expireDate, int quantity, String location){
        this.id = id;
        this.type = type;
        this.price = price;
        this.person = person;
        this.expireDate = expireDate;
        this.quantity = quantity;
        this.location = location;
    }

    public int getId() {
        return id;
    }

    public int getPrice() {
        return price;
    }

    public String getType() {
        return type;
    }

    public Person getPerson() {
        return person;
    }

    public String getExpireDate() {
        return expireDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getLocation() {
        return location;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
