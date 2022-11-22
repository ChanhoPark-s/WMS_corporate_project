package com.basicinfo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


import org.springframework.web.bind.annotation.RestController;

import com.spring.domain.LotVO;
import com.spring.service.LotRestService;

@RestController
@RequestMapping("/basicinfo/lotRest/*")
public class LotRestController {
	
	@Autowired
	private LotRestService service;
			
		// 판매에서 로트 불러오기
		@GetMapping(value="/getLot/{itemNo}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		public ResponseEntity<List<LotVO>> getLot(@PathVariable("itemNo") int no) {
			System.out.println("?:" + no);
			return new ResponseEntity<>(service.getLot(no), HttpStatus.OK);		
		
		}
	
	}

