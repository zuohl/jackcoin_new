package com.jackcoin.dao;

import com.jackcoin.bean.MatchRegistrationRecords;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by zuohl on 2016/5/25.
 */
public interface MatchRegistrationDao extends CrudRepository<MatchRegistrationRecords, Integer> {
}
