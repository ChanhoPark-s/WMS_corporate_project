<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 거래처를 선택하는 두번째 모달 -->
<div class="modal fade" id="secondModal" tabindex="-2" >
	<div class="modal-dialog modal-dialog-scrollable modal2" >
		<div class="modal-content" style="width: 800px; right: 200px">
			<div class="modal-header border-0">
				<h5 id="second-modal-title">거래처 입력</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body" style="padding-bottom:0px">
						<div class="modal-footer border-0">
							<form style="margin:auto;text-align:center;" onsubmit="return false;">
								<div class="d-flex gap-1 me-auto flex-wrap">
										<select id="searchWhatColumn" class="form-select" style="width: 140px;">
											<!-- option이 그려지는 부분 -->
						              	</select>
									
						              	<input type="text" id="searchKeyword" class="form-control" placeholder="입력" style="width: 200px; height: 38px;">
										<button type="submit" class="btn btn-light" id="searchBtn"> 검색 </button>
								</div>			
							</form>	
						</div>
						<div class="table-responsive my-1">
							<table class="table align-middle">
								<thead id="secondModalThead">
									<!-- 테이블의 th 들을 그리는 부분 -->
								</thead>
								<tbody id="secondModalTbody">
									<!-- 조회된 레코드들이 javascript 코드에 의해 그려지는 위치 -->
								</tbody>
							</table>
						</div>
						
						<!-- 페이지내이션 -->
						<nav aria-label="Page navigation borderless example">
							<ul class="pagination pagination-borderless justify-content-end" id="modalPageNation">
								<!-- 페이지내이션이 javascript 코드에 의해 그려지는 위치 -->
							</ul>
						</nav>
						
					</div>
				
			<div class="modal-footer border-0">
				<button type="button" class="btn btn-light" data-bs-target="#addOrderSheetModal" data-bs-toggle="modal" data-bs-dismiss="modal">돌아가기</button>
				<button class="btn btn-primary" data-bs-target="#addOrderSheetModal" data-bs-toggle="modal" data-bs-dismiss="modal" id="delivery_data">확인</button>
			</div>
		</div>
	</div>
</div>
        
<script type="text/javascript">
</script>


