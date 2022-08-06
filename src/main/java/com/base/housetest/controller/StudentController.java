package com.base.housetest.controller;

import com.base.housetest.model.Student;
import com.base.housetest.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @RequestMapping("/addView")
    public String addView(){
        return "/admin/add";
    }

    @RequestMapping("/add")
    public String add(Student student){
        studentService.add(student);
        return "redirect:/student/listView";
    }


    @RequestMapping("/listView")
    public String getPage(Model model){
//        System.out.println(searchLike);
//        model.addAttribute("list",studentService.findBySearchLike(searchLike));
        model.addAttribute("list",studentService.findAll());
        return "/admin/list";
    }

    @RequestMapping("/findSearchLike")
    public String findSearchLike(Model model,@RequestParam(value = "searchLike") String searchLike){
        System.out.println(searchLike);
        model.addAttribute("list",studentService.findBySearchLike(searchLike));
        return "/admin/list";
    }

    @RequestMapping(value = "/deleteById",method = RequestMethod.POST)
    @ResponseBody
    public void deleteById(Long id){
        studentService.deleteById(id);
    }


    @RequestMapping(value = "/deleteByListId",method = RequestMethod.POST)
    @ResponseBody
    public void deleteByListId(Long[] idList){
        for (Long i : idList) {
            System.out.println(i);
        }
        studentService.deleteByListId(idList);
    }

    @RequestMapping(value = "/findByStudentNo",method = RequestMethod.POST)
    @ResponseBody
    public Student findByStudentNo(String studentNo){
        System.out.println(studentNo);
        Student s = studentService.findByStudentNo(studentNo);
        System.out.println(s);
        return s;
    }

    @RequestMapping("/toUpdate")
    public String toUpdate(Model model,Long id){
        model.addAttribute("student",studentService.findById(id));
        return "/admin/update";
    }


    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public void update(Long id, String studentName, String studentNo, String sex, String department, String studentClass,
                       String studentId, String nation, String studentTel, String area, String hold, Date inDate,Date outDate){
        System.out.println(id);
        Student student = new Student(studentName,studentNo,studentTel,sex,department,studentClass,studentId,nation,area,hold,inDate,outDate);
        System.out.println(student);
        studentService.update(id,student);
    }

}
