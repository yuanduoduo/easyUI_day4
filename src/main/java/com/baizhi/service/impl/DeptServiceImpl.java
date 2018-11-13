package com.baizhi.service.impl;

import com.baizhi.dao.DeptDao;
import com.baizhi.entity.Dept;
import com.baizhi.service.DeptService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class DeptServiceImpl implements DeptService {
    @Autowired
    private DeptDao daptDao;
    public void save(Dept dept) {
        dept.setId(UUID.randomUUID().toString());
        daptDao.save(dept);
    }
    public void update(Dept dept) {
        daptDao.update(dept);
    }
    public void delete(String id) {
        daptDao.delete(id);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public Dept queryOne(String id) {
        Dept dept = daptDao.queryOne(id);
        return dept;
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Dept> findAll() {
        List<Dept> daoAll = daptDao.findAll();
        return daoAll;
    }
    @Transactional(propagation = Propagation.SUPPORTS)
    public Long findTotals() {
        Long totals = daptDao.findTotals();
        return totals;
    }
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Dept> findByPage(@Param("start") Integer start,@Param("rows") Integer rows) {
        Integer context = (start - 1) * rows;
        List<Dept> deptList = daptDao.findByPage(context, rows);
        return deptList;
    }

}
