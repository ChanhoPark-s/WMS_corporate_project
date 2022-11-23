package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.OrderSheetDetailVO;
import com.spring.domain.OrderSheetVO;
import com.spring.domain.PageDTO;
import com.spring.domain.SearchVO;
import com.spring.mapper.OrderSheetMapper;
import com.spring.paging.Client_Paging;
import com.spring.paging.Criteria;

@Service
public class OrderSheetServiceImpl implements OrderSheetService{

	@Autowired
	private OrderSheetMapper mapper;
	
	@Override
	public int addOrderSheet(OrderSheetVO vo) {
		
		// 이 쿼리 내부에서는 vo 객체의 no 멤버변수가 setNo(시퀀스) 되어짐.
		if(mapper.insertMainSheet(vo) != 1) {
			return -1;
		}
				
		ArrayList<Integer> itemNoList = vo.getItem_no();
		ArrayList<Integer> amountList = vo.getAmount();
		
		int len = itemNoList.size();

		for (int i = 0; i < len; i++) {
			int mainSheetNo = vo.getNo();
			int itemNo = itemNoList.get(i);
			int itemAmount = amountList.get(i);
			
			if(mapper.insertDetailSheet(mainSheetNo, itemNo, itemAmount) != 1) {
				return -1;
			}
		}
		
		return 1;
	}
	
	@Override
	public int updateOrderSheet(OrderSheetVO vo) {
		mapper.updateMainSheet(vo);
		
		// 하위품목 전부 삭제
		mapper.deleteOrderDetailSheet(vo.getNo());
		
		
		// 하위품목 재삽입
		ArrayList<Integer> itemNoList = vo.getItem_no();
		ArrayList<Integer> amountList = vo.getAmount();
		
		int len = itemNoList.size();
		
		System.out.println("len: " + len);
		
		for (int i = 0; i < len; i++) {
			int mainSheetNo = vo.getNo();
			int itemNo = itemNoList.get(i);
			int itemAmount = amountList.get(i);
			
			mapper.insertDetailSheet(mainSheetNo, itemNo, itemAmount);
		}
		
		return 1;
	}

	@Override
	public int deleteOrderSheet(int no) {
		int r1 = -1;
		int r2 = -1;
		
		r1 = mapper.deleteOrderSheet(no);			// main 행 삭제
		r2 = mapper.deleteOrderDetailSheet(no);		// sub 품목들 삭제
		
		if(r1 >= 0 && r2 >= 0) {
			return 1;
		}else {
			return -1;
		}
	}	
	
	@Override
	public List<OrderSheetVO> getList() {
		
		// 메인 레코드 가져오기
		List<OrderSheetVO> list = mapper.selectList();
		
		// 각 메인 레코드에 대해 서브 상품들 이름 묶어서 ㅇㅇ외 N개 라고 출력해주기 위한 과정
		for(OrderSheetVO vo : list) {
			int total_price = 0;
			int mainNo = vo.getNo();
			List<OrderSheetDetailVO> subList = mapper.selectSubAllByMainNo(mainNo); // 수주서에 딸린 상세 품목들
			
			// OO 외 N개 이름 만들어 넣어주는 코드
			if(subList.size() == 1) {
				vo.setTemp_item_name(subList.get(0).getItem_name());
			}else if(subList.size() > 1) {
				
				int subListSize = subList.size(); 
				
				vo.setTemp_item_name(subList.get(0).getItem_name() + " 외 " + (subListSize-1) + "개");
			}
			
			// 수주금액 합계 계산하여 넣어주는 코드
			for(OrderSheetDetailVO svo : subList) {
				total_price += svo.getOut_price()*svo.getAmount();
			}
			
			vo.setTotal_price(total_price);
		}
		
		return list;
	}

