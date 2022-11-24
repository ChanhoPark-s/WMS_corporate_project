package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.SearchVO;
import com.spring.domain.SellDetailVO;
import com.spring.paging.Client_Paging;

public interface SellDetailMapper {


	public List<SellDetailVO> read();

	public List<SellDetailVO> selectAll(Client_Paging pageInfo);
	
	public int getTotalCount(SearchVO searchvo);
	
	public List<SellDetailVO> selectSubListByOrderSheetNo(int orderSheetNo);

	void insert(@Param ("itemNo")int itemNo, @Param ("itemAmount")int itemAmount,@Param ("itemPrice") int itemPrice,@Param ("lot_code") String lot_code,@Param ("order_sheet_no") int order_sheet_no);
}
