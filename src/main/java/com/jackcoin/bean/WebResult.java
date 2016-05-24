package com.jackcoin.bean;

import java.util.ArrayList;

/**
 * Created by zuohl on 2016/5/21.
 */
public class WebResult {
    /* 状态CODE码 0请求成功 10业务异常 100系统异常*/
    private int code = 0;

    private String msg = "";

    private Object data = new ArrayList<Object>();

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
