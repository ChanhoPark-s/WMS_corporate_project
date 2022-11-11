package com.spring.mapper;

import java.util.ArrayList;
import java.util.Map;

import com.spring.domain.ClientVO;

//이 인터페이스는 root-context.xml에서 mybatis-spring 으로 스캔해줌
public interface ClientMapper {
	
	public int insert(ClientVO vo);
	public ArrayList<ClientVO> GetAll(String select);
	public ClientVO selectOne(String item_no);
	public int deleteOne(String item_no);
	public int update(ClientVO VO);
	public int getAllCount(Map map);
}