package com.jackcoin.service;

import com.jackcoin.bean.Constants;
import com.jackcoin.bean.MatchNews;
import com.jackcoin.dao.MatchNewsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

/**
 * Created by zuohl on 2016/5/19.
 */

@Service
@Transactional
public class MatchNewsService {

    @Autowired
    private MatchNewsDao matchNewsDao;

    public Iterable<MatchNews> getMatchNews(Integer matchNews, int page, int size) {
        Sort sort = new Sort(Sort.Direction.DESC,"createDate");
        Pageable pageable = new PageRequest(page,size,sort);
        Page<MatchNews> matchNewses = matchNewsDao.findByNewsType(matchNews,pageable);
        return matchNewses;
    }

    public MatchNews addMatchNews(MatchNews matchNewses) {
        matchNewses.setCreateDate(new Date());
        matchNewses.setIsDelete(Constants.DELETE_FLAG_NO);
        MatchNews save = matchNewsDao.save(matchNewses);
        return save;
    }

    public void updateMatchNews(MatchNews matchNews) {
        matchNews.setUpdateDate(new Date());
        matchNewsDao.updateByMatchNews(matchNews);
    }

    public MatchNews getMatchNewsById(Integer newsId) {
        return matchNewsDao.findOne(newsId);
    }
}
