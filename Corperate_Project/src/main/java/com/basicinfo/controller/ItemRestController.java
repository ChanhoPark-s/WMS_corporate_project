package com.basicinfo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.domain.ItemVO;
import com.spring.domain.PageDTO;
import com.spring.paging.Criteria;
import com.spring.service.ItemService;

@RestController
@RequestMapping("/basicinfo/item/*")
public class ItemRestController {
	
	@Autowired
	private ItemService service;
		
	//testURL : http://localhost:8080/basicinfo/client/pages/1/10/owner/이재용
	@GetMapping(
			value={"/pages/{pageNum}/{amount}", "/pages/{pageNum}/{amount}/{whatColumn}", "/pages/{pageNum}/{amount}/{whatColumn}/{keyword}"}, 
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<PageDTO<ItemVO>> clientlist(
			@PathVariable("pageNum") int pageNum,
			@PathVariable("amount") int amount,
			@PathVariable(value="whatColumn", required = false) String whatColumn,
			@PathVariable(value="keyword", required = false) String keyword) {				
		

		//System.out.println(pageNum + " " + amount + " " + whatColumn + " " + keyword);
		
		Criteria cri = new Criteria(pageNum, amount, whatColumn, keyword);
		
		return new ResponseEntity<>(service.getListPage(cri), HttpStatus.OK);		
	}
}