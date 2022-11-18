package com.spring.paging;

import lombok.Data;

@Data
public class PagingSong {

	private int totalCount = 0 ; //총 레코드 건수
	private int totalPage = 0 ; //전체 페이지 수
	private int currentPage = 1 ; //보여줄 페이지 넘버(표현 가능한 페이지는 1부터 totalPage까지이다.)
	private int pageSize = 10 ; //한 페이지에 보여줄 건수
	private int beginRow = 0 ; //현재 페이지의 시작 행
	private int endRow = 0 ; //현재 페이지의 끝 행
	
	private int pageCount = 10 ; // 한 화면에 보여줄 페이지 링크 수 (페이지 갯수)
	private int beginPage = 0 ; //페이징 처리 시작 페이지 번호
	private int endPage = 0 ; //페이징 처리 끝 페이지 번호
	private String url = "" ; //예시 ==>  http://localhost:9191/MyServlet/list.do
	
	private int prevPage = 0;
	private int nextPage = 0;
	
	private String whatColumn = "" ;
	private String keyword = "" ;
	
	public PagingSong(
			String currentPage, 
			String pageSize,  
			int totalCount,
			String url,
			String whatColumn, 
			String keyword,
			int beginRow
			) {		
		
		if(  currentPage == null || currentPage.equals("null") || currentPage.equals("")  ){
			System.out.println("currentPage:"+currentPage); // null
			currentPage = "1" ;
		}
		this.currentPage = Integer.parseInt( currentPage ) ; 

		if( pageSize == null || pageSize.equals("null") || pageSize.equals("") ){
			pageSize = "10" ; 
		}		
		this.pageSize = Integer.parseInt( pageSize ) ;

		this.totalCount = totalCount ; 
		this.totalPage = (int)Math.ceil((double)this.totalCount / this.pageSize) ;
		
		if( this.currentPage > this.totalPage ){
			this.currentPage = this.totalPage ;
		}
		
		this.beginRow = ( this.currentPage - 1 )  * this.pageSize ;

		this.beginPage = ( this.currentPage - 1 ) / this.pageCount * this.pageCount + 1  ;
		this.endPage = this.beginPage + this.pageCount - 1 ;
		
		if( this.endPage > this.totalPage ){
			this.endPage = this.totalPage ;
		}
		
		this.prevPage = beginPage - 1;
		
		this.url = url ;
		this.whatColumn = whatColumn ;
		this.keyword = keyword ;
	
	}
}
