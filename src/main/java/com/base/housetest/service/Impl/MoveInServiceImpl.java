package com.base.housetest.service.Impl;

import com.base.housetest.dao.MoveInDao;
import com.base.housetest.model.MoveIn;
import com.base.housetest.model.Student;
import com.base.housetest.service.MoveInService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class MoveInServiceImpl implements MoveInService {

    @Autowired
    private MoveInDao moveInDao;

    @Override
    public List<MoveIn> findAll() {
        List<MoveIn> list = moveInDao.findAll();
        return list;
    }

//    @Override
//    public void add(String name, String studentNo, String whereIn, Date inDate,String whyIn){
//        moveInDao.add(name,studentNo,whereIn,inDate,whyIn);
//    }

    @Override
    public void add(MoveIn moveIn){
        System.out.println(moveIn);
        moveInDao.add(moveIn);
    }

    @Override
    public void deleteById(Long id) {
        moveInDao.deleteById(id);
    }

    @Override
    public void deleteByListId(Long[] idList) {
        moveInDao.deleteByListId(idList);
    }

    @Override
    public List<MoveIn> findBySearchLike(String searchLike) {
        return moveInDao.findSearchLike(searchLike);
    }

    @Override
    public MoveIn findById(Long id) {
        return moveInDao.findById(id);
    }

    @Override
    public void update(Long id, MoveIn moveIn) {
        moveInDao.update(id,moveIn);
    }
}
