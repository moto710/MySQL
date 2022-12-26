package com.coffeeshop.service;

import com.coffeeshop.model.Supplier;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class SupplierDAO extends RootDAO implements IDAO<Supplier> {
    private static final String FIND_MAX_ID = "SELECT MAX(`id`) FROM supplier;";
    private static final String UPDATE_SUPPLIER = "UPDATE supplier SET `name` = ?, address = ?, phone = ? WHERE `id` = ?;";
    private static final String DELETE_SUPPLIER_BY_ID = "DELETE FROM `supplier` WHERE `id` = ?;";
    private static final String FIND_BY_ID = "SELECT * FROM supplier WHERE id = ?;";
    private static final String SELECT_ALL_SUPPLIER = "SELECT `id` FROM `supplier`;";
    private static final String INSERT_SUPPLIER = "INSERT INTO `supplier` VALUES (?, ?, ?, ?);";
    List<Supplier> supplierList;

    @Override
    public void insert(Supplier supplier) {
        try {
            preparedStatement = startConnect(INSERT_SUPPLIER);
            preparedStatement.setInt(1, supplier.getId());
            preparedStatement.setString(2, supplier.getName());
            preparedStatement.setString(3, supplier.getAddress());
            preparedStatement.setString(4, supplier.getPhone());
            preparedStatement.executeUpdate();
            closeConnect();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }
    public Supplier getSupplierFromRS(ResultSet resultSet) throws SQLException {
        int id = rs.getInt("id");
        String name = rs.getString("name");
        String address = rs.getString("address");
        String phone = rs.getString("phone");
        return new Supplier(id, name, address, phone);
    }

    @Override
    public Supplier select(int id) {
        try {
            preparedStatement = startConnect(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
              return getSupplierFromRS(rs);
            }
            closeConnect();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return null;
    }

    @Override
    public List<Supplier> selectAll() {
        supplierList = new ArrayList<>();
        try {
            preparedStatement = startConnect(SELECT_ALL_SUPPLIER);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                supplierList.add(select(id));
            }
            closeConnect();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return supplierList;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        boolean rowDeleted = false;
        try {
            preparedStatement = startConnect(DELETE_SUPPLIER_BY_ID);
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
            closeConnect();
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
        return rowDeleted;
    }

    @Override
    public boolean update(Supplier supplier) {
        boolean rowUpdate = false;
        try {
            preparedStatement = startConnect(UPDATE_SUPPLIER);
            preparedStatement.setString(1, supplier.getName());
            preparedStatement.setString(2, supplier.getAddress());
            preparedStatement.setString(3, supplier.getPhone());
            preparedStatement.setInt(4, supplier.getId());
            rowUpdate = preparedStatement.executeUpdate() > 0;
            closeConnect();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowUpdate;
    }

    @Override
    public int findBiggestId() {
        try {
            preparedStatement = startConnect(FIND_MAX_ID);
            rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
            closeConnect();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return -1;
    }
}
