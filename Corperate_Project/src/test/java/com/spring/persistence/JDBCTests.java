package com.spring.persistence;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;
import org.junit.Test;

public class JDBCTests {

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
				"jdbc:oracle:thin:@(description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1521)(host=adb.ap-chuncheon-1.oraclecloud.com))(connect_data=(service_name=ge7cc9d1108df0a_orcl_medium.adb.oraclecloud.com))(security=(ssl_server_dn_match=yes)))",
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