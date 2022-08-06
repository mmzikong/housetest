package com.base.housetest.service;

import com.base.housetest.model.Admin;



public interface AdminService {

    Admin findAdmin(String username, String password);
    void adminPass(Admin admin,String newPass,String renewPass);
    void adminReg(Admin admin,String renewPass);
}
