package com.student.dao;

import com.student.model.Country;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CountryDAO extends DAO implements IDAO<Country> {

    private static final String INSERT_COUNTRY_SQL = "INSERT INTO country (id, name) VALUES (?, ?);";
    private static final String SELECT_COUNTRY_BY_ID = "select id, name from country where id =?";
    private static final String SELECT_ALL_COUNTRIES = "select * from country";
    private static final String DELETE_COUNTRY_SQL = "delete from country where id = ?;";
    private static final String UPDATE_COUNTRY_SQL = "update country set name= ? where id = ?;";

    public CountryDAO() {
    }

    public int getIdByName(String name) {
        for (Country country: selectAll()) {
            if (country.getName().equals(name)) {
                return country.getId();
            }
        }
        return -1;
    }

    @Override
    public void insert(Country country) throws SQLException {
        System.out.println(INSERT_COUNTRY_SQL);
        // try-with-resource statement will auto close the connection.
        try (
                Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_COUNTRY_SQL)) {
            preparedStatement.setString(1, country.getName());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public Country select(int id) {
        Country country = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_COUNTRY_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String name = rs.getString("name");
                country = new Country(id, name);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return country;
    }

    @Override
    public List<Country> selectAll() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List<Country> countryList = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_COUNTRIES);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                countryList.add(new Country(id, name));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return countryList;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_COUNTRY_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean update(Country country) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_COUNTRY_SQL);) {
            statement.setString(1, country.getName());
            statement.setInt(2, country.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

}