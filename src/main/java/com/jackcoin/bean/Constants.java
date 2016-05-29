package com.jackcoin.bean;

/**
 * Created by zuohl on 2016/5/21.
 */
public class Constants {

    /**
     * 全局状态返回码 0 成功  10 业务异常 100 系统异常
     */
    public static final int RESULT_SUCCESS = 0;
    public static final int RESULT_BUSINESS_ERROR = 10;
    public static final int RESULT_EXCEPTION = 100;

    /**
     * 删除标识
     */
    public static final int DELETE_FLAG_YES = 1;

    public static final int DELETE_FLAG_NO = 0;
    /**
     * 自定义异常提示
     */
    public static final String ERROR_MSG = "发现一个未知错误:{0}！请稍后重试，如无法解决，请联系客服热线：0000";

    public static final String EMERGENCY_CONTACT = "冯璐";
    public static final String EMERGENCY_CONTACT_PHONE = "15262321211";
}
