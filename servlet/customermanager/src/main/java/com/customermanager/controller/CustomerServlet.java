package com.customermanager.controller;

import com.customermanager.model.Customer;
import com.customermanager.service.CountryService;
import com.customermanager.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/customer-path", ""})
public class CustomerServlet extends HttpServlet {
    private CustomerService customerService;
    private CountryService countryService  = new CountryService();


    @Override
    public void init() throws ServletException {
        customerService = new CustomerService();
//        countryService = new CountryService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                addCustomer(req, resp);
                break;
            }
            case "edit":
                editCustomer(req, resp);
                break;
            default:
                break;
        }

        req.setAttribute("customerList", customerService.getAll());
        req.getRequestDispatcher("customer.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreateCustomer(req, resp);
                break;
            case "edit":
                showEditCustomer(req, resp);
                break;
            case "delete":
                showDeleteCustomer(req, resp);
                break;
            default:
                showAllCustomers(req, resp);
        }

        req.setAttribute("customerList", customerService.getAll());
        req.getRequestDispatcher("customer.jsp").forward(req, resp);
    }

    private void showDeleteCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        customerService.delete(id);

        req.setAttribute("customers", customerService.getAll());
        req.getRequestDispatcher("/customer.jsp").forward(req, resp);
    }

    private void showEditCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Customer customer = customerService.findById(id);
        req.setAttribute("customer", customer);
        req.getRequestDispatcher("edit.jsp").forward(req, resp);
    }

    private void showFormCreateCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("create.jsp").forward(req,resp);
    }

    private void editCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Customer customerId = customerService.findById(id);

        String name = req.getParameter("name");
        String address = req.getParameter("address");
        int idCountry = Integer.parseInt(req.getParameter("idCountry"));


        customerId.setFullName(name);
        customerId.setAddress(address);
        customerId.setIdCountry(idCountry);
        customerService.update(customerId);

        req.setAttribute("idc", id);
        req.setAttribute("customerId", customerId);
        req.getRequestDispatcher("edit.jsp").forward(req, resp);
    }

    private void addCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        int country = Integer.parseInt(req.getParameter("country"));
        int id = customerService.getAll().size() + 1;

        Customer customer = new Customer(id, name, address, country);

        customerService.add(customer);

        String method = req.getMethod();

        req.setAttribute("msg", "Add new customer success!");
        req.setAttribute("method", method);

        req.getRequestDispatcher("create.jsp").forward(req, resp);
    }

    public void showAllCustomers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("countryList", countryService.getAll());
        req.setAttribute("customerList", customerService.getAll());
        req.getRequestDispatcher("customer.jsp").forward(req, resp);
    }
}
