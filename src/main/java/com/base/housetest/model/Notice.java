package com.base.housetest.model;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Notice {

    @javax.persistence.Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;
    private String title;                  //标题
    private String releasePeople;        //发布人
    private String content;             //内容
    @Temporal(TemporalType.DATE)
    private Date releaseTime;           //发布时间

    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        Id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getReleasePeople() {
        return releasePeople;
    }

    public void setReleasePeople(String releasePeople) {
        this.releasePeople = releasePeople;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(Date releaseTime) {
        this.releaseTime = releaseTime;
    }

    @Override
    public String toString() {
        return "Notice{" +
                "Id=" + Id +
                ", title='" + title + '\'' +
                ", releasePeople='" + releasePeople + '\'' +
                ", content='" + content + '\'' +
                ", releaseTime=" + releaseTime +
                '}';
    }
}
