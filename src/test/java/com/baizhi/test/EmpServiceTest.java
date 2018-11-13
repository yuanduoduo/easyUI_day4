package com.baizhi.test;

import com.baizhi.entity.Emp;
import com.baizhi.service.EmpService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:spring.xml")
public class EmpServiceTest{
    @Autowired
    private EmpService empService;
    @Test
    public void test1(){
        Emp emp = new Emp();
        emp.setName("xiaobai");
        emp.setAge(21);
        emp.setBir(new Date());
        emp.setSex("女");
        emp.setAddress("北京中关村");
        empService.save(emp);
    }
    @Test
    public void test2(){
        Emp emp = new Emp();
        emp.setId("da50a54c-50bc-41ea-af53-6e80fe7b3a52");
        emp.setName("yuanduo");
        emp.setAge(21);
        emp.setBir(new Date());
        emp.setSex("男");
        emp.setAddress("北京中关村");
        empService.update(emp);
    }
    @Test
    public void test3(){
        empService.delete("3d8b0efa-bce8-4b04-97e2-7136247c8c31");
    }
    @Test
    public void test4(){
        List<Emp> emps = empService.findAll();
        for (Emp emp : emps) {
            System.out.println(emp);
        }
    }
    @Test
    public void test5(){
        List<Emp> list = empService.findByPage(1, 2);
        for (Emp emp : list) {
            System.out.println(emp);
        }
    }
    @Test
    public void test6(){
        Long totals = empService.findTotals();
        System.out.println(totals);
    }


}
