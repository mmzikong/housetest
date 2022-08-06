package com.base.housetest.controller;

import com.base.housetest.model.MoveIn;
import com.base.housetest.model.MoveOut;
import com.base.housetest.service.MoveOutService;
import com.base.housetest.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

@Controller
@RequestMapping("/moveOut")
public class MoveOutController {

    @Autowired
    private MoveOutService moveOutService;

    @Autowired
    private StudentService studentService;

    @RequestMapping("/moveOutView")
    public String getPage(Model model){
        model.addAttribute("list",moveOutService.findAll());
        return "/admin/moveOut";
    }

    @RequestMapping("/toMoveOut")
    public String toMoveOut(Model model,String studentNo){
        if (studentNo != null) {
            model.addAttribute("student", studentService.findByStudentNo(studentNo));
        }
        return "/admin/userOut";
    }

    @RequestMapping("/addMoveOut")
    public String addMoveOut(MoveOut moveOut, @RequestParam(value = "nowWhere") String nowWhere,
                             @RequestParam(value = "nowArea") String nowArea){
        moveOut.setArea(nowArea);
        moveOut.setWhereOut(nowWhere);
        moveOutService.add(moveOut);
        studentService.moveOut(nowArea,nowWhere,moveOut.getStudentNo(),moveOut.getOutDate());
        return "redirect:/moveOut/moveOutView";
    }

    @RequestMapping(value = "/deleteById",method = RequestMethod.POST)
    @ResponseBody
    public void deleteById(Long id){
        System.out.println(id);
        moveOutService.deleteById(id);
    }

    @RequestMapping(value = "/deleteByListId",method = RequestMethod.POST)
    @ResponseBody
    public void deleteByListId(Long[] idList){
        moveOutService.deleteByListId(idList);
    }

    @RequestMapping("/findSearchLike")
    public String findSearchLike(Model model,@RequestParam(value = "searchLike") String searchLike){
        System.out.println(searchLike);
        model.addAttribute("list",moveOutService.findBySearchLike(searchLike));
        return "/admin/moveOut";
    }


    @RequestMapping("/toUpdate")
    public String toUpdate(Model model,Long id){
        model.addAttribute("student",moveOutService.findById(id));
        return "/admin/moveOutUpdate";
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public void update(Long id, String name, String studentNo, Date outDate, String area, String whereOut, String whyOut){
        System.out.println(id);
        MoveOut moveOut = new MoveOut(name,studentNo,outDate,area,whereOut,whyOut);
        System.out.println(moveOut);
        moveOutService.update(id,moveOut);
    }
}
