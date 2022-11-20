package com.ordersheet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.domain.OrderSheetDetailVO;
import com.spring.domain.OrderSheetVO;
import com.spring.service.OrderSheetService;


@RestController
@RequestMapping("/ordersheet/*")
public class OrderSheetRestController {
	
	@Autowired
	private OrderSheetService service;
			
	//testURL : http://localhost:8080/ordersheet/orderdetail/11
	@GetMapping(value={"/orderdetail/{mainNo}"}, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<OrderSheetDetailVO>> detailList(@PathVariable("mainNo") int mainNo) {				
		return new ResponseEntity<>(service.getSubList(mainNo), HttpStatus.OK);		
	}
	
	@GetMapping(value={"/{mainNo}"}, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<OrderSheetVO> mainList(@PathVariable("mainNo") int mainNo) {				
		return new ResponseEntity<>(service.selectOneByMainNo(mainNo), HttpStatus.OK);		
	}

}