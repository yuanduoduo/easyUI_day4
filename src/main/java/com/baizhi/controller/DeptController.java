package com.baizhi.controller;

import com.baizhi.entity.Dept;
import com.baizhi.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
@RequestMapping("/dept")
public class DeptController {
    @Autowired
    private DeptService deptService;

    @RequestMapping("/findAll")
    public @ResponseBody Map<String, Object> findAll(Integer page, Integer rows) {
        HashMap<String, Object> map = new HashMap<>();
        List<Dept> menu = deptService.findByPage(page,rows);
        Long totals = deptService.findTotals();
        map.put("total", totals);
        map.put("rows", menu);
        return map;
    }
    @RequestMapping("/save")
    public @ResponseBody Map<String,Object> save(Dept dept){
        HashMap<String, Object> map = new HashMap<>();
        try {
            Date createDate = dept.getCreateDate();
            Calendar c = Calendar.getInstance();
            c.setTime(createDate);
            c.add(Calendar.DAY_OF_MONTH, 1);
            createDate = c.getTime();
            dept.setCreateDate(createDate);
            deptService.save(dept);
            map.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            map.put("success",false);
            map.put("message",e.getMessage());
        }
        return map;
    }
    @RequestMapping("/delete")
    public @ResponseBody Map<String,Object> delete(String id,String[] ids){
        HashMap<String, Object> results = new HashMap<String, Object>();
        try{
            if(ids==null){
                deptService.delete(id);
            }else{
                for (String s : ids) {
                    deptService.delete(s);
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
    public @ResponseBody Map<String,Object> update(Dept dept){
        HashMap<String, Object> map = new HashMap<>();
        try{
            deptService.update(dept);
            map.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            map.put("success",false);
            map.put("message",e.getMessage());
        }
        return map;
    }
    @RequestMapping("/queryOne")
    public @ResponseBody Dept queryOne(String id){
        Dept dept = deptService.queryOne(id);
        return dept;
    }

}
