package com.jackcoin.controller;

import com.jackcoin.bean.MatchNews;
import com.jackcoin.service.MatchNewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by zuohl on 2016/5/19.
 */
@Controller
@RequestMapping("/news")
public class MatchNewController {

    @Autowired
    private MatchNewsService matchNewsService;

    @RequestMapping("/getMatchNews")
    @ResponseBody
    public Object getMatchNews() {
        return matchNewsService.getMatchNews();
    }

    @RequestMapping("/addMatchNews")
    @ResponseBody
    public Object addMatchNews(MatchNews matchNews) {
        return matchNewsService.addMatchNews(matchNews);
    }
}
