package com.usermanager.controller;

import com.usermanager.DAO.CountryDAO;
import com.usermanager.DAO.UserDAO;
import com.usermanager.Model.Country;
import com.usermanager.Model.User;

import java.io.*;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "UserServlet", value = {"/users", ""})
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = new UserDAO();
    private CountryDAO countryDAO = new CountryDAO();
    private List<User> userList = userDAO.selectAll();
    private List<Country> countryList = countryDAO.selectAll();
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
//        String action = req.getParameter("action");
//        if (action == null) {
//            action = "";
//        }
//        switch (action) {
//            case "create":
//                showUserList(req, resp);
//                break;
//            case "edit":
//                break;
//            case "delete":
//                break;
//            default:
//                break;
//        }
        req.getRequestDispatcher("WEB-INF/user/list.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String action = req.getParameter("action");
//        if (action == null) {
//            action = "";
//        }
//        switch (action) {
//            case "create":
//                break;
//            case "edit":
//                break;
//            case "delete":
//                break;
//            default:
//                break;
//        }
        req.getRequestDispatcher("WEB-INF/user/list.jsp").forward(req, resp);
    }
    private void showUserList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.setAttribute("userList", userList);
//        req.setAttribute("countryList", countryList);
//        req.getRequestDispatcher("WEB-INF/user/list.jsp").forward(req, resp);
    }
}