package com.codegym.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(value = "/hello-form")
public class HelloForm extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        PrintWriter pw = resp.getWriter();

        pw.println("<html>" +
                "<ul>" +
                "<li>First Name: " + req.getParameter("fname") + "</li>" +
                "<li>Last Name: " + req.getParameter("lname") + "</li>" +
                "</html>"
        );
        pw.close();
    }
}
