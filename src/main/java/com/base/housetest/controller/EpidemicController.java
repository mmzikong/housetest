package com.base.housetest.controller;

import com.base.housetest.service.EpidemicService;
import com.base.housetest.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/epidemic")
public class EpidemicController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private EpidemicService epidemicService;

    @RequestMapping("/epidemicView")
    public String getPage(Model model){
        model.addAttribute("e",epidemicService.findAll());
        if (!epidemicService.findAllArea().isEmpty()) {
            model.addAttribute("list", studentService.findByArea(epidemicService.findAllArea()));
        }
        return "/admin/epidemic";
    }

    @RequestMapping("/add")
    @ResponseBody
    public void add(String area){
        epidemicService.add(area);
    }

    @RequestMapping("/deleteById")
    @ResponseBody
    public void deleteById(Long id){
        epidemicService.deleteById(id);
    }

    @RequestMapping(value = "/deleteByListId",method = RequestMethod.POST)
    @ResponseBody
    public void deleteByListId(Long[] idList){
        epidemicService.deleteByListId(idList);
    }

    @RequestMapping("/findSearchLike")
    public String findSearchLike(Model model,@RequestParam(value = "searchLike") String searchLike){
        System.out.println(searchLike);
        model.addAttribute("e",epidemicService.findBySearchLike(searchLike));
        model.addAttribute("list",studentService.findByArea(epidemicService.findSearchLikeArea(searchLike)));
        return "/admin/epidemic";
    }

}
