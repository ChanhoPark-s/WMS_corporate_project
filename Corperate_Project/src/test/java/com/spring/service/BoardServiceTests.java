package com.spring.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class) // 테스트시 필요한 클래스를 지정해줌. ApplicationContext를 만들고 관리하는 작업을 위해 해당 클래스를 이용하겠다는 의미
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") // 스프링이 실행되면서 어떤 설정정보를 읽어 들여야 하는지를 명시
@Log4j	// log 객체 생성
public class BoardServiceTests {

//	@Setter(onMethod_ = {@Autowired})
//	private BoardService service;
//	
//	@Test
//	public void testExist() { // 제대로 주입이 가능한지 부터 테스트
//		log.info(service);
//		assertNotNull(service);
//	}
//	
//	@Test	/* BoardServiceImpl에서 정의한 메소드 테스트 */
//	public void testRegister() { 
//		BoardVO board = new BoardVO();
//		board.setTitle("새로 작성하는 글");
//		board.setContent("새로 작성하는 내용");
//		board.setWriter("newbie");
//		
//		service.register(board); // insertSelectKey 방식으로 처리되는 register 메소드 덕에 시퀀스로 사용된 bno 값을 얻을 수 있음
//		
//		log.info("생성된 게시물의 번호 : " + board.getBno());
//	}
//	
//	@Test	/* BoardServiceImpl에서 정의한 메소드 테스트 */
//	public void testGetList() { 
//		//service.getList().forEach(borad -> log.info(borad));
//		service.getList(new Criteria(2,10)).forEach(borad -> log.info(borad));
//	}
//	
//	@Test	/* BoardServiceImpl에서 정의한 메소드 테스트 */
//	public void testGet() { 
//		service.get(2L);
//	}
//	
//	@Test	/* BoardServiceImpl에서 정의한 메소드 테스트 */
//	public void testUpdate() { 
//		BoardVO board = service.get(1L);
//		
//		if(board == null) {
//			return;
//		}
//		
//		board.setTitle("제목을 수정합니다.");
//		log.info("MODIFY RESULT: " + service.modify(board));
//	}
//	
//	@Test	/* BoardServiceImpl에서 정의한 메소드 테스트 */
//	public void testDelete() { 
//		// 게시물 번호의 존재 여부를 확인하고 테스트 해야함
//		log.info("REMOVE RESULT :" + service.remove(2L));
//	}
	
	
	

}
