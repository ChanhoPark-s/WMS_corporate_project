package com.spring.mapper;


import java.util.List;

import com.spring.domain.SellVO;

public interface SellMapper {
	
		public int insert(SellVO sell);
		
		public List<SellVO> read();

		public void delete(int no); 
		
		public void update(SellVO sell); 
	
}
