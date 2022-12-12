package com.customermanager.service;

import com.customermanager.model.Customer;

import javax.activation.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class CustomerDAO {
    DataSource ds;

    public CustomerDAO(DataSource ds) {
        this.ds = ds;
    }

//    public int addCustomer(Customer customer) throws ApplicationException {
//        Connection connection = null;
//        Statement stmt = null;
//        String query = "insert into customer(id, fullName, address, country) values('"
//                + customer.getId()
//                + customer.getFullName()
//                + "',"
//                + customer.getAddress()
//                + ",'" + customer.getCountry() + "')";
//
//        int row = -1;
//        try {
//            connection = ds.getConnection();
//            stmt = connection.createStatement();
//            row = stmt.executeUpdate(query);
//        } catch (SQLException e) {
//            ApplicationException exception = new ApplicationException(
//                    "Unable to insert data: " + e.getMessage(), e);
//            throw exception;
//        } finally {
//            DbUtil.close(stmt);
//            DbUtil.close(connection);
//        }
//        return row;
//    }
}
