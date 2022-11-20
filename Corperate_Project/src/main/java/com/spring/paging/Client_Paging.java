package com.spring.paging;

import lombok.Data;

@Data
public class Client_Paging {
	//페이징 관련 변수	
	private int totalCount = 0 ; //총 레코드 건수
	private int totalPage = 0 ; //전체 페이지 수
	private int pageNumber = 0 ; //보여줄 페이지 넘버(표현 가능한 페이지는 1부터 totalPage까지이다.)
	private int pageSize = 0 ; //한 페이지에 보여줄 건수
	private int beginRow = 0 ; //현재 페이지의 시작 행
	private int endRow = 0 ; //현재 페이지의 끝 행
	private int pageCount = 5 ; // 한 화면에 보여줄 페이지 링크 수 (페이지 갯수)
	private int beginPage = 0 ; //페이징 처리 시작 페이지 번호
	private int endPage = 0 ; //페이징 처리 끝 페이지 번호
	private int offset = 0 ;
	private int limit = 0 ;
	private String url = "" ; //예시 ==>  http://localhost:9191/MyServlet/list.do
	private String pagingHtml = "";//하단의 숫자 페이지 링크
	
	private String whatColumn = "" ; //검색 모드(작성자, 글제목, 전체 검색은 all) 등등
	private String keyword = "" ; //검색할 단어 
	
	public String getPagingHtml() {
		
		return pagingHtml;

	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}


	public Client_Paging(
			String _pageNumber, 
			String _pageSize,  
			int totalCount,
			String url, 
			String whatColumn, 
			String keyword,
			int beginRow
			) {		

		//System.out.println("Client_Paging에서의 whatColumn:"+whatColumn);
		//System.out.println("Client_Paging에서의 키워드:"+keyword);
		
		if(  _pageNumber == null || _pageNumber.equals("null") || _pageNumber.equals("")  ){
			System.out.println("_pageNumber:"+_pageNumber); // null
			_pageNumber = "1" ;
		}
		this.pageNumber = Integer.parseInt( _pageNumber ) ; 

		if( _pageSize == null || _pageSize.equals("null") || _pageSize.equals("") ){
			_pageSize = "10" ; // 한 페이지에 보여줄 레코드 갯수
		}		
		this.pageSize = Integer.parseInt( _pageSize ) ;
		
		//this.limit = pageSize ; // 한 페이지에 보여줄 레코드 갯수

		this.totalCount = totalCount ; 
		System.out.println("paging에서 totalCount"+totalCount);
		this.totalPage = (int)Math.ceil((double)this.totalCount / this.pageSize) ;
		// 5/2 double 돼서 2.5 ceil(올림) = 3 
		
		if( this.pageNumber > this.totalPage ){
			this.pageNumber = this.totalPage ;
		}
		
		this.beginRow = ( this.pageNumber - 1 )  * this.pageSize ;

		this.beginPage = ( this.pageNumber - 1 ) / this.pageCount * this.pageCount + 1  ;
		this.endPage = this.beginPage + this.pageCount - 1 ;
		
		if( this.endPage > this.totalPage ){
			this.endPage = this.totalPage ;
		}
		
		this.url = url ; //  /ex/list.ab
		this.whatColumn = whatColumn ;
		this.keyword = keyword ;
		
		this.pagingHtml = getPagingHtml(url) ;// 이변수안에 밑에 페이지 숫자랑 다음 이전 같은걸  문자열로 만들어서 넘겨줌
	
	}
	
