package com.customermanager.model;

public class Customer {
    private long id;
    private String fullName, address, country;

    public Customer() {

    }

    public Customer(long id, String fullName, String address, String country) {
        this.id = id;
        this.fullName = fullName;
        this.address = address;
        this.country = country;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
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

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    @Override
    public String toString() {
        return String.format("%s,%s,%s,%s", id, fullName, address, country);
    }
}
