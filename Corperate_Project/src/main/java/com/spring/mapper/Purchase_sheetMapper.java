package com.spring.mapper;

import java.util.List;

import com.spring.domain.Purchase_sheetVO;

//이 인터페이스는 root-context.xml에서 mybatis-spring 으로 스캔해줌
public interface Purchase_sheetMapper {
	public List<Purchase_sheetVO> selectAll(); 		// 발주조회
	public Purchase_sheetVO selectOne(String no);	// 발주선택
	public int insert(Purchase_sheetVO vo); 		// 발주추가
	public int update(Purchase_sheetVO vo); 		// 발주수정
	public int delete(Purchase_sheetVO vo); 		// 발주삭제
	
}