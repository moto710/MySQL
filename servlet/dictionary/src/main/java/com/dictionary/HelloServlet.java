package com.dictionary;

import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/dictionary")
public class HelloServlet extends HttpServlet {
    private final Map<String, String> map = new HashMap<>();

    @Override
    public void init() throws ServletException {
        map.put("hello", "Hi");
        map.put("world", "tg");
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String word = req.getParameter("input");
        String result = map.get(word);

        Set<String> set = map.keySet();

        req.setAttribute("kq", result);
        req.setAttribute("keys", set);

        String method = req.getMethod();
        req.setAttribute("method", method);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(req, resp);
    }
}