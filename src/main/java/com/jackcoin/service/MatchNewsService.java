package com.jackcoin.service;

import com.jackcoin.bean.MatchNews;
import com.jackcoin.dao.MatchNewsDao;
import org.springframework.beans.factory.annotation.Autowired;
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

    public List<MatchNews> getMatchNews() {
        Iterable<MatchNews> all = matchNewsDao.findAll();
        return (List<MatchNews>) all;
    }

    public MatchNews addMatchNews(MatchNews matchNewses) {
        matchNewses.setCreateDate(new Date());
        matchNewses.setDeleteFlag(0);
        MatchNews save = matchNewsDao.save(matchNewses);
        return save;
    }
}
