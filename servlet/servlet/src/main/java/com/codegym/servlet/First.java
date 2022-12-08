package com.codegym.servlet;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class First extends HttpServlet implements Servlet {
    ServletConfig config = null;

    public void init(ServletConfig config){
        this.config = config;
        System.out.println("servlet is initialized");
    }
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter pr = res.getWriter();
        pr.println("Hello simple servlet");
        pr.close();
    }
    public void destroy(){
        System.out.println("servlet is destroyed");
    }

    public ServletConfig getServletConfig() {
        return config;
    }

    public String getServletInfo() {
        return "2022";
    }
    public static void main(String[] args) {
        First first = new First();
        first.getServletConfig();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter pw = resp.getWriter();
        pw.println("<h1>test test test</h1>");
        pw.close();
    }
}
