package com.base.housetest.dao;

import com.base.housetest.model.Admin;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface AdminDao {

     @Update("UPDATE admin SET pass_word = #{passWord} WHERE user_name = #{userName}")
     void updatePassWord(String userName,String passWord);

     @Insert("INSERT INTO admin(user_name,pass_word) VALUES (#{admin.userName},#{admin.passWord}) ")
     void add(@Param("admin") Admin admin);

}
