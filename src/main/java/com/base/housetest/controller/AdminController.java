package com.base.housetest.controller;

import com.base.housetest.model.Admin;
import com.base.housetest.service.AdminService;
import com.base.housetest.service.StudentService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

//    @RequestMapping("/adminView")
//    public String getPage(Model model){
//        model.addAttribute("list",studentService.findAll());
//        return "/admin/list";
//    }
    @RequestMapping("/adminPass")
    public String adminPass(Admin admin, @RequestParam(value = "newpass") String newPass,
                          @RequestParam(value = "renewpass") String renewPass){
        adminService.adminPass(admin,newPass,renewPass);
        return "redirect:/student/listView";
    }

    @RequestMapping("/passView")
    public String toPass(){
        return "/admin/pass";
    }

    @RequestMapping("/regView")
    public String toReg(){
        return "/admin/reg";
    }

    @RequestMapping("/adminReg")
    public String adminReg(Admin admin,@RequestParam(value = "renewpass") String renewPass){
        adminService.adminReg(admin,renewPass);
        return "redirect:/student/listView";
    }

}
