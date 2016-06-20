package com.jackcoin.controller;

import com.jackcoin.bean.Constants;
import com.jackcoin.bean.MatchNews;
import com.jackcoin.bean.WebResult;
import com.jackcoin.service.MatchNewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by zuohl on 2016/5/19.
 */
@Controller
@RequestMapping("/news")
public class MatchNewsController extends BaseController {

    @Autowired
    private MatchNewsService matchNewsService;

    @RequestMapping("/getMatchNewsList")
    @ResponseBody
    public WebResult getMatchNewsList(Integer page,Integer size) {
        WebResult webResult = new WebResult();
        Page<MatchNews> matchNews = matchNewsService.getMatchNews(page, size);
        webResult.setData(matchNews);
        return webResult;
    }

    @GetMapping("/getMatchNewsById")
    public WebResult getMatchNewsById(Integer newsId) {
        WebResult webResult = new WebResult();
        webResult.setCode(Constants.RESULT_SUCCESS);
        webResult.setData(matchNewsService.getMatchNewsById(newsId));
        return webResult;
    }

    @PostMapping("/addMatchNews")
    @ResponseBody
    public WebResult addMatchNews(MatchNews matchNews) {
        MatchNews news = matchNewsService.addMatchNews(matchNews);
        WebResult webResult = new WebResult();
        if (news != null) {
            webResult.setData("新闻添加成功");
            webResult.setCode(Constants.RESULT_SUCCESS);
        } else {
            webResult.setData("新闻添加失败");
            webResult.setCode(Constants.RESULT_BUSINESS_ERROR);
        }
        return webResult;
    }
}
