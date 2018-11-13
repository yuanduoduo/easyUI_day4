package com.baizhi.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Dept {
    private String id;
    private String no;
    private String name;
    private Integer number;
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createDate;

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }



    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }


    public Dept() {
    }

    public Dept(String id, String no, String name, Integer number, Date createDate) {
        this.id = id;
        this.no = no;
        this.name = name;
        this.number = number;
        this.createDate = createDate;

    }

    @Override
    public String toString() {
        return "Dept{" +
                "id='" + id + '\'' +
                ", no='" + no + '\'' +
                ", name='" + name + '\'' +
                ", number=" + number +
                ", createDate=" + createDate +
                '}';
    }
}
