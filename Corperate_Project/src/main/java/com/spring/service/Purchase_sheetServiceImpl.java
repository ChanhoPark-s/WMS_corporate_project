package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.OrderSheetDetailVO;
import com.spring.domain.PageDTO;
import com.spring.domain.Purchase_sheetVO;
import com.spring.domain.Purchase_sheet_DetailVO;
import com.spring.domain.SearchVO;
import com.spring.mapper.Purchase_sheetMapper;
import com.spring.paging.Client_Paging;
import com.spring.paging.Criteria;

@Service
public class Purchase_sheetServiceImpl implements Purchase_sheetService{

	@Autowired
	private Purchase_sheetMapper mapper;

	@Override
	public List<Purchase_sheetVO> list() {
		return mapper.selectAll();
	}	

	@Override
	public int insert(Purchase_sheetVO vo) {
		// insert main
		if(mapper.insertMainSheet(vo) != 1) {
			return -1;
		}

		ArrayList<Integer> noList = vo.getItem_no();
		ArrayList<Integer> amountList = vo.getAmount();
		ArrayList<String> orderDetailList = vo.getDetail_no();
		ArrayList<Integer> wareList = vo.getWare_no();

		int len = noList.size();
		System.out.println("len:"+len);
		
		String orderDetailNo = null;
		
		System.out.println("1번");
		for (int i = 0; i < len; i++) {
			int mainSheetNo = vo.getNo();
			System.out.println("2번"+mainSheetNo);
			if(noList.get(i) == null) {
				break;
			}
			int itemNo = noList.get(i);
			System.out.println("3번"+itemNo);
			int itemAmount = amountList.get(i);
			System.out.println("4번"+itemAmount);
			
			if(orderDetailList != null) {
				orderDetailNo = orderDetailList.get(i);
			}
			System.out.println("5번"+orderDetailNo);
			int wareNo = wareList.get(i);
			System.out.println("6번"+wareNo);

			if(mapper.insertDetailSheet(mainSheetNo, itemNo, itemAmount,orderDetailNo,wareNo) != 1) {
				return -1;
			}
		}

		return 1;
	}

	@Override
	public int delete(int no) {
		return mapper.delete(no);
	}

	@Override
	public Purchase_sheetVO selectOne(String no) {
		return mapper.selectOne(no);
	}

	//main pageing
	@Override
	public int getTotalCount(SearchVO searchvo) {
		return mapper.getTotalCount(searchvo);
	}

	@Override
	public List<Purchase_sheetVO> GetAll(Client_Paging pageInfo) {
		return mapper.GetAll(pageInfo);
	}

	//ajax paging
	@Override
	public PageDTO<Purchase_sheetVO> getListPage(Criteria cri) {

		int totalCount = mapper.getCountAll(cri);
		System.out.println("totalCount:"+totalCount);
		List<Purchase_sheetVO> list = mapper.getListWithPaging(cri); 
		// 각 메인 레코드에 대해 서브 상품들 이름 묶어서 ㅇㅇ외 N개 라고 출력해주기 위한 과정
		for(Purchase_sheetVO vo : list) {
			int mainNo = vo.getNo();
			List<OrderSheetDetailVO> subList = mapper.selectSubAllByMainNo(mainNo); // 수주서에 딸린 상세 품목들

			// OO 외 N개 이름 만들어 넣어주는 코드
			if(subList.size() == 1) {
				vo.setTemp_item_name(subList.get(0).getItem_name());
			}else if(subList.size() > 1) {

				int subListSize = subList.size(); 

				vo.setTemp_item_name(subList.get(0).getItem_name() + " 외 " + (subListSize-1) + "개");
			}

			
		}

		PageDTO<Purchase_sheetVO> pageDTO = new PageDTO<Purchase_sheetVO>(totalCount, list, cri);

		return pageDTO;
	}

	//디테일
	public List<Purchase_sheet_DetailVO> selectList(String purchase_sheet_no) {
		return mapper.selectList(purchase_sheet_no);
	}

	@Override
	public int deleteDetail(int no) {
		return mapper.deleteDetail(no);
	}

	@Override
	public void update() {
		mapper.update();
	}
	
	public Purchase_sheetVO selectOneByMainNo(int no) {
		return mapper.selectOneByMainNo(no);
	}

	@Override
	public List<OrderSheetDetailVO> getSubList(int no) {
		return mapper.selectSubAllByMainNo(no);
	}

	@Override
	public void updateStatus(int no) {
		mapper.updateStatus(no);
		mapper.updateDetailStatus(no);
	}

}
