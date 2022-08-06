package com.base.housetest.dao;

import com.base.housetest.model.Admin;


import org.springframework.data.jpa.repository.JpaRepository;

public interface AdminRepository extends JpaRepository<Admin,Long> {

    Admin findByUserNameAndPassWord(String username,String password);
    Admin findByUserName(String username);
}
