package com.base.housetest.service;

import com.base.housetest.model.MoveIn;
import com.base.housetest.model.MoveOut;
import com.base.housetest.model.Student;


import java.util.List;

public interface MoveOutService {
    List<MoveOut> findAll();
    void add(MoveOut moveOut);
    void deleteById(Long id);
    void deleteByListId(Long[] idList);
    List<MoveOut> findBySearchLike(String searchLike);
    MoveOut findById(Long id);
    void update(Long id,MoveOut moveOut);
}
