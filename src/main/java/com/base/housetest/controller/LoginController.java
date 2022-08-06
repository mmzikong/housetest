package com.base.housetest.controller;

import antlr.ASTFactory;
import com.base.housetest.methods.VerifyCode;
import com.base.housetest.model.Admin;
import com.base.housetest.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private AdminService adminService;
    private ASTFactory logger;


    @RequestMapping(value = "/loginView")
    public ModelAndView view(){
        ModelAndView mav = new ModelAndView("/admin/login");
        return mav;
    }


    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public ModelAndView login(Admin admin,String code){
        System.out.println(code);
        Admin us = adminService.findAdmin(admin.getUserName(),admin.getPassWord());

         if (us != null){
            us.setPassWord(null);
            if (true){
                return new ModelAndView("redirect:/index/getPage");
            }
           else {
               ModelAndView mav = new ModelAndView("redirect:/login/loginView");
               mav.addObject("massage","验证码错误");
                return mav;
            }
        }else {

//            attributes.addFlashAttribute("massage","用户名密码错误");
            return  new ModelAndView("redirect:/login/loginView");
        }
    }

    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.removeAttribute("user");
        return "redirect:/login/loginView";
    }

//
//    @RequestMapping(value = "/getVerifyCode ")
//    public ModelAndView getVerificationCode(HttpServletResponse response, HttpServletRequest request) {
//        return new KaptchaController().verification();
//
//    }

}
