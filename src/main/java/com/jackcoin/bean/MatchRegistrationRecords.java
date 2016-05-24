package com.jackcoin.bean;

import javax.persistence.*;

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
}
