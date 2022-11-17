package com.spring.service;

import org.springframework.stereotype.Service;

import com.spring.domain.Input_WareHouseVO;

@Service
public interface Input_WareHouseService{

	public int save(Input_WareHouseVO vo);

}
