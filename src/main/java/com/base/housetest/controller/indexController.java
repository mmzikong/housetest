package com.base.housetest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/index")
public class indexController {

    @RequestMapping("/getPage")
    public ModelAndView index(){
        return new ModelAndView("/admin/index");
    }

    @RequestMapping("/toArea")
    public String toArea(){
        return "/admin/area";
    }

    @RequestMapping("/shooseArea")
    public void shooseArea(String area){
        System.out.println(area);
    }
}
