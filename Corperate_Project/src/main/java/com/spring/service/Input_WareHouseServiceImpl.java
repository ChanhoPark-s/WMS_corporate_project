package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.Input_WareHouseVO;
import com.spring.domain.Input_WareHouse_DetailVO;
import com.spring.domain.OrderSheetDetailVO;
import com.spring.domain.SearchVO;
import com.spring.mapper.Input_WareHouseMapper;
import com.spring.mapper.Input_WareHouse_DetailMapper;
import com.spring.paging.Client_Paging;

@Service
public class Input_WareHouseServiceImpl implements Input_WareHouseService{

	@Autowired
	private Input_WareHouseMapper mapper;

	@Autowired
	private Input_WareHouse_DetailMapper detailMapper;

	@Override
	public List<Input_WareHouseVO> list() {
		return mapper.selectAll();
	}	

	@Override
	public int insert(Input_WareHouseVO vo) {
		vo.setNo(mapper.selectNoFromDual());

		mapper.insertMainSheet(vo);
		ArrayList<Integer> noList = vo.getItem_no();
		ArrayList<Integer> amountList = vo.getQTY();

		int len = noList.size();
		System.out.println("len:"+len);
		for (int i = 0; i < len; i++) {
			Input_WareHouse_DetailVO detailVo = new Input_WareHouse_DetailVO();
			String lot_code = detailMapper.getLotCode(noList.get(i));
			System.out.println("lot_code"+lot_code);
			detailVo.setItem_No(noList.get(i));
			detailVo.setQty(amountList.get(i));
			detailVo.setInput_WareHouse_No(vo.getNo());
			detailVo.setPurchase_Sheet_No(vo.getPurchase_Sheet_No());
			detailVo.setArrival_Date(vo.getInput_day());
			detailVo.setWare_No(vo.getWare_no());
			detailVo.setArea_No(vo.getArea_no());
			detailVo.setRack_No(vo.getRack_no());
			detailVo.setCell_No(vo.getCell_no());
			detailVo.setLot_Code(lot_code);
			detailVo.setStatus(vo.getStatus());
			detailMapper.createLot(detailVo);
			if(detailMapper.insert(detailVo) != 1) {
				return -1;
			}
		}
		return 1;
	}

	@Override
	public int getTotalCount(SearchVO searchvo) {
		return mapper.selectTotalCount(searchvo);
	}

	@Override
	public List<Input_WareHouseVO> getListByPaging(Client_Paging pageInfo) {
		
		if(pageInfo.getWhatColumn() != null && pageInfo.getWhatColumn().equals("item")) {
			ArrayList<Integer> main_nos = mapper.selectAllMainNoByItemName(pageInfo.getKeyword());
			pageInfo.setMain_nos(main_nos);
		}
		// 메인 레코드 가져오기
		List<Input_WareHouseVO> list = mapper.selectListByPaging(pageInfo);

		// 각 메인 레코드에 대해 서브 상품들 이름 묶어서 ㅇㅇ외 N개 라고 출력해주기 위한 과정
		for (Input_WareHouseVO vo : list) {
			int mainNo = vo.getNo();
			List<Input_WareHouse_DetailVO> subList = detailMapper.selectSubAllByMainNo(mainNo); // 수주서에 딸린 상세 품목들

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

	@Override
	public int deleteInputWarehouse(int no) {
		int r1 = -1;
		int r2 = -1;
		
		r1 = mapper.deleteInputWarehouse(no);			// main 행 삭제
		r2 = mapper.deleteInputWarehouseDetail(no);		// sub 품목들 삭제
		
		if(r1 >= 0 && r2 >= 0) {
			return 1;
		}else {
			return -1;
		}
	}
}
