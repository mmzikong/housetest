package com.base.housetest.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
public class MoveIn {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;
    private String studentNo;
    private String name;
    @Temporal(TemporalType.DATE)
//    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8") //在时间属性上面加上该注解
    private Date inDate;
    private String area;
    private String whereIn;
    private String whyIn;

    public MoveIn() {
    }

    public MoveIn(String studentNo, String name, Date inDate, String area, String whereIn, String whyIn) {
        this.studentNo = studentNo;
        this.name = name;
        this.inDate = inDate;
        this.area = area;
        this.whereIn = whereIn;
        this.whyIn = whyIn;
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

    public Date getInDate() {
        return inDate;
    }

    public void setInDate(Date inDate) {
        this.inDate = inDate;
    }

    public String getWhereIn() {
        return whereIn;
    }

    public void setWhereIn(String whereIn) {
        this.whereIn = whereIn;
    }

    public String getWhyIn() {
        return whyIn;
    }

    public void setWhyIn(String whyIn) {
        this.whyIn = whyIn;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    @Override
    public String toString() {
        return "MoveIn{" +
                "Id=" + Id +
                ", studentNo='" + studentNo + '\'' +
                ", name='" + name + '\'' +
                ", inDate=" + inDate +
                ", area='" + area + '\'' +
                ", whereIn='" + whereIn + '\'' +
                ", whyIn='" + whyIn + '\'' +
                '}';
    }
}
