package com.baizhi.controller;

import com.baizhi.entity.Emp;
import com.baizhi.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/emp")
public class EmpController {

    @Autowired
    private EmpService empService;

    @RequestMapping("/findAll")
    public @ResponseBody Map<String,Object> findAll(Integer page, Integer rows){
        HashMap<String, Object> map = new HashMap<>();
        List<Emp> list = empService.findByPage(page, rows);
        Long totals = empService.findTotals();
        map.put("total",totals);
        map.put("rows",list);
        return map;
    }
    @RequestMapping("/save")
    public @ResponseBody Map<String,Object> save(Emp emp){
        Map<String, Object> results = new HashMap();
        try {
            Date bir = emp.getBir();
            Calendar c = Calendar.getInstance();
            c.setTime(bir);
            c.add(Calendar.DAY_OF_MONTH, 1);
            bir = c.getTime();
            emp.setBir(bir);
            empService.save(emp);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }
    @RequestMapping("/delete")
    public @ResponseBody Map<String,Object> delete(String id,String[] ids){
        Map<String, Object> results = new HashMap();
        try{
            if(ids==null) {
                empService.delete(id);

            }else{
                for (String s : ids) {
                    empService.delete(s);

                }
            }
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }
    @RequestMapping("/update")
    public @ResponseBody Map<String,Object> update(Emp emp){
        Map<String, Object> results = new HashMap();
        try{
            empService.update(emp);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }
    @RequestMapping("/findOne")
    public @ResponseBody Emp findOne(String id){
        Emp emp = (Emp) empService.queryOne(id);
        try {
            Date bir = emp.getBir();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String dateString=sdf.format(bir);
            System.out.println(dateString);
            Date parse = sdf.parse(dateString);
            Date date = new java.sql.Date(parse.getTime());
            emp.setBir(date);
            System.out.println(date);
            return emp;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return emp;
    }
}
