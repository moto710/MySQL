package com.student.utils;

import java.util.regex.Pattern;

public class ValidateUtils {
    public static final String FULL_NAME_PATTERN = "^[A-Z][a-zA-Z]{3,}(?: [A-Z][a-zA-Z]*){0,2}$";
    public static final String EMAIL_REGEX = "^[A-Za-z0-9._]+@[a-z]+\\.[a-z]{2,3}$";

    public static boolean isFullNameValid(String fullName) {
        return Pattern.compile(FULL_NAME_PATTERN).matcher(fullName).matches();
    }
    public static  boolean isEmailValid(String email) {
        return Pattern.compile(EMAIL_REGEX).matcher(email).matches();
    }
}
