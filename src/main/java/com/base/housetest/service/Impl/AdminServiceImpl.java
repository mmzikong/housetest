package com.base.housetest.service.Impl;


import com.base.housetest.dao.AdminDao;
import com.base.housetest.dao.AdminRepository;
import com.base.housetest.model.Admin;
import com.base.housetest.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminRepository adminRepository;

    @Autowired
    private AdminDao adminDao;

    @Override
    public Admin findAdmin(String username, String password) {
        Admin admin = adminRepository.findByUserNameAndPassWord(username,password);
        return admin;
    }

    @Override
    public void adminPass(Admin admin, String newPass, String renewPass) {
        if (!newPass.equals(renewPass)){
            System.out.println("密码不一致");
        }else {
            Admin newAdmin = adminRepository.findByUserName(admin.getUserName());
            if (newAdmin == null){
                System.out.println("未找到该用户");
            }else {
                newAdmin.setPassWord(newPass);
                adminDao.updatePassWord(newAdmin.getUserName(),newAdmin.getPassWord());
            }
        }
    }

    @Override
    public void adminReg(Admin admin, String renewPass) {
        adminDao.add(admin);
    }
}
