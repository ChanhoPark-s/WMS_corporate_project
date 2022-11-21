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
import com.spring.service.Input_WareHouse_DetailService;


@RestController
@RequestMapping("/input_warehouse/*")
public class Input_WareHouseRestController {
	
	@Autowired
	private Input_WareHouse_DetailService service;
			
	//testURL : http://localhost:8080/ordersheet/orderdetail/11
	@GetMapping(value={"/input_warehousedetail/{mainNo}"}, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<Input_WareHouse_DetailVO>> clientlist(@PathVariable("mainNo") int mainNo) {				
		return new ResponseEntity<>(service.getSubList(mainNo), HttpStatus.OK);		 
	}

}