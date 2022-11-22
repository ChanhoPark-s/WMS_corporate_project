package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		ArrayList<Integer> orderDetailList = vo.getOrder_detail_no();
		ArrayList<Integer> wareList = vo.getWare_no();
		
		int len = noList.size();
		System.out.println("len:"+len);
		
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
			int orderDetailNo = 0;
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
		List<Purchase_sheetVO> list = mapper.getListWithPaging(cri); 
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

}
