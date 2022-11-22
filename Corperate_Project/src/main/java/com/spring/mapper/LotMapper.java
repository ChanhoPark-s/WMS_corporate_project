package com.spring.mapper;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.spring.domain.LotVO;
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;

public interface LotMapper {
	public int getTotalCount(SearchVO searchvo);
	public ArrayList<LotVO> GetAll(Client_Paging pageInfo);
	public int deleteOne(String lot_no);
	public LotVO getOne(String code);
	public List<LotVO> getLot(int no);
}