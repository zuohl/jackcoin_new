package com.jackcoin.bean;

import com.fasterxml.jackson.databind.deser.Deserializers;

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
}
