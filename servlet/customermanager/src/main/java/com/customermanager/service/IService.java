package com.customermanager.service;

import java.util.List;

public interface IService<T> {
    List<T> getAll();
    void add(T t);
    T findById(int id);
    void update(T t);
    void delete(int id);
    void delete(T t);
}
