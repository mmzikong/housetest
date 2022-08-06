package com.base.housetest.service.Impl;

import com.base.housetest.dao.StudentDao;
import com.base.housetest.model.Student;
import com.base.housetest.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {


    @Autowired
    StudentDao studentDao;

    @Override
    public void add(Student student) {
        studentDao.add(student);
    }

    @Override
    public List<Student> findAll() {
        List<Student> list = studentDao.findAll();
        return list;
    }

    @Override
    public void moveIn(String area,String nowWhere,String studentNo,Date inDate) {
        studentDao.moveIn(area,nowWhere,studentNo,inDate);
    }

    @Override
    public void moveOut(String area,String nowWhere, String studentNo, Date outDate) {
        studentDao.moveOut(area,nowWhere,studentNo,outDate);
    }

    @Override
    public Student findById(Long id) {
        return studentDao.findById(id);
    }

    @Override
    public Student findByStudentNo(String studentNo) {
        return studentDao.findByStudentNo(studentNo);
    }

    @Override
    public List<Student> findBySearchLike(String searchLike) {
        return studentDao.findSearchLike(searchLike);
    }

    @Override
    public void deleteById(Long id) {
        studentDao.deleteById(id);
    }

    @Override
    public void deleteByListId(Long[] idList) {
        studentDao.deleteByListId(idList);
    }

    @Override
    public void update(Long id, Student student) {
        studentDao.update(id,student);
    }

    @Override
    public List<Student> findByArea(List<String> area) {
        return studentDao.findByArea(area);
    }
}
