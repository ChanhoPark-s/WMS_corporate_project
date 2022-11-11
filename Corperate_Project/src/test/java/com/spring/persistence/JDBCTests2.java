package com.spring.persistence;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;
import org.junit.Test;

public class JDBCTests2 {

	// 테스트 코드 실행되기 전에 먼저 실행되는 부분
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testConnection() {
		try(Connection con = DriverManager.getConnection(
				"jdbc:oracle:thin:@0.tcp.jp.ngrok.io:14008:orcl",
				"admin", 
				"Havetobewinner123")){
			System.out.println(con);
		}catch(Exception e) {
			fail(e.getMessage());
		}
	}
}

/*
다른 테스트와 달리 @RunWith 어노테이션이 존재하지 않는데 그 이유는 위 작업이 스프링 프레임워크의 구동을 필요로 하지 않기 때문이다.
*/