package com.customermanager.service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DisplayCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DisplayCustomerServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        int success = Integer.parseInt(request.getParameter("s"));
        if (success == 1) {
            request.setAttribute("result", "Customer Successfully Inserted");
        } else {
            request.setAttribute("result", "Customer Not Inserted: " + request.getAttribute("error"));
        }
        RequestDispatcher view = request.getRequestDispatcher("create.jsp");
        view.forward(request, response);
    }
}
