package com.coffeeshop.controller;

import com.coffeeshop.model.Product;
import com.coffeeshop.model.User;
import com.coffeeshop.model.service.ProductDAO;
import com.coffeeshop.model.service.UserDAO;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet({"/home", ""})
public class UserServlet extends HttpServlet {
    private final UserDAO userDAO = new UserDAO();
    private final ProductDAO productDAO = new ProductDAO();
    private List<User> userList;
    private List<Product> productList;

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
            case "dashboard":
                showDashboardView(req, resp);
            break;
            case "manager":
                showUserManagerView(req, resp);
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
            case "manager":
                userManager(req, resp);
                break;
            default:
                showLoginView(req, resp);
                break;
        }
    }

    private void userManager(HttpServletRequest req, HttpServletResponse resp) {
    }

    private void showUserManagerView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        userList = userDAO.selectAll();
        req.setAttribute("userList", userList);
        req.getRequestDispatcher("WEB-INF/index/mainJsp/userManager.jsp").forward(req, resp);
    }
    private void showDashboardView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        productList = productDAO.selectAll();
        req.setAttribute("productList", productList);
        req.getRequestDispatcher("WEB-INF/index/mainJsp/dashboard.jsp").forward(req, resp);
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
        req.setAttribute("user", user);
        req.getRequestDispatcher("WEB-INF/index/mainJsp/signUpForm.jsp").forward(req, resp);
    }

    private void showSignUpView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/index/mainJsp/signUpForm.jsp").forward(req, resp);
    }


    private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        userList = userDAO.selectAll();
        String userName = req.getParameter("userName");
        String passWord = req.getParameter("passWord");
        User loginUser = null;
        for (User user : userList) {
            if (user.getUserName().equals(userName) && user.getPassWord().equals(passWord)) {
                loginUser = user;
                req.setAttribute("loginUser", loginUser);
                req.getRequestDispatcher("WEB-INF/index/mainJsp/dashboard.jsp").forward(req, resp);
                break;
            }
        }
        req.setAttribute("loginUser", loginUser);
        req.getRequestDispatcher("WEB-INF/index/mainJsp/index.jsp").forward(req, resp);
    }

    protected void showLoginView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/index/mainJsp/index.jsp").forward(req, resp);
    }

    protected String getAction(HttpServletRequest req) {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        return action;
    }
}