package com.baizhi.test;

import com.baizhi.entity.Dept;
import com.baizhi.service.DeptService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

public class DeptServiceTest extends Basic {
    @Autowired
    private DeptService deptService;
    @Test
    public void test1(){
        List<Dept> depts = deptService.findAll();
        for (Dept dept : depts) {
            System.out.println(dept);
        }
    }
    @Test
    public void test2(){
        Dept dept = new Dept();
        dept.setNo("1998");
        dept.setName("yuanduo");
        dept.setNumber(13);
        dept.setCreateDate(new Date());
        deptService.save(dept);
    }
    @Test
    public void test3(){
        List<Dept> list = deptService.findByPage(1, 2);
        for (Dept dept : list) {
            System.out.println(dept);
        }
    }
    @Test
    public void test4(){
        Dept dept = deptService.queryOne("6b1abfbc-34de-49f3-b6e6-1cbdb61e2a67");
        System.out.println(dept);
    }
    @Test
    public void test5(){
        Dept dept = new Dept();
        dept.setId("6b1abfbc-34de-49f3-b6e6-1cbdb61e2a67");
        dept.setNo("2000");
        dept.setName("大麦部");
        dept.setNumber(13);
        dept.setCreateDate(new Date());
        deptService.update(dept);
    }
}
