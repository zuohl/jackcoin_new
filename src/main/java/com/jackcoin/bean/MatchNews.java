package com.jackcoin.bean;

import java.util.Date;

/**
 * Created by zuohl on 2016/5/19.
 */
public class MatchNews extends BaseEntity {
    private String newsTitle;

    private Date createDate;

    private Integer deleteFlag;

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(Integer deleteFlag) {
        this.deleteFlag = deleteFlag;
    }
}
