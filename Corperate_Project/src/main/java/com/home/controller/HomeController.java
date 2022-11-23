package com.home.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.service.CalculationService;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {
	
	@Autowired
	private CalculationService service;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public void home(Model model) {
		
		model.addAttribute("order_Count",service.getAllCount("order"));
		model.addAttribute("order_Money",service.getTotalMoney("order"));
		model.addAttribute("purchase_Count",service.getAllCount("purchase"));
		model.addAttribute("purchase_Money",service.getTotalMoney("purchase"));
		model.addAttribute("sell_Count",service.getAllCount("sell"));
		model.addAttribute("sell_Money",service.getTotalMoney("sell"));
	}
}