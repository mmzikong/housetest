package com.base.housetest.service.Impl;

import com.base.housetest.dao.EpidemicDao;
import com.base.housetest.model.Epidemic;
import com.base.housetest.model.MoveIn;
import com.base.housetest.service.EpidemicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EpidemicServiceImpl implements EpidemicService {

    @Autowired
    private EpidemicDao epidemicDao;

    @Override
    public List<String> findAllArea() {
        return epidemicDao.findAllArea();
    }

    @Override
    public List<Epidemic> findAll() {
        return epidemicDao.findAll();
    }

    @Override
    public void add(String area) {
        epidemicDao.add(area);
    }

    @Override
    public void deleteById(Long id) {
        epidemicDao.deleteById(id);
    }

    @Override
    public void deleteByListId(Long[] idList) {
        epidemicDao.deleteByListId(idList);
    }

    @Override
    public List<Epidemic> findBySearchLike(String searchLike) {
        return epidemicDao.findSearchLike(searchLike);
    }

    @Override
    public List<String> findSearchLikeArea(String searchLike) {
        return epidemicDao.findSearchLikeArea(searchLike);
    }
}
