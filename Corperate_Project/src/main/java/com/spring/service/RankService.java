package com.spring.service;

import java.util.List;

import com.spring.domain.RankVO;
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;

public interface RankService {

	public void insert(RankVO rank);

	public List<RankVO> list(Client_Paging pageInfo);

	public void update(RankVO rank);

	public void delete(int no);

	public int getTotalCount(SearchVO vo);

	public List<RankVO> noSearchList();
}
