package com.jackcoin.util;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jackcoin.annotation.SecurityDesc;
import com.jackcoin.bean.Constants;
import com.jackcoin.bean.WebResult;
import org.springframework.boot.json.JacksonJsonParser;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by zuohl on 2016/6/25.
 */
public class UserSecurityInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        WebResult webResult = new WebResult();
        if (handler != null && handler instanceof HandlerMethod) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            SecurityDesc securityDesc = handlerMethod.getMethodAnnotation(SecurityDesc.class);
            if (securityDesc != null) {
                String token = request.getParameter("token");
                if (token != null) {
                    String userName = (String)request.getSession().getAttribute(token);
                    if (Constants.MANAGER_USER_NAME.equals(userName)) {
                        return true;
                    }
                }
                webResult.setCode(Constants.RESULT_LOGIN_EXCEPTION);
                response.setContentType("application/json;charset=UTF-8");
                ObjectMapper mapper = new ObjectMapper();
                PrintWriter out = response.getWriter();
                out.println(mapper.writeValueAsString(webResult));
                out.flush();
                out.close();
                return false;
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
