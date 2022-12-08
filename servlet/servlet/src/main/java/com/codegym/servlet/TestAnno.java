package com.codegym.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "test Request", value="/test-request")
public class TestAnno extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter printWriter = resp.getWriter();
        printWriter.println("<html><body>");
        printWriter.println("<p>Method: " + req.getMethod() + "</p>");
        printWriter.println("<p>Type: " + req.getContentType() + "</p>");
        printWriter.println("<p>Path: " + req.getContextPath() + "</p>");
        printWriter.println("<p>Info: " + req.getPathInfo() + "</p>");
        printWriter.println("</body></html>");
        printWriter.close();
    }
}
