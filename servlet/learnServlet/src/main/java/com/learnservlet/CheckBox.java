package com.learnservlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class CheckBox extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("<ul>" +
                "<li>Toan: "+ req.getParameter("toan") +  "</li>" +
                "<li>Ly: " + req.getParameter("ly") + "</li>" +
                "<li>Hoa: " + req.getParameter("hoa") + "</li>" +
                "</ul>");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doGet(req, resp);
    }
}