	@Override
	public List<OrderSheetVO> getListByPaging(Client_Paging pageInfo) {

		// 검색이 item 이름으로 들어온 경우는 따로 처리
		if(pageInfo.getWhatColumn() != null && pageInfo.getWhatColumn().equals("item")) {
			ArrayList<Integer> main_nos = mapper.selectAllMainNoByItemName(pageInfo.getKeyword());
			pageInfo.setMain_nos(main_nos);
		}
		
		// 메인 레코드 가져오기
		List<OrderSheetVO> list = mapper.selectListByPaging(pageInfo);

		// 각 메인 레코드에 대해 서브 상품들 이름 묶어서 ㅇㅇ외 N개 라고 출력해주기 위한 과정
		for (OrderSheetVO vo : list) {
			int total_price = 0;
			int mainNo = vo.getNo();
			List<OrderSheetDetailVO> subList = mapper.selectSubAllByMainNo(mainNo); // 수주서에 딸린 상세 품목들

			// OO 외 N개 이름 만들어 넣어주는 코드
			if (subList.size() == 1) {
				vo.setTemp_item_name(subList.get(0).getItem_name());
			} else if (subList.size() > 1) {

				int subListSize = subList.size();

				vo.setTemp_item_name(subList.get(0).getItem_name() + " 외 " + (subListSize - 1) + "개");
			}

			// 수주금액 합계 계산하여 넣어주는 코드
			for (OrderSheetDetailVO svo : subList) {
				total_price += svo.getOut_price() * svo.getAmount();
			}

			vo.setTotal_price(total_price);
		}

		return list;
	}
	
	@Override
	public int getTotalCount(SearchVO searchvo) {
		// 검색이 item 이름으로 들어온 경우는 따로 처리
		if(searchvo.getWhatColumn() != null && !searchvo.getKeyword().equals("") && searchvo.getWhatColumn().equals("item")) {
			System.out.println("오면 안되는 곳에 들어옴");
			ArrayList<Integer> list = mapper.selectAllMainNoByItemName(searchvo.getKeyword()); 
			return list.size();
		}else {
			return mapper.selectTotalCount(searchvo);
		}
	}
	
	
	@Override
	public List<OrderSheetDetailVO> getSubList(int mainNo) {
		return mapper.selectSubAllByMainNo(mainNo);
	}

	@Override
	public OrderSheetVO selectOneByMainNo(int no) {
		return mapper.selectOneByMainNo(no);
	}

	//ajax paging
	@Override
	public PageDTO<OrderSheetVO> getListPage(Criteria cri) {
		
		// 검색이 item 이름으로 들어온 경우는 따로 처리
		if(cri.getWhatColumn() != null && cri.getWhatColumn().equals("item")) {
			ArrayList<Integer> main_nos = mapper.selectAllMainNoByItemName(cri.getKeyword());
			cri.setMain_nos(main_nos);
			System.out.println("cri.getMain_nos()"+ cri.getMain_nos());
		}
		
		// 메인 레코드 가져오기
		int totalCount = mapper.getCountAll(cri);
		List<OrderSheetVO> list = mapper.getListWithPaging(cri); 
		
		// 각 메인 레코드에 대해 서브 상품들 이름 묶어서 ㅇㅇ외 N개 라고 출력해주기 위한 과정
		for(OrderSheetVO vo : list) {
			int total_price = 0;
			int mainNo = vo.getNo();
			List<OrderSheetDetailVO> subList = mapper.selectSubAllByMainNo(mainNo); // 수주서에 딸린 상세 품목들
			
			// OO 외 N개 이름 만들어 넣어주는 코드
			if(subList.size() == 1) {
				vo.setTemp_item_name(subList.get(0).getItem_name());
			}else if(subList.size() > 1) {
				
				int subListSize = subList.size(); 
				
				vo.setTemp_item_name(subList.get(0).getItem_name() + " 외 " + (subListSize-1) + "개");
			}
			
			// 발주금액 합계 계산하여 넣어주는 코드
			for(OrderSheetDetailVO svo : subList) {
				total_price += svo.getIn_price()*svo.getAmount();
			}
			System.out.println("total_price"+ total_price);
			vo.setTotal_price(total_price);
		}
		
		PageDTO<OrderSheetVO> pageDTO = new PageDTO<OrderSheetVO>(totalCount, list, cri);
		
		return pageDTO;
	}

	@Override
	public void updateStatus(String order_no) {
		mapper.updateStatus(order_no);
		
	}

	@Override
	public int changeStatusOrderSheet(int ordersheetno, int status) {
		return mapper.updateStatusOrderSheet(ordersheetno, status);
	}
}