<!-- 두번째 모달관련 스크립트 코드 -->
<script type="text/javascript">

	/* 전역변수 */
	var secondModalName = ""; 	// member or client or product 이 값은 두번째 모달로 넘어가는 버튼에 의해 변경된다. 
	var pageNum = 1;
	var amount = 10;
	var searchWhatColumn = "";
	var searchKeyword = "";
	var clickedLocation; 		// 두번째 모달에서 품목 선택 후 데이터를 옮겨올 곳을 기억하기 위한 변수 

	/* 첫번째 모달 이 뜰 때 모달 초기화 */
	$("#addOrderSheet").on("click", function(e){
		
		//모달크기초기화
		//$('.modal-xl').removeClass('.modal-xl');
		
		//$(this).find('form')[0].reset();
		
		// 납기일자 초기화
		$("input[name='out_day']").val("");
		
		// 담당자 정보 초기화
		$("input[name='member_no']").val("");
		$("#member_dep_name").val("");
		$("#member_name").val("");
		
		// 거래처 정보 초기화
		$("input[name='client_no']").val("");
		$("#client_code").val("");
		$("#client_name").val("");
		
		// 품목 상세 정보 초기화
		$("#modalItemDetail").empty();
		addRowItemDetail();
	});
	
	//날짜함수
	function leftPad(value) {
	    if (value >= 10) {
	        return value;
	    }

	    return `0${value}`;
	}

	function toStringByFormatting(source, delimiter = '-') {
	    const year = source.getFullYear();
	    const month = leftPad(source.getMonth() + 1);
	    const day = leftPad(source.getDate());

	    return [year, month, day].join(delimiter);
	}
	
	/* 첫번째 모달에서 담당자 선택이 눌렸을 때 이동한 두번째 모달창에서 데이터를 요청하고 관련 화면을 그리는 부분 */
	$("#choiceMemberBtn").on("click", function(e){
		
		pageNum = 1;
		
		// 두번째 모달에서 그려내야할 정보를 지정
		secondModalName = "member";
		console.log("secondModalName: " + secondModalName);
			
		// 두번째 모달의 제목을 지정
		$("#second-modal-title").text("담당자 입력");
		
		// 두번째 모달의 select의 option을 그려내는 코드
		var str = "";
		str += "<option value='' selected>검색 선택</option>";
		str += "<option value='dep'>부서</option>";
		str += "<option value='rank'>직급</option>";
		str += "<option value='name'>이름</option>";
		$("#searchWhatColumn").html(str);
		
		// 초기화 코드
		$("#searchKeyword").val("");
		searchWhatColumn = "";
		searchKeyword = "";
		
		// 두번째 모달의 테이블의 th를 그려내는 코드
		var str = "";
		str += "<tr>";
		str += "<th scope='col'></th>";
		str += "<th scope='col'>부서</th>";
		str += "<th scope='col'>직급</th>";
		str += "<th scope='col'>이름</th>";
		str += "</tr>";
		$("#secondModalThead").html(str);	
		
		// 두번째 모달의 테이블의 레코드를 그려내는 코드
		requestClientRecord();
	});
	
	/* 첫번째 모달에서 거래처 선택이 눌렸을 때 이동한 두번째 모달창에서 데이터를 요청하고 관련 화면을 그리는 부분 */
	$("#choiceClientBtn").on("click", function(e){
		
		pageNum = 1;
		
		// 두번째 모달에서 그려내야할 정보를 지정
		secondModalName = "client";
		console.log("secondModalName: " + secondModalName);
		
		// 두번째 모달의 제목을 지정
		$("#second-modal-title").text("거래처 입력");
		
		// 두번째 모달의 select의 option을 그려내는 코드
		var str = "";
		str += "<option value='' selected>검색 선택</option>";
		str += "<option value='code'>거래처코드</option>";
		str += "<option value='name'>거래처명</option>";
		str += "<option value='owner'>대표자명</option>";
		$("#searchWhatColumn").html(str);
		
		// 초기화 코드
		$("#searchKeyword").val("");
		searchWhatColumn = "";
		searchKeyword = "";
		
		// 두번째 모달의 테이블의 th를 그려내는 코드
		var str = "";
		str += "<tr>";
		str += "<th scope='col'></th>";
		str += "<th scope='col'>거래처코드</th>";
		str += "<th scope='col'>거래처명</th>";
		str += "<th scope='col'>대표자명</th>";
		str += "</tr>";
		$("#secondModalThead").html(str);
		
		// 두번째 모달의 테이블의 레코드를 그려내는 코드
		requestClientRecord();
	});
	
	/* 첫번째 모달에서 품목 선택이 눌렸을 때 이동한 두번째 모달창에서 데이터를 요청하고 관련 화면을 그리는 부분 */
	$("#modalItemDetail").on("click", ".choiceItemBtn",function(e){
		
		pageNum = 1;
		
		clickedLocation = $(this); // 품목입력을 위해 누른 input 의 위치 저장
		console.log("clickedLocation: " + clickedLocation);
		
		// 두번째 모달에서 그려내야할 정보를 지정
		secondModalName = "item";
		console.log("secondModalName: " + secondModalName);
			
		// 두번째 모달의 제목을 지정
		$("#second-modal-title").text("상품 입력");
		
		// 두번째 모달의 select의 option을 그려내는 코드
		var str = "";
		str += "<option value='' selected>검색 선택</option>";
		str += "<option value='code'>품목코드</option>";
		str += "<option value='name'>품목명</option>";
		str += "<option value='client_name'>취급처명</option>";
		$("#searchWhatColumn").html(str);
		
		// 초기화 코드
		$("#searchKeyword").val("");
		searchWhatColumn = "";
		searchKeyword = "";
		
		// 두번째 모달의 테이블의 th를 그려내는 코드
		var str = "";
		str += "<tr>";
		str += "<th scope='col'></th>";
		str += "<th scope='col'>품목코드</th>";
		str += "<th scope='col'>품목명</th>";
		str += "<th scope='col'>취급처명</th>"; // = 발주처
		str += "<th scope='col'>구입단가</th>"; 
		str += "</tr>";
		$("#secondModalThead").html(str);	
		
		// 두번째 모달의 테이블의 레코드를 그려내는 코드
		requestClientRecord();
	});
	
	/* 첫번째 모달에서 수주서 선택이 눌렸을 때 이동한 두번째 모달창에서 데이터를 요청하고 관련 화면을 그리는 부분 */
	$("#choiceOrderBtn").on("click", function(e){
		
		pageNum = 1;
		
		// 두번째 모달에서 그려내야할 정보를 지정
		secondModalName = "order";
		console.log("secondModalName: " + secondModalName);
		
		// 두번째 모달의 제목을 지정
		$("#second-modal-title").text("수주서 선택");
		
		// 두번째 모달의 select의 option을 그려내는 코드
		var str = "";
		str += "<option value='' selected>검색 선택</option>";
		str += "<option value='member'>담당자</option>";
		str += "<option value='client'>수주처</option>";
		str += "<option value='item'>품목명</option>";
		$("#searchWhatColumn").html(str);
		
		// 초기화 코드
		$("#searchKeyword").val("");
		searchWhatColumn = "";
		searchKeyword = "";
		
		// 두번째 모달의 테이블의 th를 그려내는 코드
		var str = "";
		str += "<tr>";
		str += "<th scope='col'></th>";
		str += "<th scope='col'>작성일자</th>";
		str += "<th scope='col'>담당자</th>";
		str += "<th scope='col'>수주처</th>";
		str += "<th scope='col'>품목명</th>";
		str += "<th scope='col'>납기일자</th>";
		str += "<th scope='col'>주문금액합계</th>";
		str += "</tr>";
		$("#secondModalThead").html(str);
		
		// 두번째 모달의 테이블의 레코드를 그려내는 코드
		requestClientRecord();
	});
	
	
	/* ajax로 두번째 모달에서 보여줄 레코드정보를 요청하는 부분 + 화면전환없이 레코드들을 그리는 부분 + 화면전환없이 페이지네이션을 그리는 부분 */
	function requestClientRecord(){
		console.log("요청url : " + "/basicinfo/" + secondModalName + "/pages/"+ pageNum +"/" + amount + "/" + searchWhatColumn + "/" + searchKeyword)
		//요청url
		url = "/basicinfo/";
		if (secondModalName == "order"){
			url = "/ordersheet/";
		}
		
		$.getJSON(url + secondModalName + "/pages/"+ pageNum +"/" + amount + "/" + searchWhatColumn + "/" + searchKeyword,  
 			function(resdata){
				console.log("list: " + resdata.list); 	  			// 1페이지 레코드들이 담긴 객체
 				console.log("totalCount: " + resdata.totalCount); 	// 검색조건으로 뽑힌 총 레코드 수
 				console.log("cri: " + resdata.cri); 	  			// 검색에 사용된 기준정보가 담긴 객체
 				
 				paintRecord(resdata.list); 							// 레코드들을 그리는 함수
 				paintPageNation(resdata.totalCount, resdata.cri); 	// 페이지네이션을 그리는 함수
 				
 			}).fail(function(xhr, status, err){
 					alert("데이터 조회실패");
 			});	
	}
	
	/* 두번째 모달의 레코드들을 그리는 함수 */
	function paintRecord(list){

			var str = "";
			
			if(secondModalName == "member"){
				for(var i = 0, len = list.length || 0; i < len; i++){
					str += "<tr>";
					str += "<td><input class='form-check-input' type='radio' name='clientRadio' value=" + list[i].name + "></td>";
					str += "<td style='display:none'>" + list[i].no +"</td>";
					str += "<td>" + list[i].dep_name +"</td>";
					str += "<td>" + list[i].rank_name +"</td>";
					str += "<td>" + list[i].name +"</td>";
					str += "</tr>";
				}
			}
			
			else if(secondModalName == "client"){
				for(var i = 0, len = list.length || 0; i < len; i++){
					str += "<tr>";
					str += "<td><input class='form-check-input' type='radio' name='clientRadio' value=" + list[i].name + "></td>";
					str += "<td style='display:none'>" + list[i].no +"</td>";
					str += "<td>" + list[i].code +"</td>";
					str += "<td>" + list[i].name +"</td>";
					str += "<td>" + list[i].owner +"</td>";
					str += "</tr>";
				}
			}
			
			else if(secondModalName == "item"){
				for(var i = 0, len = list.length || 0; i < len; i++){
					str += "<tr>";
					str += "<td><input class='form-check-input' type='radio' name='clientRadio' value=" + list[i].name + "></td>";
					str += "<td style='display:none'>" + list[i].no +"</td>";
					str += "<td>" + list[i].code +"</td>";
					str += "<td>" + list[i].name +"</td>";
					str += "<td>" + list[i].client_name +"</td>";
					str += "<td>" + numberWithCommas(list[i].in_price) +"원</td>";
					str += "</tr>";
				}
			}
			
			else if(secondModalName == "order"){
				

				//toStringByFormatting(new Date(2021, 0, 1));
				// 2021-01-01
				
				//$('.modal2').attr('class','modal-xl');
				
				itemNo = new Array();
				
				for(var i = 0, len = list.length || 0; i < len; i++){
					
					
					str += "<tr>";
					str += "<td><input class='form-check-input' type='radio' name='clientRadio'></td>";
					str += "<td style='display:none'>" + list[i].no +"</td>";
					str += "<td>";
					str += toStringByFormatting(new Date(list[i].day));
					str += "</td>";
					str += "<td>" + list[i].member_name +"</td>";
					str += "<td>" + list[i].client_name +"</td>";
					str += "<td>" + list[i].temp_item_name + "</td>";
					str += "<td>" ;
					str += toStringByFormatting(new Date(list[i].out_day));
					str += "</td>";
					str += "<td>" + numberWithCommas(list[i].total_price) +"원</td>";
					str += "</tr>";
					
					
				}
			}
			
			if(list.length == 0){
				str = "<tr><td colspan='7' style='text-align:center'>검색결과가 없습니다</td></tr>";
			}
			
			$("#secondModalTbody").html(str);
	}
	
	/* 두번째 모달의 페이지네이션을 그리는 함수 */
	function paintPageNation(totalCount, cri){
		
		var str = ""; 
		
		var pageCount = 5; // 한번에 보여줄 페이지번호 개수 
		
		//pageNum에 따른 cri.amount 단위의 시작페이지, 끝페이지를 구함
		var endPageNum = Math.ceil(pageNum / pageCount) * pageCount;// javascript 에서 pageNum / cri.amount 결과는 그냥 0.1 
		var startPageNum = endPageNum - (pageCount-1);
		var lastPageNum = Math.ceil(totalCount / cri.amount	);
		
		var isNeedFirst = pageNum > 5;
		var isNeedPrev = (startPageNum != 1);
		var isNeedNext = false;
		var isNeedEnd = true; 
		
		//5단위의 endPageNum을 그대로 사용하면 안되는 경우 endPageNum을 다시구함 
		if(lastPageNum <= endPageNum){
			endPageNum = lastPageNum;
			isNeedEnd = false;
		}
		
		
		if(endPageNum < lastPageNum){
			isNeedNext = true;
		}
		
		// str을 만듬.
		str += "<ul class='pagination pull-right'>";
		
		if(isNeedFirst){
			str += "<li class='page-item'><a class='page-link d-flex align-items-center px-2' href='" + 1 +"'>";
			str += "<svg width='20' height='20' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20' fill='currentColor'>";
			str += "<path xmlns='http://www.w3.org/2000/svg' id='svg_1' clip-rule='evenodd' d='m9.49241,5.293a1,1 0 0 1 0,1.414l-3.293,3.293l3.293,3.293a1,1 0 0 1 -1.414,1.414l-4,-4a1,1 0 0 1 0,-1.414l4,-4a1,1 0 0 1 1.414,0z' fill-rule='evenodd'/>";
			str += "<path xmlns='http://www.w3.org/2000/svg' id='svg_2' clip-rule='evenodd' d='m15.48719,5.37988a1,1 0 0 1 0,1.414l-3.293,3.293l3.293,3.293a1,1 0 0 1 -1.414,1.414l-4,-4a1,1 0 0 1 0,-1.414l4,-4a1,1 0 0 1 1.414,0z' fill-rule='evenodd'/>";
			str += "</svg>";
			str += "</a></li>";
		}
		
		//이전 버튼 출력여부에 따라 버튼 표시
		if(isNeedPrev){
			str += "<li class='page-item'><a class='page-link d-flex align-items-center px-2' href='" + (startPageNum-1) +"'>";
			str += "<svg width='20' height='20' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20' fill='currentColor'>";
			str += "<path fill-rule='evenodd' d='M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z' clip-rule='evenodd'></path>";
			str += "</svg>";
			str += "</a></li>"; 
		}
		
		//가운데 숫자 출력
		for(var i = startPageNum; i <= endPageNum; i++){
			var active = (pageNum == i ? "active" : "");
			str += "<li class='page-item " + active +"'>" + "<a class='page-link' href='"+ i +"'>" + i + "</a></li>";
		}
		
		//다음 버튼 출력여부에 따라 버튼 표시
		if(isNeedNext){
			str += "<li class='page-item'><a class='page-link d-flex align-items-center px-2' href='" + (endPageNum + 1) +"'>";
			str += "<svg width='20' height='20' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20' fill='currentColor'>";
			str += "<path fill-rule='evenodd' d='M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z' clip-rule='evenodd'></path>";
			str += "</svg>";
			str += "</a></li>";
		}
		
		if(isNeedEnd){
			str += "<li class='page-item'><a class='page-link d-flex align-items-center px-2' href='" + lastPageNum +"'>";
			str += "<svg width='20' height='20' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20' fill='currentColor'>";
			str += "<path id='svg_1' clip-rule='evenodd' d='m4.29467,14.707a1,1 0 0 1 0,-1.414l3.293,-3.293l-3.293,-3.293a1,1 0 0 1 1.414,-1.414l4,4a1,1 0 0 1 0,1.414l-4,4a1,1 0 0 1 -1.414,0z' fill-rule='evenodd'/>";
			str += "<path id='svg_2' clip-rule='evenodd' d='m10.68001,14.87357a1,1 0 0 1 0,-1.414l3.293,-3.293l-3.293,-3.293a1,1 0 0 1 1.414,-1.414l4,4a1,1 0 0 1 0,1.414l-4,4a1,1 0 0 1 -1.414,0z' fill-rule='evenodd'/>";
			str += "</svg>";
			str += "</a></li>";
		}
		
		str += "</ul></div>";
		
		$("#modalPageNation").html(str);
	}
	
	/* 두번째 모달의 페이지네이션에서 번호 클릭시 다시 그리는 함수 */
	$("#modalPageNation").on("click", "li a", function(e){
		e.preventDefault(); // 번호를 눌러도 페이지가 이동하지 않도록 a태그 기능 무력화
		pageNum = $(this).attr("href");
		
		requestClientRecord();
	});
	
	/* 두번째 모달에서 사용자가 검색을 시도할 때 이를 처리하는 부분*/
	$("#searchBtn").on("click", function(e){
		searchWhatColumn = $("#searchWhatColumn").val();
		searchKeyword = $("#searchKeyword").val();
		console.log("searchWhatColumn: " + searchWhatColumn);
		console.log("searchKeyword: " + searchKeyword);
		
		if(searchWhatColumn == ""){
			alert("검색 조건을 선택하세요");
			return;
		}
	
		requestClientRecord();
	});
	
	
	/* 두번째 모달에서 첫번째 모달로 데이터를 옮기는 코드 */
	$("#delivery_data").on("click", function(e){
		
		if(secondModalName == "member"){
			var memberNo = $('input[name=clientRadio]:checked').parent().next().text();
			var memberDepName = $('input[name=clientRadio]:checked').parent().next().next().text();
			var memberName = $('input[name=clientRadio]:checked').parent().next().next().next().next().text();
			
			console.log(memberNo);
			console.log(memberDepName);
			console.log(memberName);
			
			$("input[name='member_no']").val(memberNo);
			$("#member_dep_name").val(memberDepName);
			$("#member_name").val(memberName);
		}	
		else if(secondModalName == "client"){
			var clientNo = $('input[name=clientRadio]:checked').parent().next().text();
			var clientCode = $('input[name=clientRadio]:checked').parent().next().next().text();
			var clientName = $('input[name=clientRadio]:checked').parent().next().next().next().text();
				
			$("input[name='client_no']").val(clientNo);
			$("#client_code").val(clientCode);
			$("#client_name").val(clientName);	
		}
		
		else if(secondModalName == "item"){
			var itemNo = $('input[name=clientRadio]:checked').parent().next().text();
			var itemCode = $('input[name=clientRadio]:checked').parent().next().next().text();
			var itemName = $('input[name=clientRadio]:checked').parent().next().next().next().text();
			var itemClientName = $('input[name=clientRadio]:checked').parent().next().next().next().next().text();
			var itemInPrice = $('input[name=clientRadio]:checked').parent().next().next().next().next().next().text();
				
			console.log(itemNo);
			console.log(itemCode);
			console.log(itemName);
			console.log(itemClientName);
			console.log(itemClientName);
			
			clickedLocation.parent().parent().find('input[name=item_no]').val(itemNo);
			clickedLocation.val(itemCode);
			clickedLocation.parent().next().find('input[type=text]').val(itemName);
			clickedLocation.parent().next().next().find('input[type=text]').val(itemClientName);
			clickedLocation.parent().next().next().next().find('input[type=text]').val(itemInPrice);
			
			addRowItemDetail(); // 새로 입력받을 수 있게 아래 줄을 추가하는 함수
		}
		
		else if(secondModalName == "order"){
			
			//모달창 크기 초기화
			
			//수주서번호
			no = $('input[name=clientRadio]:checked').parent().next().text();
			
			//품목
			
			$.getJSON("/ordersheet/selectOrder/"+no,  
		 			function(resdata){
		 				console.log("resdata.order"+resdata.order);
		 				console.log("resdata.detailList"+resdata.detailList);
		 				var vo = resdata.order;
		 				
		 				//주문서 삽입
		 				$("input[name='order_no']").val(vo.no);
		 				
		 				//날짜 삽입
		 				$("input[name='delivery_date']").val(vo.out_day);
		 				
		 				//담당자 삽입
		 				$("input[name='member_no']").val(vo.member_no);
		 				$("#member_dep_name").val(vo.dep_name);
		 				$("#member_name").val(vo.member_name);
		 				
		 				//거래처 삽입
		 				$("input[name='client_no']").val(vo.client_no);
		 				$("#client_code").val(vo.client_code);
		 				$("#client_name").val(vo.client_name);
		 				
		 				//품목삽입
		 				var orderDetail = resdata.detailList;
		 				
		 				for(i=0; i<orderDetail.length; i++){
		 					console.log(orderDetail[i]);
		 					
		 					var str = "<div class='row'>";
		 					str += "<input type='hidden' name='item_no' class='form-control' value='" + orderDetail[i].itemNo + "' readonly>"; 
		 					str += "<input type='hidden' name='detail_no' class='form-control' value='" + orderDetail[i].no + "' readonly>"; 
		 					str += "<div class='col-sm-2'>";
		 					str += "<label for='userFullname' class='form-label'>품목코드</label>";
		 					str += "<input type='text' class='form-control' value='" + orderDetail[i].item_no + "' readonly>";
		 					str += "</div>";
		 					str += "<div class='col-sm-2'>";
		 					str += "<label for='userFullname' class='form-label'>품목명</label>";
		 					str += "<input type='text' class='form-control' value='" + orderDetail[i].item_code + "' readonly>";
		 					str += "</div>";
		 					str += "<div class='col-sm-2'>";
		 					str += "<label for='userFullname' class='form-label'>취급처</label>";
		 					str += "<input type='text' class='form-control' value='" + orderDetail[i].client_name + "' readonly>";
		 					str += "</div>";
		 					str += "<div class='col-sm-2'>";
		 					str += "<label for='userFullname' class='form-label'>구매단가</label>";
		 					str += "<input type='text' class='form-control' value='" + orderDetail[i].in_price + "' readonly>";
		 					str += "</div>";
		 					str += "<div class='col-sm-1'>";
		 					str += "<label for='userFullname' class='form-label'>수량</label>";
		 					str += "<input type='text' name='amount' class='form-control'>";
		 					str += "</div>";
		 					str += '<div class="col-sm-2">';
		 					str += '<label for="ware_no" class="form-label">창고명</label>';
		 					str += '<select class="form-select" id="ware_no" name="ware_no">';
		 					str += '<option selected disabled value="">선택</option>';
		 					str += '<c:forEach items="${WareList }" var="ware">';
		 					str += '<option value="${ware.no }">${ware.name }(${ware.code })</option>';
		 					str += '</c:forEach>';
		 					str += '</select>';
		 					str += '</div>';
		 					str += "<div class='col-sm-1'>";
		 					str += "<label for='userFullname' class='form-label'>&nbsp;&nbsp;</label>";
		 					str += "<button type='button' class='btn btn-primary deleteItemBtn' style='display:block'>X</button>";
		 					str += "</div>";
		 					str += "</div>";
		 					
		 					$("#modalItemDetail").prepend(str);
		 				}
		 				
		 			}).fail(function(xhr, status, err){
		 					alert("데이터 조회실패");
		 			});	
			
			
			
		}
	});
	
	/* 새로 입력받을 수 있게 아래 줄을 추가하는 부분 */
	function addRowItemDetail(){
		
		var str = "<div class='row'>";
		str += "<input type='hidden' name='item_no' class='form-control' readonly>"; 
		str += "<div class='col-sm-2'>";
		str += "<label for='userFullname' class='form-label'>품목코드</label>";
		str += "<input type='text' class='form-control choiceItemBtn' data-bs-target='#secondModal' data-bs-toggle='modal' data-bs-dismiss='modal' readonly>";
		str += "</div>";
		str += "<div class='col-sm-2'>";
		str += "<label for='userFullname' class='form-label'>품목명</label>";
		str += "<input type='text' class='form-control' readonly>";
		str += "</div>";
		str += "<div class='col-sm-2'>";
		str += "<label for='userFullname' class='form-label'>취급처</label>";
		str += "<input type='text' class='form-control' readonly>";
		str += "</div>";
		str += "<div class='col-sm-2'>";
		str += "<label for='userFullname' class='form-label'>구매단가</label>";
		str += "<input type='text' class='form-control' readonly>";
		str += "</div>";
		str += "<div class='col-sm-1'>";
		str += "<label for='userFullname' class='form-label'>수량</label>";
		str += "<input type='text' name='amount' class='form-control'>";
		str += "</div>";
		str += '<div class="col-sm-2">';
		str += '<label for="ware_no" class="form-label">창고명</label>';
		str += '<select class="form-select" id="ware_no" name="ware_no">';
		str += '<option selected disabled value="">선택</option>';
		str += '<c:forEach items="${WareList }" var="ware">';
		str += '<option value="${ware.no }">${ware.name }(${ware.code })</option>';
		str += '</c:forEach>';
		str += '</select>';
		str += '</div>';
		str += "<div class='col-sm-1'>";
		str += "<label for='userFullname' class='form-label'>&nbsp;&nbsp;</label>";
		str += "<button type='button' class='btn btn-primary deleteItemBtn' style='display:block'>X</button>";
		str += "</div>";
		str += "</div>";
		
		$("#modalItemDetail").append(str);
	}
	
	/* 상품상세 쪽에서 상품 삭제 버튼 이벤트 처리 */
	$("#modalItemDetail").on("click", ".deleteItemBtn", function(e){
		
		var currentRowCount = $("#modalItemDetail").find("div[class=row]").length;
	
		// 마지막 한줄은 살아있어야 하므로 삭제하지는 않고 값 초기화
		if( currentRowCount == 1){ 
			$(this).parent().parent().find("input[type=text]").val("");	
			return;	
		}
		
		$(this).parent().parent().remove();
	});
	
	$("#modalRegisterBtn").on("click", function(e){
		
		//유효성 검사 해야하는 부분
		
		
		//form 전송전에 빈줄 삭제
		var allItemCodeInputs = $("#modalItemDetail").find(".choiceItemBtn");
		var currentRowCount = allItemCodeInputs.length; 
		
		if(allItemCodeInputs[currentRowCount-1].value == ""){
			$("#modalItemDetail div[class=row]:last-child").remove();
		}
		
		
		
		$("#modal1form").submit();
	});
</script>