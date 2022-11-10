package com.spring.service;

import java.util.List;

import com.spring.domain.RankVO;

public interface RankService {

	public void insert(RankVO rank);

	public List<RankVO> list();

	public void update(RankVO rank);

	public void delete(int no);

	
}
