package com.spring.mapper;

import com.spring.domain.BoardVO;

//이 인터페이스는 root-context.xml에서 mybatis-spring 으로 스캔해줌
public interface BoardMapper {
	
	public BoardVO read(Long bno); 				// 게시물 조회
	
}
