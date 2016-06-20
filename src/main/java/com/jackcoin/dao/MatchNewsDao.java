package com.jackcoin.dao;

import com.jackcoin.bean.MatchNews;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by zuohl on 2016/5/21.
 */
public interface MatchNewsDao extends PagingAndSortingRepository<MatchNews, Integer> {
}
