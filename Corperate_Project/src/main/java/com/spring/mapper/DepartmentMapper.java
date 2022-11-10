package com.spring.mapper;

import java.util.List;

import com.spring.domain.DepartmentVO;

//이 인터페이스는 root-context.xml에서 mybatis-spring 으로 스캔해줌
public interface DepartmentMapper {
	public List<DepartmentVO> selectAll(); 		// 부서추가
	public int insert(DepartmentVO vo); 		// 부서추가
	public int update(DepartmentVO vo); 		// 부서수정
}