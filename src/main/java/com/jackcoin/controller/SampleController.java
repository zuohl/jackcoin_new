package com.jackcoin.controller;

import com.jackcoin.service.MatchNewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by huaka on 2016-05-19.
 */
@Controller
@EnableAutoConfiguration
public class SampleController {

    @Autowired
    private MatchNewsService matchNewsService;

    @RequestMapping("/")
    @ResponseBody
    String home() {
        return "Hello World!";
    }

    @RequestMapping("getMatchNews")
    @ResponseBody
    public Object getMatchNews() {
        return matchNewsService.getMatchNews();
    }
}
