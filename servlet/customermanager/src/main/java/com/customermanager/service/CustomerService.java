package com.customermanager.service;

import com.customermanager.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerService {
    private List<Customer> customerList;

    public CustomerService() {
        customerList = new ArrayList<>();
        customerList.add(new Customer(1L, "Dang Van Quang", "28 NTP", "Viet Nam"));
        customerList.add(new Customer(2L, "Dang Van Quý", "28 NTP", "Viet Nam"));
        customerList.add(new Customer(3L, "Nguyen Quoc Cuong", "28 NTP", "Viet Nam"));
        customerList.add(new Customer(4L, "Thuc Nguyen", "28 NTP", "Viet Nam"));
        customerList.add(new Customer(5L, "Tan Dung", "28 NTP", "Viet Nam"));
    }

    public void editCustomer(Customer customer) {
        for (Customer item : customerList) {
            if (item.getId() == customer.getId()) {
                item.setFullName(customer.getFullName());
                item.setAddress(customer.getAddress());
                item.setCountry(customer.getCountry());
            }
        }
    }

    public void addCustomer(Customer customer) {
        customerList.add(customer);
    }

    public Customer findCustomerById(long id) {
        for (Customer item : customerList) {
            if (item.getId() == id)
                return item;
        }
        return null;
    }

    public List<Customer> showAllCustomers() {
        return this.customerList;
    }
}
