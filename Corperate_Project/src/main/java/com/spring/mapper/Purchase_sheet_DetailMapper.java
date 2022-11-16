package com.spring.mapper;

import java.util.List;

import com.spring.domain.Purchase_sheetVO;
import com.spring.domain.Purchase_sheet_DetailVO;

//이 인터페이스는 root-context.xml에서 mybatis-spring 으로 스캔해줌
public interface Purchase_sheet_DetailMapper {
	public List<Purchase_sheet_DetailVO> selectAll(); 		// 발주상세조회
	public List<Purchase_sheet_DetailVO> selectList(String purchase_sheet_no);// 발주상세조회
	public int insert(Purchase_sheet_DetailVO vo); 		// 발주상세추가
	public int update(Purchase_sheet_DetailVO vo); 		// 발주상세수정
	public int delete(int no); 		// 발주상세삭제
	
}