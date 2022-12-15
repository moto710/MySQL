package com.coffeeshop.model.service;

import com.coffeeshop.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IDAO<T> {
    void insert(T t);
    T select(int id);
    List<T> selectAll();
    boolean delete(int id) throws SQLException;
    boolean update(T t);
    int findBiggestId();
}
