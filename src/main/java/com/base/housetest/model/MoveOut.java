package com.base.housetest.model;

import javax.persistence.*;
import java.util.Date;

@Entity
public class MoveOut {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;
    private String studentNo;
    private String name;
    @Temporal(TemporalType.DATE)
    private Date outDate;
    private String area;
    private String whereOut;
    private String whyOut;

    public MoveOut() {
    }

    public MoveOut(String studentNo, String name, Date outDate, String area, String whereOut, String whyOut) {
        this.studentNo = studentNo;
        this.name = name;
        this.outDate = outDate;
        this.area = area;
        this.whereOut = whereOut;
        this.whyOut = whyOut;
    }

    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        Id = id;
    }

    public String getStudentNo() {
        return studentNo;
    }

    public void setStudentNo(String studentNo) {
        this.studentNo = studentNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public Date getOutDate() {
        return outDate;
    }

    public void setOutDate(Date outDate) {
        this.outDate = outDate;
    }

    public String getWhereOut() {
        return whereOut;
    }

    public void setWhereOut(String whereOut) {
        this.whereOut = whereOut;
    }

    public String getWhyOut() {
        return whyOut;
    }

    public void setWhyOut(String whyOut) {
        this.whyOut = whyOut;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    @Override
    public String toString() {
        return "MoveOut{" +
                "Id=" + Id +
                ", studentNo='" + studentNo + '\'' +
                ", name='" + name + '\'' +
                ", outDate=" + outDate +
                ", area='" + area + '\'' +
                ", whereOut='" + whereOut + '\'' +
                ", whyOut='" + whyOut + '\'' +
                '}';
    }
}
