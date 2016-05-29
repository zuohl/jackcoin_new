package com.jackcoin.bean;

import javax.persistence.*;
import java.util.Date;
/**
 * Created by zuohl on 2016/5/24.
 * 交易账号表
 */
@Entity
@Table(name = "match_user")
public class MatchUser extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer userId;

    private String name;

    private String cardType;

    private String cardNumber;

    private String recommendBankName;

    private String bankAccount;

    //开户机构
    private String brokerId;

    //投资者类型
    private String investorType;
    //营业执照号
    private String businessLicenseNo;

    //注册资本
    private String registeredCapital;

    //税务登记号
    private String taxRegistrationNo;

    //组织机构代码
    private String organizationCode;

    //法定代表人
    private String legalRepresentative;

    //手机号码
    private String LRphoneNo;

    //业务联系人
    private String businessContacter;

    //企业性质
    private String enterpriseKind;

    //性别
    private String sex;

    //紧急联系人
    private String emergencyContact ;

    //紧急联系人电话
    private String emergencyContactPhone;
    //省/直辖市
    private String province;

    private String city;

    //详细地址
    private String address;

    private String registeredPhoneNo;

    private String email;

    private String fax;

    private String postCode;

    private String idPhotoUrl;

    private Date createDate;

    private Date updateDate;

    private Integer isDelete;

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

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCardType() {
        return cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getRecommendBankName() {
        return recommendBankName;
    }

    public void setRecommendBankName(String recommendBankName) {
        this.recommendBankName = recommendBankName;
    }

    public String getBankAccount() {
        return bankAccount;
    }

    public void setBankAccount(String bankAccount) {
        this.bankAccount = bankAccount;
    }

    public String getBrokerId() {
        return brokerId;
    }

    public void setBrokerId(String brokerId) {
        this.brokerId = brokerId;
    }

    public String getInvestorType() {
        return investorType;
    }

    public void setInvestorType(String investorType) {
        this.investorType = investorType;
    }

    public String getBusinessLicenseNo() {
        return businessLicenseNo;
    }

    public void setBusinessLicenseNo(String businessLicenseNo) {
        this.businessLicenseNo = businessLicenseNo;
    }

    public String getRegisteredCapital() {
        return registeredCapital;
    }

    public void setRegisteredCapital(String registeredCapital) {
        this.registeredCapital = registeredCapital;
    }

    public String getTaxRegistrationNo() {
        return taxRegistrationNo;
    }

    public void setTaxRegistrationNo(String taxRegistrationNo) {
        this.taxRegistrationNo = taxRegistrationNo;
    }

    public String getOrganizationCode() {
        return organizationCode;
    }

    public void setOrganizationCode(String organizationCode) {
        this.organizationCode = organizationCode;
    }

    public String getLegalRepresentative() {
        return legalRepresentative;
    }

    public void setLegalRepresentative(String legalRepresentative) {
        this.legalRepresentative = legalRepresentative;
    }

    public String getLRphoneNo() {
        return LRphoneNo;
    }

    public void setLRphoneNo(String LRphoneNo) {
        this.LRphoneNo = LRphoneNo;
    }

    public String getBusinessContacter() {
        return businessContacter;
    }

    public void setBusinessContacter(String businessContacter) {
        this.businessContacter = businessContacter;
    }

    public String getEnterpriseKind() {
        return enterpriseKind;
    }

    public void setEnterpriseKind(String enterpriseKind) {
        this.enterpriseKind = enterpriseKind;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getEmergencyContact() {
        return emergencyContact;
    }

    public void setEmergencyContact(String emergencyContact) {
        this.emergencyContact = emergencyContact;
    }

    public String getEmergencyContactPhone() {
        return emergencyContactPhone;
    }

    public void setEmergencyContactPhone(String emergencyContactPhone) {
        this.emergencyContactPhone = emergencyContactPhone;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRegisteredPhoneNo() {
        return registeredPhoneNo;
    }

    public void setRegisteredPhoneNo(String registeredPhoneNo) {
        this.registeredPhoneNo = registeredPhoneNo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getPostCode() {
        return postCode;
    }

    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }

    public String getIdPhotoUrl() {
        return idPhotoUrl;
    }

    public void setIdPhotoUrl(String idPhotoUrl) {
        this.idPhotoUrl = idPhotoUrl;
    }
}