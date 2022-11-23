package com.spring.mapper;


import java.util.ArrayList;
import java.util.List;

import com.spring.domain.Input_WareHouse_DetailVO;
import com.spring.domain.SearchVO;
import com.spring.domain.SellDetailVO;
import com.spring.domain.SellVO;
import com.spring.paging.Client_Paging;

public interface SellMapper {
	
		public int insert(SellVO sell);
		
		public List<SellVO> read();

		public void delete(int no); 
		
		public void update(SellVO sell);

		public List<SellDetailVO> getSubList(int mainNo);

		public int selectTotalCount(SearchVO searchvo);

		public List<SellVO> selectListByPaging(Client_Paging pageInfo);

		public List<SellDetailVO> selectSubAllByMainNo(int mainNo);

		public ArrayList<Integer> selectAllMainNoByItemName(Client_Paging pageInfo); 
}
