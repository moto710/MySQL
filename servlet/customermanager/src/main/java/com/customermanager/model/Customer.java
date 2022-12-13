package com.customermanager.model;

public class Customer {
    private int id, idCountry;
    private String fullName, address;

    public Customer() {

    }

    public Customer(int id, String fullName, String address, int idCountry) {
        this.id = id;
        this.fullName = fullName;
        this.address = address;
        this.idCountry = idCountry;
    }

    public long getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getIdCountry() {
        return idCountry;
    }

    public void setIdCountry(int idCountry) {
        this.idCountry = idCountry;
    }

    @Override
    public String toString() {
        return String.format("%s,%s,%s,%s", id, fullName, address, idCountry);
    }
}
