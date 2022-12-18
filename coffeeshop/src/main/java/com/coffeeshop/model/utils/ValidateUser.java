package com.coffeeshop.model.utils;

import java.util.regex.Pattern;

public class ValidateUser {
    //8-20 characters long, no _ or . at the beginning/END, no __ or _. or ._ or .. inside, accept special character
    public static final String USERNAME_PATTERN = "^(?=[a-zA-Z0-9._@!#$%^&*]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$";
    //8-20 characters long, accept special character
    public static final String PASSWORD_PATTERN = "^(?=[a-zA-Z0-9._@!#$%^&*]{8,20}$)(?!.*[_.]{2}).*$";
    public static final String FULL_NAME_PATTERN = "^([A-ZÁÀẢÃẠĂẮẰẲẴẶÂẤẦẨẪẬĐÉÈẺẼẸÊẾỀỂỄỆÍÌỈĨỊÓÒỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢÚÙỦŨỤƯỨỪỬỮỰÝỲỶỸỴ]{1}[a-záàảãạăắằẳẵặâấầẩẫậđéèẻẽẹêếềểễệíìỉĩịóòỏõọôốồổỗộơớờởỡợúùủũụưứừửữựýỳỷỹỵ]+[ ]?)+$";
    public static final String EMAIL_REGEX = "^[A-Za-z0-9._]+@[a-z]{2,10}\\.[a-z]{2,3}$";
    public static final String PHONE_PATTERN = "/^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$/";

    public static boolean isPhoneValid(String phone) {
        return Pattern.compile(PHONE_PATTERN).matcher(phone).matches();
    }
    public static boolean isEmailValid(String email) {
        return Pattern.compile(EMAIL_REGEX).matcher(email).matches();
    }
    public static boolean isFullNameValid(String fullName) {
        return Pattern.compile(FULL_NAME_PATTERN).matcher(fullName).matches();
    }

    public static boolean isPasswordValid(String password) {
        return Pattern.compile(PASSWORD_PATTERN).matcher(password).matches();
    }

    public static boolean isUserNameValid(String userName) {
        return Pattern.compile(USERNAME_PATTERN).matcher(userName).matches();
    }
}
