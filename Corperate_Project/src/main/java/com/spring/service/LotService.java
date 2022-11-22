package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.JsonArray;
import com.spring.domain.LotVO;
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;

public interface LotService {

	public int getTotalCount(SearchVO searchvo);
	public ArrayList<LotVO> GetAll(Client_Paging pageInfo);
	public int deleteOne(String item_no);
	public LotVO getOne(String code);
	
}
