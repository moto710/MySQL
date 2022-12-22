package com.coffeeshop.controller;

import com.coffeeshop.model.service.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();
    public String message;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/index/mainJsp/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String passWord = req.getParameter("passWord");
        if (userDAO.checkLogin(userName, passWord)) {
            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("userName", userName);
            httpSession.setAttribute("passWord", passWord);
            resp.sendRedirect("/home");
        } else {
            message = "Can't find your account, try again!";
            req.setAttribute("message", message);
            req.getRequestDispatcher("WEB-INF/index/mainJsp/login.jsp").forward(req, resp);
        }
    }
}
