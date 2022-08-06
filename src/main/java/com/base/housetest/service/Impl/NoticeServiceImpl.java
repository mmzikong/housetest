package com.base.housetest.service.Impl;

import com.base.housetest.dao.NoticeDao;
import com.base.housetest.model.Notice;
import com.base.housetest.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeDao noticeDao;

    @Override
    public List<Notice> findAll() {
        return noticeDao.findAll();
    }

    @Override
    public Notice findById(Long id) {
        return noticeDao.findById(id);
    }

    @Override
    public void add(Notice notice) {
        noticeDao.add(notice);
    }

    @Override
    public void update(Long id, Notice notice) {
        Notice notice1 = noticeDao.findById(id);
        notice1.setTitle(notice.getTitle());
        notice1.setReleasePeople(notice.getReleasePeople());
        notice1.setContent(notice.getContent());
        noticeDao.update(notice1);
    }

    @Override
    public void deleteById(Long id) {
        noticeDao.deleteById(id);
    }

    @Override
    public void deleteByListId(Long[] idList) {
        noticeDao.deleteByListId(idList);
    }

    @Override
    public void release(Long id, String[] telList) {
        Notice notice = noticeDao.findById(id);
        notice.setReleaseTime(new Date());
    }
}
