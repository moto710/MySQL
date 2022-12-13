package com.customermanager.service;

import com.customermanager.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerService implements IService<Customer>{
    private List<Customer> customerList;

    public CustomerService() {
        customerList = new ArrayList<>();
        customerList.add(new Customer(1, "Dang Van Quang", "28 NTP", 1));
        customerList.add(new Customer(2, "Dang Van Quý", "28 NTP", 2));
        customerList.add(new Customer(3, "Nguyen Quoc Cuong", "28 NTP", 3));
        customerList.add(new Customer(4, "Thuc Nguyen", "28 NTP", 4));
        customerList.add(new Customer(5, "Tan Dung", "28 NTP", 5));
    }

    @Override
    public List<Customer> getAll() {
        return this.customerList;
    }

    @Override
    public void add(Customer customer) {
        customerList.add(customer);
    }

    @Override
    public Customer findById(int id) {
        for (Customer item : customerList) {
            if (item.getId() == id)
                return item;
        }
        return null;
    }

    @Override
    public void update(Customer customer) {
        for (Customer item : customerList) {
            if (item.getId() == customer.getId()) {
                item.setFullName(customer.getFullName());
                item.setAddress(customer.getAddress());
                item.setIdCountry(customer.getIdCountry());
            }
        }
    }

    @Override
    public void delete(int id) {
        customerList.remove(findById(id));
    }
    @Override
    public void delete(Customer customer) {
        customerList.remove(customer);
    }
}
