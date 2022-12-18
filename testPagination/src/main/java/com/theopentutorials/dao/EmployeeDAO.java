package com.theopentutorials;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {
    Connection connection;
    Statement stmt;
    private int noOfRecords;
    public EmployeeDAO() {
    }

    private static Connection getConnection() throws SQLException, ClassNotFoundException {
        return ConnectionFactory.getInstance().getConnection();
    }

    public List<Employee> viewAllEmployees(int offset, int noOfRecords) {
        String query = "select SQL_CALC_FOUND_ROWS * from employee limit " + offset + ", " + noOfRecords;
        List<Employee> list = new ArrayList<>();
        Employee employee;
        try {
            connection = getConnection();
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                employee = new Employee();
                employee.setEmployeeId(rs.getInt(1));
                employee.setEmployeeName(rs.getString(2));
                employee.setSalary(rs.getInt(3));
                employee.setDeptName(rs.getString(4));
                list.add(employee);
            }

            rs.close();
            rs = stmt.executeQuery("SELECT FOUND_ROWS()");

            if (rs.next())
                this.noOfRecords = rs.getInt(1);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public int getNoOfRecords() {
        return noOfRecords;
    }
}
