package com.spring.domain;

import java.util.List;

import com.spring.paging.Criteria;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PageDTO<T> {
	
	private int totalCount;
	private List<T> list;
	private Criteria cri;
	
}

// Generic이 적용된 클래스 정의방식.
// 이렇게 정의한 이유는 ClientVO의 list를 담거나 MemverVO의 list를 모두 담을 수 있는 재사용성 높은 코드를 작성하기 위함.