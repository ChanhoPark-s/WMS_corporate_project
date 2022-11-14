package com.spring.domain;

import java.util.List;


import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ClientPageDTO {
	
	private int totalCount;
	private List<ClientVO> list;
}
