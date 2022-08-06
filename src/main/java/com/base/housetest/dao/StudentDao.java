package com.base.housetest.dao;

import com.base.housetest.model.Student;
import org.apache.ibatis.annotations.*;

import java.util.Date;
import java.util.List;

@Mapper
public interface StudentDao {
    void add(@Param("Student") Student student);

    List<Student> findAll();

    @Select("SELECT * FROM student WHERE id = #{id}")
    Student findById(Long id);

    @Select("SELECT * FROM student WHERE student_no = #{studentNo}")
    Student findByStudentNo(String studentNo);

    List<Student> findByArea(List<String> area);

    List<Student> findSearchLike(String searchLike);

    void moveIn(String area,String nowWhere, String studentNo, Date inDate);

    void moveOut(String area,String nowWhere,String studentNo,Date outDate);

    @Delete("DELETE FROM student WHERE id = #{id}")
    void deleteById(Long id);

    void deleteByListId(Long[] idList);

    void update(Long id,@Param("Student") Student student);
}
