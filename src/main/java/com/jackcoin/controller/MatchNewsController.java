package com.jackcoin.controller;

import com.jackcoin.annotation.SecurityDesc;
import com.jackcoin.bean.Constants;
import com.jackcoin.bean.MatchNews;
import com.jackcoin.bean.WebResult;
import com.jackcoin.service.MatchNewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by zuohl on 2016/5/19.
 */
@RestController
@RequestMapping("/news")
public class MatchNewsController extends BaseController {

    @Autowired
    private MatchNewsService matchNewsService;

    @RequestMapping("/getMatchNewsList")
    public WebResult getMatchNewsList(@RequestParam(required = false,defaultValue = "1") Integer newsType, Integer page, Integer size) {
        WebResult webResult = new WebResult();
        webResult.setData(matchNewsService.getMatchNews(newsType,page, size));
        return webResult;
    }

    @RequestMapping("/getMatchNewsById")
    public WebResult getMatchNewsById(Integer newsId) {
        WebResult webResult = new WebResult();
        webResult.setCode(Constants.RESULT_SUCCESS);
        webResult.setData(matchNewsService.getMatchNewsById(newsId));
        return webResult;
    }

    @SecurityDesc("增加新闻")
    @RequestMapping("/addMatchNews")
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

    @SecurityDesc("删除新闻")
    @RequestMapping("/deleteMatchNews")
    public WebResult deleteMatchNews(MatchNews matchNews) {
        matchNews.setIsDelete(Constants.DELETE_FLAG_YES);
        matchNewsService.updateMatchNews(matchNews);
        WebResult webResult = new WebResult();
        webResult.setData("新闻删除成功");
        webResult.setCode(Constants.RESULT_SUCCESS);
        return webResult;
    }

    @SecurityDesc("修改新闻")
    @RequestMapping("/updateMatchNews")
    public WebResult updateMatchNews(MatchNews matchNews) {
        matchNewsService.updateMatchNews(matchNews);
        WebResult webResult = new WebResult();
        webResult.setData("新闻修改成功");
        webResult.setCode(Constants.RESULT_SUCCESS);
        return webResult;
    }
}
