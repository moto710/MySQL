package com.coffeeshop.controller;

import com.coffeeshop.model.Country;
import com.coffeeshop.model.service.CountryDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/country")
public class CountryServlet extends HttpServlet {
    private CountryDAO countryDAO = new CountryDAO();
    private Country country;
    public String message;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String addCountry = getAddCountry(req);
        if (addCountry.equals("add")) {
            req.getRequestDispatcher("/WEB-INF/index/mainJsp/countryJsp/create.jsp").forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        int id = countryDAO.findBiggestId() + 1;
        countryDAO.insert(new Country(id, name));
        String message = "Add country success!";
        HttpSession session = req.getSession();
        session.setAttribute("message", message);
        resp.sendRedirect("/home?action=signUp");
//        req.getRequestDispatcher("/WEB-INF/index/mainJsp/countryJsp/create.jsp").forward(req, resp);
    }

    private String getAddCountry(HttpServletRequest req) {
        return req.getParameter("addCountry") == null ? "" : req.getParameter("addCountry");
    }
}
