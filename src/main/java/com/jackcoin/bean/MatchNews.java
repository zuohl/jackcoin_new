package com.jackcoin.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by zuohl on 2016/5/19.
 */
@Entity
@Table(name = "match_news")
public class MatchNews {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer newsId;

    private String newsTitle;

    private Date createDate;

    private Integer deleteFlag;

    public Integer getNewsId() {
        return newsId;
    }

    public void setNewsId(Integer newsId) {
        this.newsId = newsId;
    }

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
