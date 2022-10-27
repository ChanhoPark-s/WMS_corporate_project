package com.spring.mapper;

import static org.junit.Assert.*;

import java.util.List;

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
public class BoardMapperTests {

//	@Setter(onMethod_ = @Autowired)
//	private BoardMapper mapper; // 정의해둔 인터페이스로 자동 생성된 적절한 객체 -> 이 객체를 이용해 xml에 존재하는 SQL문을 실행 혹은 @Select 같은 어노테이션 SQL문 실행
//	
//	@Test
//	public void testMapper() {
//		log.info(mapper);
//	}
//	
//	@Test
//	public void testGetList() {
//		mapper.getList().forEach(board -> log.info(board));
//	}
//	
//	@Test
//	public void testPaging() {
//		Criteria cri = new Criteria();
//		//3페이지를 보여주며 10개씩 보여주세요
//		cri.setPageNum(3);
//		cri.setAmount(10);
//		List<BoardVO> list = mapper.getListWithPaging(cri);
//		list.forEach(board -> log.info(board));
//		//mapper.getListWithPaging(cri).forEach(board -> log.info(board)); // 위 두줄을 한줄로 작성해도 됨
//	}
//	
//	@Test
//	public void testInsert() {
//		
//		BoardVO board = new BoardVO();
//		board.setTitle("새로 작성하는 글");
//		board.setContent("새로 작성하는 내용");
//		board.setWriter("newbie");
//		
//		mapper.insert(board);
//		
//		log.info(board);
//	}
//	
//	@Test
//	public void testInsertSelectKey() {
//		BoardVO board = new BoardVO();
//		board.setTitle("새로 작성하는 글");
//		board.setContent("새로 작성하는 내용");
//		board.setWriter("newbie");
//		
//		mapper.insertSelectKey(board); // 실행과 동시에 bno 값이 자동으로 setting 됨
//		
//		log.info(board);
//	}
//	
//	@Test
//	public void testRead() {
//		// 테이블에 존재하는 게시물 번호로 테스트
//		BoardVO board = mapper.read(5L);
//		log.info(board);
//	}
//	
//	@Test
//	public void testDelete() {
//		// 테이블에 존재하는 게시물 번호로 테스트
//		log.info("DELETE COUNT: " + mapper.delete(3L));
//	}
//	
//	@Test
//	public void testUpdate() {
//		BoardVO board = new BoardVO();
//		board.setBno(9L);
//		board.setTitle("수정된 제목");
//		board.setContent("수정된 내용");
//		board.setWriter("user00");
//		
//		int count =  mapper.update(board);
//		log.info("UPDATE COUNT: " + count);
//	}
}
