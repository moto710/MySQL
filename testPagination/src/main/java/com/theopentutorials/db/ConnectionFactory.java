package com.theopentutorials;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
    private static final ConnectionFactory instance = new ConnectionFactory();

    String url = "jdbc:mysql://localhost:3306/employee";
    String user = "root";
    String password = "123456789";
    String driverClass = "com.mysql.jdbc.Driver";

    // private constructor
    private ConnectionFactory() {
        try {
            Class.forName(driverClass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static ConnectionFactory getInstance() {
        return instance;
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, user, password);
    }
}
