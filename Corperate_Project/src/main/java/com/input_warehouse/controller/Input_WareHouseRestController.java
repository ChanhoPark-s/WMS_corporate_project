package com.input_warehouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.domain.Input_WareHouse_DetailVO;
import com.spring.domain.OrderSheetDetailVO;
import com.spring.domain.PageDTO;
import com.spring.domain.Purchase_sheetVO;
import com.spring.paging.Criteria;
import com.spring.service.Input_WareHouse_DetailService;


@RestController
@RequestMapping("/input_warehouse/*")
public class Input_WareHouseRestController {
	
	@Autowired
	private Input_WareHouse_DetailService service;
			
	//testURL : http://localhost:8080/ordersheet/orderdetail/11
	@GetMapping(
			value={"/pages/{pageNum}/{amount}", "/pages/{pageNum}/{amount}/{whatColumn}", "/pages/{pageNum}/{amount}/{whatColumn}/{keyword}"}, 
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<PageDTO<Input_WareHouse_DetailVO>> Purchase_sheetlist(
			@PathVariable("pageNum") int pageNum,
			@PathVariable("amount") int amount,
			@PathVariable(value="whatColumn", required = false) String whatColumn,
			@PathVariable(value="keyword", required = false) String keyword) {				
		

		System.out.println(pageNum + " " + amount + " " + whatColumn + " " + keyword);
		
		Criteria cri = new Criteria(pageNum, amount, whatColumn, keyword);
		
		return new ResponseEntity<>(service.getListPage(cri), HttpStatus.OK); 		
	}
	
	@GetMapping(value={"/input_warehousedetail/{mainNo}"}, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<Input_WareHouse_DetailVO>> detailList(@PathVariable("mainNo") int mainNo) {				
		return new ResponseEntity<>(service.getSubList(mainNo), HttpStatus.OK);		
	}

}