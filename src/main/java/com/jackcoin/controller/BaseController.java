package com.jackcoin.controller;

import com.jackcoin.bean.Constants;
import com.jackcoin.bean.WebResult;
import com.jackcoin.util.JackcoinException;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.MessageFormat;

/**
 * Created by zuohl on 2016/5/21.
 */
@Controller
public class BaseController {
	private final Logger logger = Logger.getLogger(getClass());
	// 利用@ModelAttribute注解注入各种servlet对象
	protected HttpServletRequest request;
    protected HttpServletResponse response;
    protected HttpSession session;

	@ModelAttribute
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	@ModelAttribute
	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	@ModelAttribute
	public void setSession(HttpSession session) {
		this.session = session;
	}

    @RequestMapping("/")
    public String indexPage() {
        return "index.html";
    }

	@ExceptionHandler({Exception.class})
	public WebResult handleException(Exception ex) {
		WebResult webResult=new WebResult();
		if (ex instanceof JackcoinException) {
			logger.error(ex.getMessage());
			webResult.setCode(Constants.RESULT_BUSINESS_ERROR);
			webResult.setMsg(ex.getMessage());
		} else {
			logger.error(ex.getMessage(),ex);
			String errorMessage = MessageFormat.format(Constants.ERROR_MSG, ex.getMessage());
			webResult.setCode(Constants.RESULT_EXCEPTION);
			webResult.setMsg(errorMessage);
		}
		return webResult;
	}

}
