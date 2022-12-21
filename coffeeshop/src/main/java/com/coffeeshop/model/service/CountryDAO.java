package com.coffeeshop.model.service;

import com.coffeeshop.model.Country;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CountryDAO extends RootDAO implements IDAO<Country> {
    private static final String FIND_MAX_ID = "SELECT MAX(`id`) AS id FROM country;";
    private static final String UPDATE_COUNTRY = "UPDATE country SET `name` = ? WHERE `id` = ?;";
    private static final String DELETE_COUNTRY_BY_ID = "DELETE FROM `country` WHERE `id` = ?;";
    private static final String SELECT_ALL_COUNTRIES = "SELECT * FROM `country`;";
    private static final String FIND_BY_ID = "SELECT * FROM country WHERE id = ?;";
    private static final String INSERT_COUNTRY = "INSERT INTO `country` VALUES (?, ?);";
    private static final String FIND_ID_BY_NAME = "SELECT country.id FROM country WHERE name LIKE ?;";
    private List<Country> countryList;

    public int findIdByName(String name) throws SQLException {
        preparedStatement = startConnect(FIND_ID_BY_NAME);
        preparedStatement.setString(1, "%" + name + "%");
        rs = preparedStatement.executeQuery();
        while (rs.next()) {
            return rs.getInt("id");
        }
        System.out.println(this.getClass() + " select: " + preparedStatement);
        closeConnect();
        return -1;
    }
    @Override
    public void insert(Country country) {
        try {
            preparedStatement = startConnect(INSERT_COUNTRY);
            preparedStatement.setInt(1, country.getId());
            preparedStatement.setString(2, country.getName());
            preparedStatement.executeUpdate();
            System.out.println(this.getClass() + " insert: " + preparedStatement);
            closeConnect();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public Country select(int id) {
        try {
            preparedStatement = startConnect(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                return new Country(id, name);
            }
            System.out.println(this.getClass() + " select: " + preparedStatement);
            closeConnect();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return null;
    }

    @Override
    public List<Country> selectAll() {
        countryList = new ArrayList<>();
        try {
            preparedStatement = startConnect(SELECT_ALL_COUNTRIES);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                countryList.add(getCountryFromRS(rs));
            }
            System.out.println(this.getClass() + " selectAll: " + preparedStatement);
            closeConnect();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return countryList;
    }
    public Country getCountryFromRS(ResultSet resultSet) throws SQLException {
        int id = rs.getInt("id");
        String name = rs.getString("name");
        return new Country(id, name);
    }
    @Override
    public boolean delete(int id) throws SQLException {
        boolean rowDeleted = false;
        try {
            preparedStatement = startConnect(DELETE_COUNTRY_BY_ID);
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
            System.out.println(this.getClass() + " delete: " + preparedStatement);
            closeConnect();
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
        return rowDeleted;
    }

    @Override
    public boolean update(Country country) {
        boolean rowUpdated;
        try {
            preparedStatement = startConnect(UPDATE_COUNTRY);
            preparedStatement.setString(1, country.getName());
            preparedStatement.setInt(2, country.getId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
            System.out.println(this.getClass() + " update: " + preparedStatement);
            closeConnect();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowUpdated;
    }

    @Override
    public int findBiggestId() {
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
