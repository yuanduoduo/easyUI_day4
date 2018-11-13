package com.baizhi.service.impl;

import com.baizhi.dao.EmpDao;
import com.baizhi.entity.Emp;
import com.baizhi.service.EmpService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class EmpServiceImpl implements EmpService<Emp> {
    @Autowired
    private EmpDao empDao;
    public void save(Emp emp) {
        emp.setId(UUID.randomUUID().toString());
        empDao.save(emp);
    }
    public void update(Emp emp) {
        empDao.update(emp);
    }
    public void delete(String id) {
        empDao.delete(id);
    }
    @Transactional(propagation = Propagation.SUPPORTS)
    public Emp queryOne(String id) {
        Emp emp = empDao.queryOne(id);
        return emp;
    }
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Emp> findAll() {
        List<Emp> empList = empDao.findAll();
        return empList;
    }
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Emp> findByPage(@Param("start") Integer start,@Param("rows") Integer rows) {
        Integer context = (start - 1) * rows;
        List<Emp> empList = empDao.findByPage(context, rows);
        return empList;
    }
    @Transactional(propagation = Propagation.SUPPORTS)
    public Long findTotals() {
        Long totals = empDao.findTotals();
        return totals;
    }
}
