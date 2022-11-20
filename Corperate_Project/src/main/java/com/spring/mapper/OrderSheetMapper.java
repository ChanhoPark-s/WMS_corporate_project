package com.spring.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.OrderSheetDetailVO;
import com.spring.domain.OrderSheetVO;
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;

public interface OrderSheetMapper {
	
	/* OrderSheet */
	public int insertMainSheet(OrderSheetVO vo);
	public int insertDetailSheet(
			@Param("mainSheetNo") int mainSheetNo, 
			@Param("itemNo") int itemNo, 
			@Param("itemAmount") int itemAmount);
	
	public List<OrderSheetVO> selectList(); 							    // 수주서를 페이징 없이 모든 레코드를 가져오는 메소드
	public List<OrderSheetVO> selectListByPaging(Client_Paging pageInfo);	// 모든 레코드에서 검색 및 페이징 한 레코드를 가져오는 메소드
	public int selectTotalCount(SearchVO searchvo);
	
	public ArrayList<Integer> selectAllMainNoByItemName(String keyword); // 품목 이름을 넘겨주면 이를 포함하고 있는 상위 수주서 레코드의 no 들을 반환함
	
	/* OrderSheetDetail */
	public List<OrderSheetDetailVO> selectSubAllByMainNo(int mainNo);
}



// main은 상위 수주서, sub는 하위 디테일 상품들