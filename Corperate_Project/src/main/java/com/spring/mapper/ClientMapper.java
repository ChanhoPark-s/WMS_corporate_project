package com.spring.mapper;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.spring.domain.ClientVO;
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;
import com.spring.paging.Criteria;

//이 인터페이스는 root-context.xml에서 mybatis-spring 으로 스캔해줌
public interface ClientMapper {
	
	public int insert(ClientVO vo);
	public ArrayList<ClientVO> GetAll(Client_Paging pageInfo);
	public ClientVO selectOne(String item_no);
	public int deleteOne(String item_no);
	public int update(ClientVO VO);
	public int getTotalCount(SearchVO searchvo);
	public List<ClientVO> getAllClient();
	public int checkCode(String code);
	public int selectDelete(String[] parameterValues);
	public ClientVO selectByCode(String code);
	
	/* ajax paging */
	public List<ClientVO> getListWithPaging(@Param("cri") Criteria cri);
	public int getCountAll(@Param("cri") Criteria cri);
}