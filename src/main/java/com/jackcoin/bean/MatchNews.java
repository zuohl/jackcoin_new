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
}
