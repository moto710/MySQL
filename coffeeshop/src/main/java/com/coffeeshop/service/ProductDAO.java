package com.coffeeshop.service;

import com.coffeeshop.model.Product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends RootDAO implements IDAO<Product> {
    private static final String INSERT_PRODUCT = "INSERT INTO `product` VALUES (?, ?, ?, ?, ?);";
    private static final String UPDATE_PRODUCT = "UPDATE `product` SET `name` = ?, `quantity` = ?, `price` = ?, `supplier` = ? WHERE `id` = ?;";
    private static final String DELETE_PRODUCT_BY_ID = "DELETE FROM `product` WHERE ID = ?;";
    private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM `product`;";
    private static final String FIND_BY_ID = "SELECT * FROM `product` WHERE id = ?;";
    private static final String FIND_MAX_ID = "SELECT MAX(`id`) FROM `product`;";
    private Product product;
    List<Product> productList;

    @Override
    public int findBiggestId() {
        try {
            preparedStatement = startConnect(FIND_MAX_ID);
            rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return -1;
    }

    @Override
    public Product select(int id) {
        try {
            preparedStatement = startConnect(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                int IdSupplier = Integer.parseInt(rs.getString("supplier"));
                product = new Product(id, name, quantity, price, IdSupplier);
            }
            closeConnect();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return product;
    }

    @Override
    public List<Product> selectAll() {
        productList = new ArrayList<>();
        try {
            preparedStatement = startConnect(SELECT_ALL_PRODUCTS);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                productList.add(getProductFromRS(rs));
            }
            closeConnect();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return productList;
    }

    public Product getProductFromRS(ResultSet resultSet) throws SQLException {
        int id = rs.getInt("id");
        String name = rs.getString("name");
        int quantity = rs.getInt("quantity");
        double price = rs.getDouble("price");
        int IdSupplier = Integer.parseInt(rs.getString("IdSupplier"));
        return new Product(id, name, quantity, price, IdSupplier);
    }

    @Override
    public boolean delete(int id) {
        boolean rowDeleted = false;
        try {
            preparedStatement = startConnect(DELETE_PRODUCT_BY_ID);
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
            closeConnect();
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
        return rowDeleted;
    }

    @Override
    public boolean update(Product product) {
        boolean rowUpdate = false;
        try {
            preparedStatement = startConnect(UPDATE_PRODUCT);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setInt(2, product.getQuantity());
            preparedStatement.setDouble(3, product.getPrice());
            preparedStatement.setInt(4, product.getIdSupplier());
            rowUpdate = preparedStatement.executeUpdate() > 0;
            closeConnect();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowUpdate;
    }

    @Override
    public void insert(Product product) {
        try {
            preparedStatement = startConnect(INSERT_PRODUCT);
            preparedStatement.setInt(1, product.getId());
            preparedStatement.setString(2, product.getName());
            preparedStatement.setInt(3, product.getQuantity());
            preparedStatement.setDouble(4, product.getPrice());
            preparedStatement.setInt(5, product.getIdSupplier());
            preparedStatement.executeUpdate();
            closeConnect();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }
}
