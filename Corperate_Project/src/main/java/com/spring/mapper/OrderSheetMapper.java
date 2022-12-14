package com.spring.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.MemberVO;
import com.spring.domain.OrderSheetDetailVO;
import com.spring.domain.OrderSheetVO;
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;
import com.spring.paging.Criteria;

public interface OrderSheetMapper {
	
	/* OrderSheet */
	public int insertMainSheet(OrderSheetVO vo);
	public int insertDetailSheet(
			@Param("mainSheetNo") int mainSheetNo, 
			@Param("itemNo") int itemNo, 
			@Param("itemAmount") int itemAmount);
	public int deleteOrderSheet(int no);
	public int deleteOrderDetailSheet(int order_no);						// 상위 수주서 번호로 모든 하위 품목을 지우는 메소드
	public int updateMainSheet(OrderSheetVO vo); 
	
	public List<OrderSheetVO> selectList(); 							    // 수주서를 페이징 없이 모든 레코드를 가져오는 메소드
	public List<OrderSheetVO> selectListByPaging(Client_Paging pageInfo);	// 모든 레코드에서 검색 및 페이징 한 레코드를 가져오는 메소드
	public int selectTotalCount(SearchVO searchvo);
	
	public ArrayList<Integer> selectAllMainNoByItemName(String keyword); // 품목 이름을 넘겨주면 이를 포함하고 있는 상위 수주서 레코드의 no 들을 반환함
	
	public OrderSheetVO selectOneByMainNo(int no);
	
	/* OrderSheetDetail */
	public List<OrderSheetDetailVO> selectSubAllByMainNo(int mainNo);
	
	/* ajax paging */
	public List<OrderSheetVO> getListWithPaging(@Param("cri") Criteria cri);
	public int getCountAll(@Param("cri") Criteria cri);
	
	//수주상태 준비완료 > 발주중
	
	// 사실상 거의 같은 기능으로 수주서의 상태를 변경하는 메소드
	int updateStatusOrderSheet(@Param("ordersheetno") int ordersheetno, @Param("status") int status);
	public void updateStatus(String order_no);
}



// main은 상위 수주서, sub는 하위 디테일 상품들