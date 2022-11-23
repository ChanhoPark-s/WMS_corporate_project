package com.spring.mapper;

import java.util.ArrayList;
import java.util.List;

import com.spring.domain.Input_WareHouseVO;
import com.spring.domain.Input_WareHouse_DetailVO;
import com.spring.domain.OrderSheetVO;
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;

public interface Input_WareHouseMapper {
	public List<Input_WareHouseVO> selectAll(); 	
	public int insertMainSheet(Input_WareHouseVO vo);
	public int selectNoFromDual();
	public int selectTotalCount(SearchVO searchvo);
	public List<Input_WareHouseVO> selectListByPaging(Client_Paging pageInfo);
	public ArrayList<Integer> selectAllMainNoByItemName(Client_Paging pageInfo);
	public int deleteInputWarehouse(int no);
	public int deleteInputWarehouseDetail(int no);
}
