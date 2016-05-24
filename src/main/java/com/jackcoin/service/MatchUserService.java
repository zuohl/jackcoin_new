package com.jackcoin.service;

import com.jackcoin.bean.Constants;
import com.jackcoin.bean.MatchUser;
import com.jackcoin.dao.MatchUserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * Created by zuohl on 2016/5/21.
 */
@Service
@Transactional
public class MatchUserService {

    @Autowired
    private MatchUserDao matchUserDao;

    public MatchUser addMatchUser(MatchUser matchUser) {
        matchUser.setCreateDate(new Date());
        //写死紧急联系人和紧急联系人电话
        matchUser.setEmergencyContact(Constants.EMERGENCY_CONTACT);
        matchUser.setEmergencyContactPhone(Constants.EMERGENCY_CONTACT_PHONE);
        return matchUserDao.save(matchUser);
    }
}