	private String getPagingHtml( String url ){ //페이징 문자열을 만든다.
		String result = "" ;
		String added_param = "&whatColumn=" + whatColumn + "&keyword=" + keyword; 
		
		result += "<ul class='pagination pagination-borderless justify-content-end' align='center'>";
		result += "<li class='page-item'>";
		
		if (this.beginPage != 1) { // 앞쪽, pageSize:한 화면에 보이는 레코드 수
			// 1번페이지로 이동
			result += "<a class='page-link d-flex align-items-center px-2' href='" + url +"?pageNumber=" + ( 1 ) + "&pageSize=" + this.pageSize + added_param + "'>";
			result += "<svg width='20' height='20' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20' fill='currentColor'>";
			result += "<path xmlns='http://www.w3.org/2000/svg' id='svg_1' clip-rule='evenodd' d='m9.49241,5.293a1,1 0 0 1 0,1.414l-3.293,3.293l3.293,3.293a1,1 0 0 1 -1.414,1.414l-4,-4a1,1 0 0 1 0,-1.414l4,-4a1,1 0 0 1 1.414,0z' fill-rule='evenodd'/>";
			result += "<path xmlns='http://www.w3.org/2000/svg' id='svg_2' clip-rule='evenodd' d='m15.48719,5.37988a1,1 0 0 1 0,1.414l-3.293,3.293l3.293,3.293a1,1 0 0 1 -1.414,1.414l-4,-4a1,1 0 0 1 0,-1.414l4,-4a1,1 0 0 1 1.414,0z' fill-rule='evenodd'/>";
			result += "</svg></a></li>";
			//이전페이지로 이동
			result += "<li class='page-item'>";
			result += "<a class='page-link d-flex align-items-center px-2' href='" + url + "?pageNumber=" + (this.beginPage - 1 ) + "&pageSize=" + this.pageSize + added_param + "'>";
			result += "<svg width='20' height='20' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20' fill='currentColor'>";
			result += "<path fill-rule='evenodd' d='M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z' clip-rule='evenodd'></path>";
			result += "</svg>";
			result += "</a></li>"; 		
		}

		//가운데
		for (int i = this.beginPage; i <= this.endPage ; i++) {
			var active = (this.pageNumber == i ? "active" : "");
			result += "<li class='page-item " + active +"'>" + "<a class='page-link' href='"+url+"?pageNumber="+ i +"&pageSize=" + this.pageSize 
					+ added_param +"'>" + i + "</a></li>";
		}
		//System.out.println("토탈페이지:"+this.totalPage);
		
		//뒤로가기
		if ( this.endPage != this.totalPage) { // 뒤쪽
			// 다음페이지
			result += "<li class='page-item'>";
			result += "<a  class='page-link d-flex align-items-center px-2' href='" + url + "?pageNumber=" + (this.endPage + 1 ) + "&pageSize=" + this.pageSize + added_param + "'>";
			result += "<svg width='20' height='20' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20' fill='currentColor'>";
			result += "<path fill-rule='evenodd' d='M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z' clip-rule='evenodd'></path>";
			result += "</svg>";
			result += "</a></li>";
			
			// 맨 뒤 페이지
			result += "<li class='page-item'>";
			result += "<a class='page-link d-flex align-items-center px-2' href='" + url + "?pageNumber=" + (this.totalPage ) + "&pageSize=" + this.pageSize + added_param + "'>" ;
			result += "<svg width='20' height='20' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20' fill='currentColor'>";
			result += "<path id='svg_1' clip-rule='evenodd' d='m4.29467,14.707a1,1 0 0 1 0,-1.414l3.293,-3.293l-3.293,-3.293a1,1 0 0 1 1.414,-1.414l4,4a1,1 0 0 1 0,1.414l-4,4a1,1 0 0 1 -1.414,0z' fill-rule='evenodd'/>";
			result += "<path id='svg_2' clip-rule='evenodd' d='m10.68001,14.87357a1,1 0 0 1 0,-1.414l3.293,-3.293l-3.293,-3.293a1,1 0 0 1 1.414,-1.414l4,4a1,1 0 0 1 0,1.414l-4,4a1,1 0 0 1 -1.414,0z' fill-rule='evenodd'/>";
			result += "</svg>";
			result += "</a></li>";
		}		
		
		return result ;
	}	
	
}
