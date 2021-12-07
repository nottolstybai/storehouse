package com.example.storehouse;

public class Consumer extends Person {

    public Consumer(int id, String name, String address, String email, String phone) {
        super(id, name, address, email, phone);
    }

    public void makeOrder(int id, String dateTime, Products product, int quantity, boolean direction){
        Order order = new Order(id, dateTime, product, quantity, direction);
        // Ниже будет добавление в БД
    }
}
