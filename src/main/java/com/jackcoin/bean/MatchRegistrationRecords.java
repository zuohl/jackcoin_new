package com.jackcoin.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by zuohl on 2016/5/24.
 * 报名纪录表
 */
@Entity
@Table(name = "match_registration_records")
public class MatchRegistrationRecords extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer registrationRecordsId;

    private String nickName;

    private String realName;

    private String mobileNumber;

    //交易账号,关联matchUser里的userId
    private String tradingAccount;

    //推荐人账号,关联matchUser里的userId
    private String referralAccount;

    private Date createDate;

    private Date updateDate;

    private Integer isDelete;

    public Integer getRegistrationRecordsId() {
        return registrationRecordsId;
    }

    public void setRegistrationRecordsId(Integer registrationRecordsId) {
        this.registrationRecordsId = registrationRecordsId;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public String getTradingAccount() {
        return tradingAccount;
    }

    public void setTradingAccount(String tradingAccount) {
        this.tradingAccount = tradingAccount;
    }

    public String getReferralAccount() {
        return referralAccount;
    }

    public void setReferralAccount(String referralAccount) {
        this.referralAccount = referralAccount;
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
}
