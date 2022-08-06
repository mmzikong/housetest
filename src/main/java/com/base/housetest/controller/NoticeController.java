package com.base.housetest.controller;

import com.base.housetest.model.Notice;
import com.base.housetest.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;


    @RequestMapping("/noticeView")
    public String noticeView(Model model){
        model.addAttribute("list",noticeService.findAll());
        return "/admin/notice";
    }

    @RequestMapping("/noticeList")
    public String noticeList(Model model){
        model.addAttribute("list",noticeService.findAll());
        return "/admin/noticeList";
    }

    @RequestMapping(value = "/toAddOrUpdate")
    public String toAddOrUpdate(Model model,Long id){
        if (id != null) {
            model.addAttribute("notice", noticeService.findById(id));
        }
        return "/admin/noticeUpdate";
    }

    @RequestMapping(value = "/addOrUpdate")
    public String add(Long id,Notice notice){
        System.out.println(notice);
        if (id == null ){
            noticeService.add(notice);
        }else {
            noticeService.update(id,notice);
        }
        return "redirect:/notice/noticeView";
    }


    @RequestMapping(value = "/deleteById")
    @ResponseBody
    public void deleteById(Long id){
        noticeService.deleteById(id);
    }

    @RequestMapping(value = "/deleteByListId",method = RequestMethod.POST)
    @ResponseBody
    public void deleteByListId(Long[] idList){
        for (Long i : idList) {
            System.out.println(i);
        }
        noticeService.deleteByListId(idList);
    }

    @RequestMapping(value = "/release")
    @ResponseBody
    public void release(Long id, String[] telList){
        System.out.println(id);
        for(String s : telList){
            System.out.println(s);
        }
        noticeService.release(id,telList);
    }
}
