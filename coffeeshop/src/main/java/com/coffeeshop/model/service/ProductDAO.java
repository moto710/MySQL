package com.coffeeshop.model.service;

import com.coffeeshop.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends RootDAO implements IDAO<Product> {


    private static final String INSERT_PRODUCT = "INSERT INTO `product` (`id`, `name`, `quantity`, `price`, `supplier`) VALUES (?, ?, ?, ?, ?);";
    private static final String UPDATE_PRODUCT = "UPDATE `product` SET `name` = ?, `quantity` = ?, `price` = ?, `supplier` = ? WHERE `id` = ?;";
    private static final String DELETE_PRODUCT_BY_ID = "DELETE FROM `product` WHERE ID = ?;";
    private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM `product`;";
    private static final String FIND_BY_ID = "SELECT * FROM `product` WHERE id = ?;";
    private static final String FIND_MAX_ID = "SELECT MAX(`id`) AS id FROM `product`;";

    @Override
    public int findBiggestId() {
        int max = -1;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_MAX_ID);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                max = rs.getInt("id");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return max;
    }
    @Override
    public Product select(int id) {
        Product product = null;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                String supplier = rs.getString("supplier");
                product = new Product(id, name, quantity, price, supplier);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return product;
    }

    @Override
    public List<Product> selectAll() {
        List<Product> productList = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                String supplier = rs.getString("supplier");
                productList.add(new Product(id, name, quantity, price, supplier));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return productList;
    }


    @Override
    public boolean delete(int id){
        boolean rowDeleted = false;
        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCT_BY_ID);
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
        return rowDeleted;
    }

    @Override
    public boolean update(Product product) {  //`name` = ?, `quantity` = ?, `price` = ?, `supplier` = ? WHERE `id` = ?
        boolean rowUpdate = false;
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setInt(2, product.getQuantity());
            preparedStatement.setDouble(3, product.getPrice());
            preparedStatement.setString(4, product.getSupplier());
            rowUpdate = preparedStatement.executeUpdate() > 0;
            preparedStatement.close();
        }catch (SQLException e){
            printSQLException(e);
        }
        return rowUpdate;
    }
    @Override
    public void insert(Product product) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT);
            preparedStatement.setInt(1, product.getId());
            preparedStatement.setString(2, product.getName());
            preparedStatement.setInt(3, product.getQuantity());
            preparedStatement.setDouble(4, product.getPrice());
            preparedStatement.setString(5, product.getSupplier());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }
}
