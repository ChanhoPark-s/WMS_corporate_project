package com.spring.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.Input_WareHouseVO;
import com.spring.domain.Input_WareHouse_DetailVO;
import com.spring.domain.SearchVO;
import com.spring.domain.SellDetailVO;
import com.spring.domain.SellVO;
import com.spring.mapper.SellMapper;
import com.spring.paging.Client_Paging;

@Service
public class SellServiceImpl implements SellService{
	
	@Autowired
	private SellMapper mapper;

	@Override
	public void insert(SellVO sell) {
		
		System.out.println("SellServiceImpl member_no :"+sell.getMember_no());
		System.out.println("SellServiceImpl order_no :"+sell.getOrder_no());
		System.out.println("SellServiceImpl day :"+sell.getDay());
		
		mapper.insert(sell); // 존재하지 않는 레코드를 얻으려고하면 null이 반환됨
	}
	
	@Override
	public List<SellVO> read() {
		System.out.println("판매 리스트 불러오기");
		return mapper.read(); // 존재하지 않는 레코드를 얻으려고하면 null이 반환됨
	}
	
	@Override
	public void delete(int no) {
		System.out.println("판매 리스트 불러오기");
		mapper.delete(no); // 존재하지 않는 레코드를 얻으려고하면 null이 반환됨
	}
	
	@Override
	public void update(SellVO sell) {
		System.out.println("판매 리스트 불러오기");
		mapper.update(sell); // 존재하지 않는 레코드를 얻으려고하면 null이 반환됨
	}
	
	@Override
	public List<SellDetailVO> getSubList(int mainNo) {
		System.out.println("판매 리스트 불러오기");
		return mapper.getSubList(mainNo); // 존재하지 않는 레코드를 얻으려고하면 null이 반환됨
	}

	@Override
	public int getTotalCount(SearchVO searchvo) {
		return mapper.selectTotalCount(searchvo);
	}

	@Override
	public List<SellVO> getListByPaging(Client_Paging pageInfo) {
		if(pageInfo.getWhatColumn() != null && (pageInfo.getWhatColumn().equals("item") ||pageInfo.getWhatColumn().equals("lot_code"))) {
			ArrayList<Integer> main_nos = mapper.selectAllMainNoByItemName(pageInfo);
			pageInfo.setMain_nos(main_nos);
		}
		// 메인 레코드 가져오기
		List<SellVO> list = mapper.selectListByPaging(pageInfo);
		System.out.println("list.size()"+list.size());
		// 각 메인 레코드에 대해 서브 상품들 이름 묶어서 ㅇㅇ외 N개 라고 출력해주기 위한 과정
		for (SellVO vo : list) {
			int mainNo = vo.getNo();
			List<SellDetailVO> subList = mapper.selectSubAllByMainNo(mainNo); // 수주서에 딸린 상세 품목들
			System.out.println("mainNo:"+mainNo);
			// OO 외 N개 이름 만들어 넣어주는 코드
			if (subList.size() == 1) {
				vo.setTemp_item_name(subList.get(0).getItem_name());
			} else if (subList.size() > 1) {

				int subListSize = subList.size();

				vo.setTemp_item_name(subList.get(0).getItem_name() + " 외 " + (subListSize - 1) + "개");
			}

		}
		return list;
	}
}
