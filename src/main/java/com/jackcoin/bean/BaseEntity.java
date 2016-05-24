package com.jackcoin.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by zuohl on 2016/5/24.
 */
public class BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    private Date createDate;

    private Date updateDate;

    private Integer isDelete;

    public static long getSerialVersionUID() {
        return serialVersionUID;
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
