package com.customermanager.controller;

import com.customermanager.model.Customer;
import com.customermanager.service.CustomerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer-path")
public class CustomerServlet extends HttpServlet {
    private CustomerService customerService;
    private RequestDispatcher requestDispatcher;

    @Override
    public void init() throws ServletException {
        customerService = new CustomerService();
    }
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                addCustomer(req, resp);
                break;
            case "edit":
                break;
            case "remove":
                break;
            default:
                showAllCustomers(req, resp);
                break;
        }

        req.setAttribute("customerList", customerService.showAllCustomers());
        req.getRequestDispatcher("customer.jsp").forward(req, resp);
    }

    private void editCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long id = Long.parseLong(req.getParameter("id"));
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String country = req.getParameter("country");

        Customer customer = customerService.findCustomerById(id);
        customer.setFullName(name);
        customer.setAddress(address);
        customer.setCountry(country);
        customerService.editCustomer(customer);

        req.setAttribute("customerList", customerService.showAllCustomers());
        req.getRequestDispatcher("customer.jsp").forward(req, resp);
    }

    private void addCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String country = req.getParameter("country");
        long id = customerService.showAllCustomers().size() + 1;

        Customer customer = new Customer(id, name, address, country);
        customerService.addCustomer(customer);

        String method = req.getMethod();

        req.setAttribute("msg", "Add new customer success!");
        req.setAttribute("method", method);

//        resp.sendRedirect(req.getContextPath() + "/create.jsp");

        req.getRequestDispatcher("/create.jsp").forward(req, resp);
    }

    public void createNewCustomers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("create.jsp").forward(req, resp);
    }

    public void showAllCustomers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("customerList", customerService.showAllCustomers());
        req.getRequestDispatcher("customer.jsp").forward(req, resp);
    }
}
