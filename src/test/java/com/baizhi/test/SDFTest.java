package com.baizhi.test;

import org.junit.Test;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SDFTest {
    @Test
    public void test1() throws Exception{
        String bir = "2017-10-19";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String dateString=sdf.format(DateFormat.getDateInstance().parse(bir));
        System.out.println(dateString);
        Date parse = sdf.parse(dateString);
        Date date = new java.sql.Date(parse.getTime());
        System.out.println(date);
    }
    @Test
    public void test2() throws Exception {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = sdf.format(date);
        System.out.println(dateString);
        Date parse = sdf.parse(dateString);
        Date date1 = new java.sql.Date(parse.getTime());
        System.out.println(date1);
    }
}
