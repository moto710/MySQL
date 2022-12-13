package com.jdbc.dao;

import com.jdbc.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IDAO<T> {
    void insert(T t) throws SQLException;

    T select(int id);

    List<T> selectAll();

    boolean delete(int id) throws SQLException;

    boolean update(T t) throws SQLException;
}
