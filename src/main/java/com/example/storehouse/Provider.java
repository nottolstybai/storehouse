package com.example.storehouse;

public class Provider extends Person {

    public Provider(int id, String name, String address, String email, String phone) {
        super(id, name, address, email, phone);
    }

    public void makeSupply(int id, String dateTime, Products product, int quantity, boolean direction){
        Order supply = new Order(id, dateTime, product, quantity, direction);
        // Ниже надо сделать добавление этого ордера в БД
    }


}
