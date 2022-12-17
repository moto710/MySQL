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
            case "dashboard":
                showDashboardView(req, resp);
            break;
            case "manager":
                showUserManagerView(req, resp);
                break;
            case "edit":
                showEditView(req, resp);
                break;
            case "remove":
                showRemoveView(req, resp);
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
            case "edit":
                editUser(req, resp);
                break;
            case "remove":
                removeUser(req, resp);
                break;
            default:
                showLoginView(req, resp);
                break;
        }
    }



    private void removeUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        int id = Integer.parseInt(req.getParameter("id"));
//        userList = userDAO.selectAll();
//        userList.remove(userDAO.select(id));
//        req.getRequestDispatcher("WEB-INF/index/mainJsp/delete.jsp").forward(req, resp);
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
        String address = req.getParameter("address");
        userDAO.update(new User(id, userName, passWord, fullName, phone, email, address));
        String msg = "Change your infomation success!";
        req.setAttribute("msg", msg);
        req.getRequestDispatcher("WEB-INF/index/mainJsp/edit.jsp").forward(req,resp);
    }

    private void showEditView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        User user = userDAO.select(id);
        req.setAttribute("user", user);
        req.getRequestDispatcher("WEB-INF/index/mainJsp/edit.jsp").forward(req,resp);
    }

    private void userManager(HttpServletRequest req, HttpServletResponse resp) {
    }

    private void showUserManagerView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int page = 1;
        int recordsPerPage = 5;
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
            userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage);
            int noOfRecords = userDAO.getNoOfRecords();
            int noOfPages = (int)Math.ceil(noOfRecords * 1.0/recordsPerPage);
            req.setAttribute("userList", userList);
            req.setAttribute("noOfPages", noOfPages);
            req.setAttribute("currentPage", page);
            req.getRequestDispatcher("WEB-INF/index/mainJsp/userManager.jsp").forward(req, resp);
        }
//        userList = userDAO.selectAll();
//        req.setAttribute("userList", userList);
//        req.getRequestDispatcher("WEB-INF/index/mainJsp/userManager.jsp").forward(req, resp);
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