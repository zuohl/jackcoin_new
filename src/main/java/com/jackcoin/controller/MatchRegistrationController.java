package com.jackcoin.controller;

import com.jackcoin.bean.Constants;
import com.jackcoin.bean.MatchRegistrationRecords;
import com.jackcoin.bean.WebResult;
import com.jackcoin.service.MatchRegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by zuohl on 2016/5/25.
 */
@Controller
@ResponseBody
@RequestMapping("/registration")
public class MatchRegistrationController extends BaseController {

    @Autowired
    private MatchRegistrationService matchRegistrationService;

    @RequestMapping("/addMatchRegistration")
    public WebResult addMatchRegistration(MatchRegistrationRecords records) {
        WebResult webResult = new WebResult();
        MatchRegistrationRecords matchRegistrationRecords = matchRegistrationService.addMatchRegistration(records);
        if (matchRegistrationRecords != null) {
            webResult.setMsg("报名成功");
            webResult.setCode(Constants.RESULT_SUCCESS);
        } else {
            webResult.setMsg("报名失败");
            webResult.setCode(Constants.RESULT_BUSINESS_ERROR);
        }
        return webResult;
    }
}
