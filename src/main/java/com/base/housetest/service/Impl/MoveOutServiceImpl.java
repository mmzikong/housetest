package com.base.housetest.service.Impl;

import com.base.housetest.dao.MoveOutDao;
import com.base.housetest.model.MoveIn;
import com.base.housetest.model.MoveOut;
import com.base.housetest.model.Student;
import com.base.housetest.service.MoveOutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MoveOutServiceImpl implements MoveOutService {

    @Autowired
    private MoveOutDao moveOutDao;

    @Override
    public List<MoveOut> findAll() {
        List<MoveOut> list = moveOutDao.findAll();
        return list;
    }


    @Override
    public void add(MoveOut moveOut){
        moveOutDao.add(moveOut);
    }

    @Override
    public void deleteById(Long id) {
        moveOutDao.deleteById(id);
    }

    @Override
    public void deleteByListId(Long[] idList) {
        moveOutDao.deleteByListId(idList);
    }

    @Override
    public List<MoveOut> findBySearchLike(String searchLike) {
        return moveOutDao.findSearchLike(searchLike);
    }

    @Override
    public MoveOut findById(Long id) {
        return moveOutDao.findById(id);
    }

    @Override
    public void update(Long id, MoveOut moveOut) {
        moveOutDao.update(id,moveOut);
    }

}
