package com.base.housetest.service;

import com.base.housetest.model.Notice;

import java.util.List;

public interface NoticeService {
    List<Notice> findAll();
    Notice findById(Long id);
    void add(Notice notice);
    void update(Long id,Notice notice);
    void deleteById(Long id);
    void deleteByListId(Long[] idList);
    void release(Long id,String[] telList);
}
