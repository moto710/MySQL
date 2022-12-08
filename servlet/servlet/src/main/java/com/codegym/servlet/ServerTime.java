package com.codegym.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.Instant;
import java.util.Date;

@WebServlet(value = "/time-now")
public class ServerTime extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter pw = resp.getWriter();
        Date time = new Date();
        Instant now = Instant.now();
        pw.println("<html><body>");
        pw.println("<h1>Time now Date: " + time + "</h1>");
        pw.println("<h1>Time now Instant: " + now + "</h1>");
        pw.println("</body></html>");
    }
}
