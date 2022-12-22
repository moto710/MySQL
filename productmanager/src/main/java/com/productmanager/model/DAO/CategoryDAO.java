package com.productmanager.model.DAO;

import com.productmanager.model.Category;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


public class CountryDAO extends RootDAO implements IDAO{
    private static final String FIND_MAX_ID = "SELECT MAX(`id`) AS id FROM category;";
    @Override
    public void insert(Object o) {

    }

    @Override
    public Object select(int id) {
        return null;
    }

    @Override
    public List selectAll() {
        return null;
    }
    public Category getCategoryFromRS(ResultSet resultSet) throws SQLException {
        int id = rs.getInt("id");
        String name = rs.getString("name");
        return new Category(id, name);
    }

    @Override
    public boolean delete(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean update(Object o) {
        return false;
    }

    @Override
    public int findMaxId() {
        try {
            preparedStatement = startConnect(FIND_MAX_ID);
            rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
            System.out.println(this.getClass() + " findBiggestId: " + preparedStatement);
            closeConnect();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return -1;
    }
}
