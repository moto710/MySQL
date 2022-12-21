package com.coffeeshop.controller;

import com.coffeeshop.model.Country;
import com.coffeeshop.model.User;
import com.coffeeshop.model.service.CountryDAO;
import com.coffeeshop.model.service.UserDAO;
import com.coffeeshop.model.utils.ValidateUser;

import java.io.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet({"/home", ""})
public class UserServlet extends HttpServlet {
    private final UserDAO userDAO = new UserDAO();
    private List<User> userList;
    private List<Country> countryList;
    private final CountryDAO countryDAO = new CountryDAO();
    private User user;
    private Set<String> errors;
    private String message;
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String action = getAction(req);
        switch (action) {
            case "signUp":
                showSignUpView(req, resp);
                break;
            case "forgotPW":
                showForgotPWView(req, resp);
                break;
            case "edit":
                showEditView(req, resp);
                break;
            case "remove":
                showRemoveView(req, resp);
                break;
            default:
                showUserManagerView(req, resp);
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = getAction(req);
        switch (action) {
            case "signUp":
                signUp(req, resp);
                break;
            case "forgotPW":
                forgotPW(req, resp);
                break;
            case "edit":
                editUser(req, resp);
                break;
//            default:
//                showLoginView(req, resp);
//                break;
        }
    }

    private void showRemoveView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        userDAO.delete(id);
        req.getRequestDispatcher("WEB-INF/index/mainJsp/userManager.jsp").forward(req, resp);
    }

    private void editUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String userName = req.getParameter("userName");
        String passWord = req.getParameter("passWord");
        String fullName = req.getParameter("fullName");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        int idCountry = Integer.parseInt(req.getParameter("idCountry"));
        String image = req.getParameter("image");
        if (image.equals("")) {
            image = null;
        }
        String bio = req.getParameter("bio");
        if (bio.equals("")) {
            bio = null;
        }
        userDAO.update(new User(id, userName, passWord, fullName, phone, email, idCountry, image, bio));
        message = "Change your information success!";
        req.setAttribute("message", message);
