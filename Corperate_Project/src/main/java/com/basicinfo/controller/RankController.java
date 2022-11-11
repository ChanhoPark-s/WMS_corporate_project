package com.basicinfo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.RankVO;
import com.spring.service.RankService;


@Controller
@RequestMapping("/basicinfo/rank/*")
public class RankController {
	
	private static final Logger logger = LoggerFactory.getLogger(RankController.class);

	@Autowired
	private RankService service;

	@GetMapping(value="/list")
	public void list(Model model) {				
		
		List<RankVO> ranks = service.list();
		model.addAttribute("ranks", ranks);
	}
	
	@PostMapping(value="insert")
	public String insert(Model model, RankVO rank) {
		
		service.insert(rank);
		return "redirect:list";
	}
	
	@PostMapping(value="update")
	public String update(Model model, RankVO rank) {
		
		service.update(rank);
		return "redirect:list";
	}
	
	@GetMapping(value="delete/{no}")
	public String delete(Model model, RankVO rank, @PathVariable(value="no") int no) {
		
		service.delete(no);
		return "redirect:/basicinfo/rank/list";
	}
	
	public List<RankVO> getRankList(Model model) {				
		return service.list();
	}
}