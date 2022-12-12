package com.customermanager.controller;

import com.customermanager.model.Customer;
import com.customermanager.service.ApplicationException;
import com.customermanager.service.CustomerDAO;
import com.customermanager.service.CustomerService;

import javax.activation.DataSource;
import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer-path")
public class CustomerServlet extends HttpServlet {
    private final CustomerService customerService = new CustomerService();
    private RequestDispatcher requestDispatcher;

//    @Resource(name = "jdbc/testDB")
//    DataSource ds;

    @Override
    public void init() throws ServletException {
//        customerService = new CustomerService();
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
                editCustomer(req, resp);
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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                addCustomer(req, resp);
                break;
            case "edit":
                editCustomer(req, resp);
                break;
            case "remove":
                removeCustomer(req, resp);
                break;
            default:
                showAllCustomers(req, resp);
                break;
        }

        req.setAttribute("customerList", customerService.showAllCustomers());
        req.getRequestDispatcher("customer.jsp").forward(req, resp);
    }

    private void removeCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long id = Long.parseLong(req.getParameter("id"));
        customerService.removeCustomer(id);

        req.getRequestDispatcher("remove.jsp").forward(req, resp);
    }

    private void editCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long id = Long.parseLong(req.getParameter("id"));
        Customer customerId = customerService.findCustomerById(id);

        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String country = req.getParameter("country");


        customerId.setFullName(name);
        customerId.setAddress(address);
        customerId.setCountry(country);
        customerService.editCustomer(customerId);

        req.setAttribute("idc", id);
        req.setAttribute("customerId", customerId);
        req.getRequestDispatcher("edit.jsp").forward(req, resp);
    }

    private void addCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String country = req.getParameter("country");
        long id = customerService.showAllCustomers().size() + 1;

        Customer customer = new Customer(id, name, address, country);

//        CustomerDAO customerDAO = new CustomerDAO(ds);
//        int rows;
//        int success = 0;
//        try {
//            rows = customerDAO.addCustomer(customer);
//            if (rows > 0) {
//                success = 1;
//            }
//        } catch (ApplicationException a) {
//            req.setAttribute("error", a.getMessage());
//        }
//        resp.sendRedirect("displayCustomer.do?s=" + success);

        customerService.addCustomer(customer);

        String method = req.getMethod();

        req.setAttribute("msg", "Add new customer success!");
        req.setAttribute("method", method);

        requestDispatcher = req.getRequestDispatcher("create.jsp");
        requestDispatcher.forward(req, resp);
    }

    public void showAllCustomers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("customerList", customerService.showAllCustomers());
        req.getRequestDispatcher("customer.jsp").forward(req, resp);
    }
}
