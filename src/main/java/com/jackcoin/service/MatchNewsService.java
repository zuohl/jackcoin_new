package com.jackcoin.service;

import com.jackcoin.bean.Constants;
import com.jackcoin.bean.MatchNews;
import com.jackcoin.dao.MatchNewsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * Created by zuohl on 2016/5/19.
 */
@Service
@Transactional
public class MatchNewsService {

    @Autowired
    private MatchNewsDao matchNewsDao;

    public Iterable<MatchNews> getMatchNews(int page,int size) {
        Pageable pageable = new PageRequest(page,size);
        Iterable<MatchNews> all = matchNewsDao.findAll();
        return all;
    }

    public MatchNews addMatchNews(MatchNews matchNewses) {
        matchNewses.setCreateDate(new Date());
        matchNewses.setIsDelete(Constants.DELETE_FLAG_NO);
        MatchNews save = matchNewsDao.save(matchNewses);
        return save;
    }

    public MatchNews getMatchNewsById(Integer newsId) {
        return matchNewsDao.findOne(newsId);
    }
}