//        resp.sendRedirect("/home");
        req.getRequestDispatcher("WEB-INF/index/mainJsp/edit.jsp").forward(req, resp);
    }

    private void showEditView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        user = userDAO.select(id);
        countryList = countryDAO.selectAll();
        req.setAttribute("countryList", countryList);
        req.setAttribute("user", user);
        req.getRequestDispatcher("WEB-INF/index/mainJsp/edit.jsp").forward(req, resp);
    }

    private void showUserManagerView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int page = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
        int recordsPerPage = req.getParameter("recordsPerPage") == null ? 5 : Integer.parseInt(req.getParameter("recordsPerPage"));
        String keyword = req.getParameter("keyword") == null ? "" : req.getParameter("keyword");
        String sort = req.getParameter("sort") == null ? "idAsc" : req.getParameter("sort");
        countryList = countryDAO.selectAll();

        switch (sort) {
            case "idDesc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, keyword, "id", "desc");
                break;
            case "userNameAsc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, keyword, "userName", "ASC");
                break;
            case "userNameDesc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, keyword, "userName", "DESC");
                break;
            case "passWordAsc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, keyword, "passWord", "ASC");
                break;
            case "passWordDesc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, keyword, "passWord", "DESC");
                break;
            case "fullNameAsc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, keyword, "fullName", "ASC");
                break;
            case "fullNameDesc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, keyword, "fullName", "DESC");
                break;
            case "phoneAsc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, keyword, "phone", "ASC");
                break;
            case "phoneDesc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, keyword, "phone", "DESC");
                break;
            case "emailAsc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, keyword, "email", "ASC");
                break;
            case "emailDesc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, keyword, "email", "DESC");
                break;
            case "addressAsc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, keyword, "address", "ASC");
                break;
            case "addressDesc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, keyword, "address", "DESC");
                break;
            default:
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, keyword, "id", "ASC");
                break;
        }
        int noOfRecords = userDAO.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
        req.setAttribute("countryList", countryList);
        req.setAttribute("keyword", keyword);
        req.setAttribute("userList", userList);
        req.setAttribute("noOfPages", noOfPages);
        req.setAttribute("page", page);
        req.setAttribute("sort", sort);
        req.setAttribute("recordsPerPage", recordsPerPage);
        req.getRequestDispatcher("WEB-INF/index/mainJsp/userManager.jsp").forward(req, resp);
    }

    private void forgotPW(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String pw = userDAO.findPW(userName, email, phone);
        String method = req.getMethod();
        req.setAttribute("method", method);
        req.setAttribute("pw", pw);
        req.getRequestDispatcher("/WEB-INF/index/mainJsp/forgotPW.jsp").forward(req, resp);
    }

    private void showForgotPWView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getMethod();
        req.setAttribute("method", method);
        req.getRequestDispatcher("WEB-INF/index/mainJsp/forgotPW.jsp").forward(req, resp);
    }

    private void signUp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        errors = new HashSet<>();
        userList = userDAO.selectAll();
        countryList = countryDAO.selectAll();
        int id = userDAO.findBiggestId() + 1;
        String userName = req.getParameter("userName");
        for (User u : userList) {
            if (u.getUserName().equals(userName)) {
                errors.add("Your username had been registered! Please choose another one!");
                break;
            }
        }
        if (!ValidateUser.isUserNameValid(userName)) {
            errors.add("Username must be 8-20 characters long, accept special character!");
        }
        String passWord = req.getParameter("passWord");
        if (!ValidateUser.isPasswordValid(passWord)) {
            errors.add("Password must be 8-20 characters long, accept special character, must include both number and character!");
        }
        String fullName = req.getParameter("fullName");
        String phone = req.getParameter("phone");
        for (User u : userList) {
            if (u.getPhone().equals(phone)) {
                errors.add("Your phone had been registered! Please choose another one!");
            }
        }
        if (!ValidateUser.isPhoneValid(phone)) {
            errors.add("Wrong phone number! Example: 0909298966");
        }
        String email = req.getParameter("email");
        if (!ValidateUser.isEmailValid(email)) {
            errors.add("Wrong syntax~ Email should be: abc@xyz.com");
        }
        for (User u : userList) {
            if (u.getEmail().equals(email)) {
                errors.add("Your email had been registered! Please choose another one!");
            }
        }
        for (User u : userList) {
            if (u.getEmail().equals(email)) {
                errors.add("Your email had been registered! Please choose another one!");
            }
        }
        String rePassWord = req.getParameter("rePassWord");
        if (!passWord.equals(rePassWord)) {
            errors.add("Password does not match!");
        }
        int idCountry = Integer.parseInt(req.getParameter("idCountry"));
        String image = req.getParameter("image");
        if (!ValidateUser.isLinkValid(image) && !image.equals("")) {
            errors.add("Your link is not valid!");
        }
        String bio = req.getParameter("bio");
        if (errors.isEmpty()) {
            user = new User(id, userName, passWord, fullName, phone, email, idCountry, image, bio);
            userDAO.insert(user);
            req.setAttribute("user", user);
            req.getRequestDispatcher("WEB-INF/index/mainJsp/signUpForm.jsp").forward(req, resp);
        } else {
            req.setAttribute("userName", userName);
            req.setAttribute("passWord", passWord);
            req.setAttribute("rePassWord", rePassWord);
            req.setAttribute("fullName", fullName);
            req.setAttribute("phone", phone);
            req.setAttribute("email", email);
            req.setAttribute("idCountry", idCountry);
            req.setAttribute("image", image);
            req.setAttribute("bio", bio);
            req.setAttribute("errors", errors);
            req.setAttribute("countryList", countryList);
            req.getRequestDispatcher("WEB-INF/index/mainJsp/edit.jsp").forward(req, resp);
        }
    }

    private void showSignUpView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        countryList = countryDAO.selectAll();
        req.setAttribute("countryList", countryList);
        req.getRequestDispatcher("WEB-INF/index/mainJsp/signUpForm.jsp").forward(req, resp);
    }

    protected String getAction(HttpServletRequest req) {
        return req.getParameter("action") == null ? "" : req.getParameter("action");
    }
}