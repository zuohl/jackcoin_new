package com.jackcoin.dao;

import com.jackcoin.bean.MatchUser;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by zuohl on 2016/5/21.
 */
public interface MatchUserDao extends CrudRepository<MatchUser, Integer> {
}
