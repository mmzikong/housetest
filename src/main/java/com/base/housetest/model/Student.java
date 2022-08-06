package com.base.housetest.model;


import javax.persistence.*;
import java.util.Date;

@Entity
//@Table(name = "student")
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;                //学生id
    private String studentName;     //学生姓名
    private String studentNo;       //学号
    private String studentTel;      //学生手机号码

    private String sex;             //性别
    private String department;      //学院
    private String studentClass;    //班级
    private String studentId;       //学生身份证号
    private String nation;          //名族
    private String area;            //区域
    private String hold;            //户籍
    @Temporal(TemporalType.DATE)
    private Date inDate;            //迁入时间
    @Temporal(TemporalType.DATE)
    private Date outDate;           //迁出时间

    public Student() {

    }

    public Long getId() {
        return Id;
    }

    public void setId(Long Id) {
        this.Id = Id;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentNo() {
        return studentNo;
    }

    public void setStudentNo(String studentNo) {
        this.studentNo = studentNo;
    }

    public String getStudentTel() {
        return studentTel;
    }

    public void setStudentTel(String studentTel) {
        this.studentTel = studentTel;
    }


    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getStudentClass() {
        return studentClass;
    }

    public void setStudentClass(String studentClass) {
        this.studentClass = studentClass;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getHold() {
        return hold;
    }

    public void setHold(String hold) {
        this.hold = hold;
    }


    public Date getInDate() {
        return inDate;
    }

    public void setInDate(Date inDate) {
        this.inDate = inDate;
    }

    public Date getOutDate() {
        return outDate;
    }

    public void setOutDate(Date outDate) {
        this.outDate = outDate;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public Student(String studentName, String studentNo, String studentTel, String sex, String department, String studentClass, String studentId, String nation, String area, String hold, Date inDate, Date outDate) {
        this.studentName = studentName;
        this.studentNo = studentNo;
        this.studentTel = studentTel;
        this.sex = sex;
        this.department = department;
        this.studentClass = studentClass;
        this.studentId = studentId;
        this.nation = nation;
        this.area = area;
        this.hold = hold;
        this.inDate = inDate;
        this.outDate = outDate;
    }

    @Override
    public String toString() {
        return "Student{" +
                "Id=" + Id +
                ", studentName='" + studentName + '\'' +
                ", studentNo='" + studentNo + '\'' +
                ", studentTel='" + studentTel + '\'' +
                ", sex='" + sex + '\'' +
                ", department='" + department + '\'' +
                ", studentClass='" + studentClass + '\'' +
                ", studentId='" + studentId + '\'' +
                ", nation='" + nation + '\'' +
                ", area='" + area + '\'' +
                ", hold='" + hold + '\'' +
                ", inDate=" + inDate +
                ", outDate=" + outDate +
                '}';
    }
}
