package com.base.housetest.service;

import com.base.housetest.model.Student;

import java.util.Date;
import java.util.List;

public interface StudentService {
    void add(Student student);                                                      //新增学生
    List<Student> findAll();                                                        //查找所有学生
    List<Student> findByArea(List<String> area);                                    //通过区域查找
    void moveIn(String area,String nowWhere, String studentNo, Date inDate);        //学生户籍迁入
    void moveOut(String area,String nowWhere,String studentNo,Date outDate);        //学生户籍迁出
    Student findById(Long id);                                                      //通过id查找学生
    Student findByStudentNo(String studentNo);                                      //通过学号查找学生
    List<Student> findBySearchLike(String searchLike);                              //模糊查找学生
    void deleteById(Long id);                                                       //通过id删除学生信息
    void deleteByListId(Long[] idList);                                             //批量删除学生信息
    void update(Long id,Student student);                                           //修改学生信息
}


