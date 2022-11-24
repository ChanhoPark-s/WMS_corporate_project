package com.sell.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.domain.SellDetailVO;
import com.spring.domain.SellVO;
import com.spring.service.SellDetailService;
import com.spring.service.SellService;

@RestController
@RequestMapping("/sell/origin/detail/*")
public class SellRestController {
		
		@Autowired
		private SellService service;
		
		@Autowired
		private SellDetailService service_detail;
				
		//testURL : http://localhost:8080/ordersheet/orderdetail/11
				@GetMapping(value={"/more/{mainNo}"}, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
				public ResponseEntity<List<SellVO>> clientlist(@PathVariable("mainNo") int mainNo) {	
					System.out.println("mainNo : " + mainNo);
					return new ResponseEntity<>(service.getSubList(mainNo), HttpStatus.OK);		
				}
		
		@GetMapping(value={"/more/ordersheetbase/{orderSheetNo}"}, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		public ResponseEntity<List<SellDetailVO>> list(@PathVariable("orderSheetNo") int orderSheetNo) {	
			return new ResponseEntity<>(service_detail.getSubListByOrderSheetNo(orderSheetNo), HttpStatus.OK);		
		}
}