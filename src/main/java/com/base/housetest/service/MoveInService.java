package com.base.housetest.service;

import com.base.housetest.model.MoveIn;
import com.base.housetest.model.Student;

import java.util.Date;
import java.util.List;

public interface MoveInService {
    List<MoveIn> findAll();
//    void add(String name, String studentNo, String whereIn, Date inDate,String whyIn);
    void add(MoveIn moveIn);

    void deleteById(Long id);

    void deleteByListId(Long[] idList);

    List<MoveIn> findBySearchLike(String searchLike);

    MoveIn findById(Long id);

    void update(Long id,MoveIn moveIn);
}
