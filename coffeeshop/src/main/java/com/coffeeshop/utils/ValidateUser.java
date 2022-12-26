package com.coffeeshop.model.utils;

import java.util.regex.Pattern;

public class ValidateUser {
    //8-20 characters long, accept special character
    private static final String USERNAME_PATTERN = "^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$";
    //8-20 characters long, accept special character, must include both number and character
    private static final String PASSWORD_PATTERN = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$";
    private static final String EMAIL_REGEX = "^[A-Za-z0-9._]+@[a-z]{2,10}\\.[a-z]{2,3}$";
    private static final String PHONE_PATTERN = "^0[1-9][0-9]{8}$";
    private static final String HTTP_PATTERN = "https?:\\/\\/(www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{1,256}\\.[a-zA-Z0-9()]{1,6}\\b([-a-zA-Z0-9()@:%_\\+.~#?&//=]*)";

    public static boolean isLinkValid(String link) {
        return Pattern.compile(HTTP_PATTERN).matcher(link).matches();
    }
    public static boolean isPhoneValid(String phone) {
        return Pattern.compile(PHONE_PATTERN).matcher(phone).matches();
    }
    public static boolean isEmailValid(String email) {
        return Pattern.compile(EMAIL_REGEX).matcher(email).matches();
    }

    public static boolean isPasswordValid(String password) {
        return Pattern.compile(PASSWORD_PATTERN).matcher(password).matches();
    }

    public static boolean isUserNameValid(String userName) {
        return Pattern.compile(USERNAME_PATTERN).matcher(userName).matches();
    }
}
