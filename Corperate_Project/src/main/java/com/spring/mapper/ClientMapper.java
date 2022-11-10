package com.spring.mapper;

import java.util.ArrayList;

import com.spring.domain.ClientVO;

//이 인터페이스는 root-context.xml에서 mybatis-spring 으로 스캔해줌
public interface ClientMapper {
	
	public int insert(ClientVO vo);
	public ArrayList<ClientVO> GetAll(String select);
}