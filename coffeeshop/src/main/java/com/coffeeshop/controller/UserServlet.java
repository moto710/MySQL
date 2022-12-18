package com.coffeeshop.controller;

import com.coffeeshop.model.Product;
import com.coffeeshop.model.User;
import com.coffeeshop.model.service.ProductDAO;
import com.coffeeshop.model.service.UserDAO;

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
    private User user;
    private static final long serialVersionUID = 1L;
    private int page;
    private int recordsPerPage;

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
            case "edit":
                editUser(req, resp);
                break;
            default:
                showLoginView(req, resp);
                break;
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
        String address = req.getParameter("address");
        userDAO.update(new User(id, userName, passWord, fullName, phone, email, address));
        String msg = "Change your information success!";
        req.setAttribute("msg", msg);
        req.getRequestDispatcher("WEB-INF/index/mainJsp/edit.jsp").forward(req, resp);
    }

    private void showEditView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        user = userDAO.select(id);
        req.setAttribute("user", user);
        req.getRequestDispatcher("WEB-INF/index/mainJsp/edit.jsp").forward(req, resp);
    }

    private void showUserManagerView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        page = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
        recordsPerPage = req.getParameter("recordsPerPage") == null ? 5 : Integer.parseInt(req.getParameter("recordsPerPage"));


        String sort = req.getParameter("sort") == null ? "idAsc" : req.getParameter("sort");

        switch (sort) {
            case "idAsc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, userDAO.SORT_ID_ASC_PAGINATION);
                break;
            case "idDesc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, userDAO.SORT_ID_DESC_PAGINATION);
                break;
            case "userNameAsc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, userDAO.SORT_USER_NAME_ASC_PAGINATION);
                break;
            case "userNameDesc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, userDAO.SORT_USER_NAME_DESC_PAGINATION);
                break;
            case "passWordAsc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, userDAO.SORT_PASSWORD_ASC_PAGINATION);
                break;
            case "passWordDesc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, userDAO.SORT_PASSWORD_DESC_PAGINATION);
                break;
            case "fullNameAsc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, userDAO.SORT_NAME_ASC_PAGINATION);
                break;
            case "fullNameDesc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, userDAO.SORT_NAME_DESC_PAGINATION);
                break;
            case "phoneAsc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, userDAO.SORT_PHONE_ASC_PAGINATION);
                break;
            case "phoneDesc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, userDAO.SORT_PHONE_DESC_PAGINATION);
                break;
            case "emailAsc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, userDAO.SORT_EMAIL_ASC_PAGINATION);
                break;
            case "emailDesc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, userDAO.SORT_EMAIL_DESC_PAGINATION);
                break;
            case "addressAsc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, userDAO.SORT_ADDRESS_ASC_PAGINATION);
                break;
            case "addressDesc":
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, userDAO.SORT_ADDRESS_DESC_PAGINATION);
                break;
            default:
                userList = userDAO.paginationView((page - 1) * recordsPerPage, recordsPerPage, userDAO.SORT_ID_ASC_PAGINATION);
                break;
        }
        int noOfRecords = userDAO.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
        req.setAttribute("userList", userList);
        req.setAttribute("noOfPages", noOfPages);
        req.setAttribute("currentPage", page);
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
        Set<String> errors = new HashSet<>();
        userList = userDAO.selectAll();
        int id = userDAO.findBiggestId() + 1;
        String userName = req.getParameter("userName");
        for (User u : userList) {
            if (u.getUserName().equals(userName)) {
                errors.add("Your username had been registered! Please choose another one!");
                break;
            }
        }
        String passWord = req.getParameter("passWord");
        String fullName = req.getParameter("fullName");
        String phone = req.getParameter("phone");
        for (User u : userList) {
            if (u.getPhone().equals(phone)) {
                errors.add("Your phone had been registered! Please choose another one!");
            }
        }
        String email = req.getParameter("email");
        String rePassWord = req.getParameter("rePassWord");
        if (!passWord.equals(rePassWord)) {
            errors.add("Password does not match!");
        }
        String address = req.getParameter("address");
        user = new User(id, userName, passWord, fullName, phone, email, address);
        userDAO.insert(user);
        if (errors.isEmpty()) {
            req.getRequestDispatcher("WEB-INF/index/mainJsp/signUpForm.jsp").forward(req, resp);
        } else {
            req.setAttribute("errors", errors);
            req.setAttribute("user", user);
            req.getRequestDispatcher("WEB-INF/index/mainJsp/edit.jsp").forward(req, resp);
        }
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