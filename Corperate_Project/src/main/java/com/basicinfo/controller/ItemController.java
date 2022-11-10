package com.basicinfo.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

<<<<<<< HEAD
import com.spring.domain.ItemVO;
import com.spring.service.ItemService;



=======
>>>>>>> branch 'main' of https://github.com/ChanhoPark-s/WMS_corporate_project.git
@Controller
@RequestMapping("/basicinfo/item/*")
public class ItemController {
	
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);

	@Autowired
	private ItemService service;
	
	@Autowired
	ServletContext servletContext;
	
	@GetMapping(value="/list")
	public void itemlist(Model model, ItemVO vo) {				
		//model.addAttribute("item", service.get(1L));
		
		String image = vo.getImage();
		System.out.println("image : " + image);
		model.addAttribute("image", image);
		logger.info("/basicinfo/item/list.jsp 반환");
		model.addAttribute("voList",service.list());
		//return "list"; //요청 url과 반환해줄 jsp 파일의 이름이 일치하면 해당 함수는 void 타입이어도 된다. views/basicinfo/department/list.jsp 가 반환됨
	}
	@PostMapping(value="/add")
	public String insert(ItemVO vo) {
		
		String uploadPath = servletContext.getRealPath("/resources");
		System.out.println("uploadPath:"+uploadPath);
		
		MultipartFile multi = vo.getUpload(); //선택한것 multi 들어감
		System.out.println("multi.getName():"+multi.getName());
		System.out.println("multi.getOriginalFilename():"+multi.getOriginalFilename());
		System.out.println("vo.getImage():"+vo.getImage());
		
		int cnt =service.add(vo); //DB테이블에 저장, 이미지를 sql에서 문자로만 확인됨
		System.out.println("insertController cnt:"+cnt);
		
		File file = new File(uploadPath+"/"+multi.getOriginalFilename());
		try {
			multi.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:/basicinfo/item/list";
	}
	
}