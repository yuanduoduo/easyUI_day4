package com.baizhi.service;

import com.baizhi.entity.Dept;

import java.util.List;

public interface DeptService {
    void save(Dept dept);

    void update(Dept dept);

    void delete(String id);

    Dept queryOne(String id);

    List<Dept> findAll();

    Long findTotals();

    List<Dept> findByPage(Integer start, Integer rows);
}
