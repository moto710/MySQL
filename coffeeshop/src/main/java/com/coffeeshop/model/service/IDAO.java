package com.coffeeshop.model.service;

import java.util.List;

public interface IDAO<T> {
    void insert(T t);

    List<T> selectAll();

    boolean update(T t);
}
