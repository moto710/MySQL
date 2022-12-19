package com.coffeeshop.model;

public class Product {
    private int id;
    private String name;
    private int quantity;
    private double price;
    private int idSupplier;

    public Product() {
    }

    public Product(int id, String name, int quantity, double price, int idSupplier) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.idSupplier = idSupplier;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getIdSupplier() {
        return idSupplier;
    }

    public void setIdSupplier(int idSupplier) {
        this.idSupplier = idSupplier;
    }
}
