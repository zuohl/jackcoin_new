package com.jackcoin.controller;

import com.jackcoin.bean.Constants;
import com.jackcoin.bean.MatchUser;
import com.jackcoin.bean.WebResult;
import com.jackcoin.service.MatchUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by zuohl on 2016/5/21.
 */
@Controller
@RequestMapping("/user")
public class MatchUserController extends BaseController {

    @Autowired
    private MatchUserService matchUserService;

    @RequestMapping("/addMatchUser")
    @ResponseBody
    public WebResult addMatchUser(MatchUser matchUser) {
        MatchUser newUser = matchUserService.addMatchUser(matchUser);
        WebResult webResult = new WebResult();
        if (newUser != null) {
            webResult.setMsg("添加成功");
            webResult.setCode(Constants.RESULT_SUCCESS);
        } else {
            webResult.setMsg("添加失败");
            webResult.setCode(Constants.RESULT_BUSINESS_ERROR);
        }
        return webResult;
    }
}
