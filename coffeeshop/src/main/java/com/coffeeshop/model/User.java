package com.coffeeshop.model;

public class User {
    private int id;
    private String userName;
    private String passWord;
    private String fullName;
    private String phone;
    private String email;
    private int idCountry;
    private String image;
    private String bio;

    public User() {

    }

    public User(int id, String userName, String passWord, String fullName, String phone, String email, int idCountry,String image,String bio) {
        this.id = id;
        this.userName = userName;
        this.passWord = passWord;
        this.fullName = fullName;
        this.phone = phone;
        this.email = email;
        this.idCountry = idCountry;
        this.image = image;
        this.bio = bio;
    }
    public User(String userName, String passWord, String fullName, String phone, String email, int idCountry, String image, String bio) {
        this.userName = userName;
        this.passWord = passWord;
        this.fullName = fullName;
        this.phone = phone;
        this.email = email;
        this.idCountry = idCountry;
        this.image = image;
        this.bio = bio;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getIdCountry() {
        return idCountry;
    }

    public void setIdCountry(int idCountry) {
        this.idCountry = idCountry;
    }
}
