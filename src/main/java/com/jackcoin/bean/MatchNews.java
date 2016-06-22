package com.jackcoin.bean;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.jackcoin.util.CustomDateSerializer;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by zuohl on 2016/5/19.
 */
@Entity
@Table(name = "match_news")
public class MatchNews extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer newsId;

    private String newsTitle;

    @Lob
    @Basic(fetch = FetchType.LAZY)
    @Column(name="news_content", columnDefinition="varchar(MAX)", nullable=true)
    private String newsContent;

    /**
     * 1赛事公告,2行情点评
     */
    private Integer newsType;

    private String createBy;

    private String updateBy;

    @JsonSerialize(using = CustomDateSerializer.class)
    private Date createDate;

    private Date updateDate;

    private Integer isDelete;

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

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public String getNewsContent() {
        return newsContent;
    }

    public void setNewsContent(String newsContent) {
        this.newsContent = newsContent;
    }

    public Integer getNewsType() {
        return newsType;
    }

    public void setNewsType(Integer newsType) {
        this.newsType = newsType;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }
}
