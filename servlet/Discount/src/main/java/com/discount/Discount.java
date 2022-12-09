package com.discount;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "Discount", value = "/discount")
public class Discount extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String productName = request.getParameter("name");
        float price = Float.parseFloat(request.getParameter("price"));
        float rate = Float.parseFloat(request.getParameter("rate"))/100;

        float newPrice = price*(1 - rate);
        float discount = price*rate;

        request.setAttribute("name", productName);
        request.setAttribute("discount", discount);
        request.setAttribute("newPrice", newPrice);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/display-discount.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}