package com.jackcoin.service;

import com.jackcoin.bean.MatchNews;
import com.jackcoin.mapper.MatchNewsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by zuohl on 2016/5/19.
 */
@Service
public class MatchNewsService {

    @Autowired
    private MatchNewsMapper matchNewsMapper;

    public List<MatchNews> getMatchNews() {
        List<MatchNews> matchNewses = matchNewsMapper.selectAll();
        return matchNewses;
    }

    public Integer addMatchNews(MatchNews matchNewses) {
        matchNewses.setCreateDate(new Date());
        matchNewses.setDeleteFlag(0);
        return matchNewsMapper.insertSelective(matchNewses);
    }
}
