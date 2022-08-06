package com.base.housetest.service;

import com.base.housetest.model.Epidemic;
import com.base.housetest.model.MoveIn;

import java.util.List;

public interface EpidemicService {
    List<String> findAllArea();
    List<Epidemic> findAll();
    void add(String area);
    void deleteById(Long id);
    void deleteByListId(Long[] idList);
    List<Epidemic> findBySearchLike(String searchLike);
    List<String> findSearchLikeArea(String searchLike);
}
