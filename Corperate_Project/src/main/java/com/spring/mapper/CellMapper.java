package com.spring.mapper;

import java.util.List;

import com.spring.domain.CellVO;
import com.spring.domain.WareHouseAllAreaVO;

public interface CellMapper {
	public List<CellVO> selectAll();			//셀리스트불러오기
	public int insert(WareHouseAllAreaVO vo); 					//셀추가
	public int update(int no); 					//셀수정
	public int delete(int no); 					//셀삭제
	public List<CellVO> getListByRackNo(int no);//셀일련번호에따른 랙일련번호가져오기
	public int deleteCellByNo(String cell_no);	//셀일련번호에따른 삭제
	public WareHouseAllAreaVO selectOneCellByNo(int no);//셀일련번호에따른 셀 한개 상위정보포함 가져오기
	public int updateCellByNo(WareHouseAllAreaVO vo);
	public int checkCode(String code);
}