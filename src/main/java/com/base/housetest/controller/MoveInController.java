package com.base.housetest.controller;

import com.base.housetest.model.MoveIn;
import com.base.housetest.model.Student;
import com.base.housetest.service.MoveInService;
import com.base.housetest.service.StudentService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/moveIn")
public class MoveInController {

    @Autowired
    private MoveInService moveInService;

    @Autowired
    private StudentService studentService;

    @RequestMapping("/moveInView")
    public String getPage(Model model){
        model.addAttribute("list",moveInService.findAll());
        return "/admin/moveIn";
    }

    @RequestMapping(value = "/toMoveIn")
    public String toMoveIn(Model model,String studentNo){
        if (studentNo != null) {
            model.addAttribute("student", studentService.findByStudentNo(studentNo));
        }
        return "/admin/userIn";
    }

    @RequestMapping("/addMoveIn")
    public String addMoveIn(MoveIn moveIn,@RequestParam(value = "nowWhere") String nowWhere,
                            @RequestParam(value = "nowArea") String nowArea){
        moveInService.add(moveIn);
        studentService.moveIn(nowArea,nowWhere,moveIn.getStudentNo(),moveIn.getInDate());
        return "redirect:/moveIn/moveInView";
    }

    @RequestMapping(value = "/deleteById",method = RequestMethod.POST)
    @ResponseBody
    public void deleteById(Long id){
        System.out.println(id);
        //new BigDecimal(id).longValue()
        moveInService.deleteById(id);
//        return "redirect:/moveIn/moveInView";
    }

    @RequestMapping(value = "/deleteByListId",method = RequestMethod.POST)
    @ResponseBody
    public void deleteByListId(Long[] idList){
        for (Long i : idList) {
            System.out.println(i);
        }
        moveInService.deleteByListId(idList);
    }


    @RequestMapping(value="/fenye",method=RequestMethod.GET)
    public String fenye(Model model){
        List<MoveIn> moveInList=moveInService.findAll();
        long geshu=5;//设置每页显示的数据的条数
        long top1=(long) moveInList.size();
        long top=top1/geshu+1;
        model.addAttribute("top",top);//将最大页面数传到前端页面
        return "fenye";
    }

    @RequestMapping("/findSearchLike")
    public String findSearchLike(Model model,@RequestParam(value = "searchLike") String searchLike){
        System.out.println(searchLike);
        model.addAttribute("list",moveInService.findBySearchLike(searchLike));
        return "/admin/moveIn";
    }

    @RequestMapping("/toUpdate")
    public String toUpdate(Model model,Long id){
        model.addAttribute("student",moveInService.findById(id));
        return "/admin/moveInUpdate";
    }


    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public void update(Long id, String name, String studentNo, Date inDate, String area, String whereIn,  String whyIn){
        System.out.println(id);
        MoveIn moveIn = new MoveIn(name,studentNo,inDate,area,whereIn,whyIn);
        System.out.println(moveIn);
        moveInService.update(id,moveIn);
    }
}
