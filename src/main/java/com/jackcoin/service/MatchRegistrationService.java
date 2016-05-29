package com.jackcoin.service;

import com.jackcoin.bean.Constants;
import com.jackcoin.bean.MatchRegistrationRecords;
import com.jackcoin.dao.MatchRegistrationDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * Created by zuohl on 2016/5/25.
 */
@Service
@Transactional
public class MatchRegistrationService {

    @Autowired
    private MatchRegistrationDao matchRegistrationDao;

    public MatchRegistrationRecords addMatchRegistration(MatchRegistrationRecords records) {
        records.setCreateDate(new Date());
        records.setIsDelete(Constants.DELETE_FLAG_NO);
        return matchRegistrationDao.save(records);
    }
}
