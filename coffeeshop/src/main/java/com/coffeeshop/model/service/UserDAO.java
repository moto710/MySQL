package com.coffeeshop.model.service;

import com.coffeeshop.model.User;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends RootDAO implements IDAO<User> {
    private static final String SELECT_ALL_USERS = "SELECT * FROM `users`;";
    private static final String INSERT_USERS = "INSERT INTO `users` (`id`, `userName`, `passWord`, `fullName`, `phone`, `email`, `address`) VALUES (?, ?, ?, ?, ?, ?, ?);";
    private static final String FIND_BY_ID = "SELECT * FROM users WHERE id = ?;";
    private static final String DELETE_USERS_BY_ID = "DELETE FROM `users` WHERE `id` = ?;";
    private static final String UPDATE_USERS = "UPDATE users SET `userName` = ?, passWord = ?, fullName = ?, phone = ?, email = ?, address = ? WHERE `id` = ?;";
    private static final String FIND_MAX_ID = "SELECT MAX(`id`) AS id FROM users;";
    private static final String PAGINATION = "select SQL_CALC_FOUND_ROWS * from `users` limit ?, ?;";
    private User user;
    private List<User> userList;
    public int noOfRecords;

    public int getNoOfRecords() {
        return this.noOfRecords;
    }

    public void setNoOfRecords(int noOfRecords) {
        this.noOfRecords = noOfRecords;
    }

    public List<User> paginationView(int offset, int noOfRecords) {
        userList = new ArrayList<>();
        try {
            preparedStatement = startConnect(PAGINATION);
            preparedStatement.setInt(1, offset);
            preparedStatement.setInt(2, noOfRecords);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String userName = rs.getString("userName");
                String passWord = rs.getString("passWord");
                String fullName = rs.getString("fullName");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String address = rs.getString("address");
                userList.add(new User(id, userName, passWord, fullName, phone, email, address));
            }
            preparedStatement = connection.prepareStatement("SELECT FOUND_ROWS() AS numrow");
            rs = preparedStatement.executeQuery();
            if (rs.next()) {
                setNoOfRecords(rs.getInt("numrow"));
            }
            closeConnect();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return userList;
    }
    public String findPW(String userName, String email, String phone) {
        userList = selectAll();
        for (User user : userList) {
            if (user.getUserName().equals(userName) && user.getEmail().equals(email) && user.getPhone().equals(phone)) {
                return user.getPassWord();
            }
        }
        return null;
    }

    @Override
    public int findBiggestId() {
        int max = -1;
        try {
            preparedStatement = startConnect(FIND_MAX_ID);
            rs = preparedStatement.executeQuery();
            if (rs.next()) {
                max = rs.getInt("id");
            }
            closeConnect();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return max;
    }

    @Override
    public void insert(User user) {
        try {
            preparedStatement = startConnect(INSERT_USERS);
            preparedStatement.setInt(1, user.getId());
            preparedStatement.setString(2, user.getUserName());
            preparedStatement.setString(3, user.getPassWord());
            preparedStatement.setString(4, user.getFullName());
            preparedStatement.setString(5, user.getPhone());
            preparedStatement.setString(6, user.getEmail());
            preparedStatement.setString(7, user.getAddress());
            preparedStatement.executeUpdate();
            closeConnect();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public User select(int id) {
        try {
            preparedStatement = startConnect(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String userName = rs.getString("userName");
                String passWord = rs.getString("passWord");
                String fullName = rs.getString("fullName");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String address = rs.getString("address");
                user = new User(id, userName, passWord, fullName, phone, email, address);
            }
            closeConnect();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    @Override
    public List<User> selectAll() {
        userList = new ArrayList<>();
        try {
            preparedStatement = startConnect(SELECT_ALL_USERS);
            rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String userName = rs.getString("userName");
                String passWord = rs.getString("passWord");
                String fullName = rs.getString("fullName");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String address = rs.getString("address");

                userList.add(new User(id, userName, passWord, fullName, phone, email, address));
            }
            closeConnect();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return userList;
    }

    @Override
    public boolean delete(int id) {
        boolean rowDeleted = false;
        try {
            preparedStatement = startConnect(DELETE_USERS_BY_ID);
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
            closeConnect();
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
        return rowDeleted;
    }

    @Override
    public boolean update(User user) {
        boolean rowUpdated;
        try {
            preparedStatement = startConnect(UPDATE_USERS);
            preparedStatement.setInt(7, user.getId());
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getPassWord());
            preparedStatement.setString(3, user.getFullName());
            preparedStatement.setString(4, user.getPhone());
            preparedStatement.setString(5, user.getEmail());
            preparedStatement.setString(6, user.getAddress());
            rowUpdated = preparedStatement.executeUpdate() > 0;
            closeConnect();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowUpdated;
    }
}
