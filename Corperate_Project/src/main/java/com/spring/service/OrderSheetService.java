package com.spring.service;

import java.util.List;

import com.spring.domain.OrderSheetDetailVO;
import com.spring.domain.OrderSheetVO;
import com.spring.domain.PageDTO;
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;
import com.spring.paging.Criteria;

public interface OrderSheetService {
	
	public int addOrderSheet(OrderSheetVO vo);					// 수주서 및 품목 디테일을 동시에 DB에 추가하는 것
	public int updateOrderSheet(OrderSheetVO vo);				// 수주서 및 품목 디테일을 동시에 DB에 수정하는 것
	public int deleteOrderSheet(int no);						// 수주서 삭제(하위의 디테일 상품 레코드도 같이 삭제됨)
	public List<OrderSheetVO> getList();						// 수주서 리스트를 모두 가져오는 것
	public List<OrderSheetVO> getListByPaging(Client_Paging pageInfo); // 모든 레코드에서 페이징 한 레코드를 가져오는 메소드
	public int getTotalCount(SearchVO searchvo);
	public List<OrderSheetDetailVO> getSubList(int mainNo);		// 수주서 번호로 품목 디테일들 모두 가져오는 것	
	public OrderSheetVO selectOneByMainNo(int no);
	int changeStatusOrderSheet(int ordersheetno, int status);
	
	/* ajax paging */
	public PageDTO<OrderSheetVO> getListPage(Criteria cri);
	
	//발주할때 수주참조하면 수주상태 준비완료>발주중
	public void updateStatus(int order_no);
}
