package com.coffeeshop.controller;

import com.coffeeshop.model.Country;
import com.coffeeshop.model.service.CountryDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/country")
public class CountryServlet extends HttpServlet {
    private CountryDAO countryDAO = new CountryDAO();
    private Country country;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String country = req.getParameter("country");
//        req.getRequestDispatcher("/WEB-INF/index/mainJsp/countryJsp/create.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String name = req.getParameter("name");
//        int id = countryDAO.findBiggestId();
//        country = new Country(id, name);
//        req.getRequestDispatcher("/WEB-INF/index/mainJsp/countryJsp/create.jsp").forward(req, resp);
    }
}
