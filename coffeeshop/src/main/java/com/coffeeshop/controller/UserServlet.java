package com.coffeeshop.controller;

import com.coffeeshop.model.User;
import com.coffeeshop.model.service.UserDAO;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet({"/login", ""})
public class UserServlet extends HttpServlet {
    private final UserDAO userDAO = new UserDAO();
    private List<User> userList = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String action = getAction(req);
        switch (action) {
            case "login":
                showLoginView(req, resp);
                break;
            case "signUp":
                showSignUpView(req, resp);
                break;
            case "forgotPW":
                showForgotPWView(req, resp);
                break;
            default:
                showLoginView(req, resp);
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = getAction(req);
        switch (action) {
            case "login":
                login(req, resp);
                break;
            case "signUp":
                signUp(req, resp);
                break;
            case "forgotPW":
                forgotPW(req, resp);
                break;
            default:
                showLoginView(req, resp);
                break;
        }
    }

    private void forgotPW(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String msg = "Can't find your account, try again!";
        userList = userDAO.selectAll();
        for (User user : userList) {
            if (user.getUserName().equals(userName) && user.getEmail().equals(email) && user.getPhone().equals(phone)) {
                String pw = user.getPassWord();
                req.setAttribute("pw", pw);
                break;
            } else {
                req.setAttribute("msg", msg);
            }
        }
        req.getRequestDispatcher("WEB-INF/forgotPW.jsp").forward(req, resp);
    }

    private void showForgotPWView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/forgotPW.jsp").forward(req, resp);
    }

    private void signUp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String passWord = req.getParameter("passWord");
        String fullName = req.getParameter("fullName");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String rePassWord = req.getParameter("rePassWord");
        String address = req.getParameter("address");

        int id = userDAO.findBiggestId() + 1;


        User user = new User(id, userName, passWord, fullName, phone, email, address);
        userDAO.insert(user);
        req.getRequestDispatcher("WEB-INF/signUpForm.jsp").forward(req, resp);
    }

    private void showSignUpView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/signUpForm.jsp").forward(req, resp);
    }


    private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String passWord = req.getParameter("passWord");
        req.getRequestDispatcher("WEB-INF/index.jsp").forward(req, resp);
    }

    protected void showLoginView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/index.jsp").forward(req, resp);
    }

    protected String getAction(HttpServletRequest req) {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        return action;
    }
}