package com.spring.mapper;

import java.util.List;

import com.spring.domain.LotVO;

public interface LotRestMapper {

	public List<LotVO> getLot(int no);

}
