<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<script src="https://kit.fontawesome.com/4d5e8e1a50.js" crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>

<!-- top.jsp -->
<%@include file="../common/top.jsp"%>


<style>
table th {
	text-align: center;
	font-size: 14px;
}

table td {
	text-align: center;
	font-size: 14px;
}

/* 한줄 색 칠하는 기능 */
#table1 tbody tr:hover {
	background-color: #EAEAEA;
}

/* 검색바 */
.btn_search {
	cursor: pointer;
	position: absolute;
	right: 7px;
	top: 50%;
	transform: translatey(-50%);
}

#search {
	position: relative;
}
</style>


<!-- 상단 -->
<div class="card">
	<div class="card-body">
		<div class="d-flex gap-1 mb-4 flex-wrap" style="height:38px;">
			<div class="d-flex gap-1 me-auto flex-wrap" style="height:38px">
				<button
					class="btn btn-primary d-inline-flex align-items-center gap-1"
					data-bs-toggle="modal" data-bs-target="#addOrderSheetModal" id="addOrderSheet">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd" />
                  </svg>
					수주서 추가
				</button>
				<button class="btn btn-primary d-inline-flex align-items-center gap-1" id="deleteCheckModalBtn">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
					  <path clip-rule="evenodd" d="m11,9l3,0a1,1 0 1 1 0,2l-3,0l-2,0l-3,0a1,1 0 1 1 0,-2l3,0l2,0z" clip-rule="evenodd"/>
					</svg>
					선택 삭제
				</button> 
			</div>
			
			<div class="search">
				<form name="search" action="/ordersheet/list" id="search">
					<table>
						<tr>
							<td>
								<select id="whatColumn" name="whatColumn" class="form-select" style="width: 200px;">
									<%
									String[] search = { "member", "client", "item"};
									String[] cate = { "담당자", "수주처", "품목명"};
									%>
									<c:set value="<%=search%>" var="s"></c:set>
									<c:set value="<%=cate%>" var="c"></c:set>
									<option>검색 선택</option>
									<c:forEach begin="0" end="2" var="i">
										<option value="${s[i] }"
											<c:if test="${searchvo.whatColumn== s[i] }">selected</c:if>>${c[i] }</option>
									</c:forEach>
								</select>
							</td>
							<td><input type="text" name="keyword" id="keyword" class="form-control" value=<c:if test="${searchvo.keyword=='null' }">""</c:if> <c:if test="${searchvo.keyword!='null' }">"${searchvo.keyword }"</c:if> placeholder="입력" style="width: 200px; height: 38px;"></td>
							<td><i class="fa-solid fa-magnifying-glass btn_search" id="searchIcon" onclick="searchForm()"></i></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div class="table-responsive my-1">
			<form name="deleteManyMainForm" action="/ordersheet/delete/many" method="post" id="deleteManyMainForm">
				
				<input type="hidden" name="pageNumber" value="${searchvo.pageNumber}" class="form-control" readonly>
				<input type="hidden" name="whatColumn" value="${searchvo.whatColumn}" class="form-control" readonly>
				<input type="hidden" name="keyword" value="${searchvo.keyword}" class="form-control" readonly>
				
				<table class="table align-middle" id="table1">
					<thead>
						<tr>
							<th scope="col" style="display:none">수주번호</th>
							<th scope="col">
		                      <div>
		                        <input class="form-check-input" type="checkbox" name="allMainCheck" id="allMainCheck">
		                      </div>
	                    	</th>
							<th scope="col">작성일자</th>
							<th scope="col">담당자</th>
							<th scope="col">수주처</th>
							<th scope="col" nowrap>품목명</th>
							<th scope="col">납기일자</th>
							<th scope="col">주문금액합계</th>
							<th scope="col" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="접수완료 - (발주중) - 판매완료">진행상태</th>
							<th scope="col">기능</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${voList}">
							<tr>
								<td style="display:none">${vo.no}</td>
								<td>
									<div><input class="form-check-input" type="checkbox" value="${vo.no}" name="checkedMain"></div>
								</td>
								<td>
									<fmt:parseDate value="${vo.day}" var="day" pattern="yyyy-MM-dd" />
	              					<fmt:formatDate value="${day}" pattern="yyyy-MM-dd" />
	              				</td>
								<td>${vo.member_name}</td>
								<td>${vo.client_name}</td>
								<td>${vo.temp_item_name}</td>
								<td>
									<fmt:parseDate value="${vo.out_day}" var="out_day" pattern="yyyy-MM-dd" />
		              				<fmt:formatDate value="${out_day}" pattern="yyyy-MM-dd" />
	              				</td>
								<td><fmt:formatNumber pattern="###,###" value="${vo.total_price}" var="total_price"/>${total_price} 원</td>
								<td>
									<c:if test="${vo.status eq 0}">
										<span class="badge bg-success">접수완료</span>
									</c:if>
									<c:if test="${vo.status eq 1}">
										<span class="badge bg-success" style="background-color: #FFBB00 !important">발주중</span>
									</c:if>
									<c:if test="${vo.status eq 2}">
										<span class="badge bg-light text-muted">판매완료</span>
									</c:if>
									<c:if test="${vo.status eq 3}">
										<span class="badge bg-light text-muted">취소됨</span>
									</c:if>
								</td>
								<td>
									<div class="btn-group btn-group-sm" role="group">
										<button type="button" class="btn btn-light d-flex editBtn" data-bs-toggle="modal" data-bs-target="#addOrderSheetModal">
											<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
												fill="none" viewBox="0 0 24 24" stroke="currentColor"
												aria-hidden="true">
		                            			<path stroke-linecap="round"
													stroke-linejoin="round" stroke-width="2"
													d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
		                          			</svg>
										</button>
										
										<button type="button" class="btn btn-light d-flex text-danger deleteOneBtn" data-no="${vo.no }">
											<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
												fill="none" viewBox="0 0 24 24" stroke="currentColor"
												aria-hidden="true">
			                           			<path stroke-linecap="round"
													stroke-linejoin="round" stroke-width="2"
													d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
			                        		</svg>
										</button>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
		<nav aria-label="Page navigation borderless example">
			${pageInfo.pagingHtml}
		</nav>
	</div>
</div>

<br>

<!-- 하단 첫번째 -->
<div class="card">
	<div class="card-body">
		<div class="d-flex gap-1 mb-4 flex-wrap" style="display:none !important">
			<div class="d-flex gap-1 me-auto flex-wrap">
				<button class="btn btn-primary d-inline-flex align-items-center gap-1" data-bs-toggle="modal" data-bs-target="#addUserModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    	<path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd" />
                  	</svg>
					품목 추가
				</button>
				<button class="btn btn-primary d-inline-flex align-items-center gap-1" data-bs-toggle="modal" data-bs-target="#addUserModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
					  <path clip-rule="evenodd" d="m11,9l3,0a1,1 0 1 1 0,2l-3,0l-2,0l-3,0a1,1 0 1 1 0,-2l3,0l2,0z" clip-rule="evenodd"/>
					</svg>
					선택 삭제
				</button>
			</div>
		</div>
		<div class="table-responsive my-1">
			<table class="table align-middle" id="table2">
				<thead>
					<tr>
						<th scope="col" style="display:none">상세번호</th>
						<th scope="col" style="display:none">수주서번호</th>
						<th scope="col"></th>
						<th scope="col" style="display:none">품목번호</th>
						<th scope="col">품목코드</th>
						<th scope="col">품목명</th>
						<th scope="col">취급처</th>
						<th scope="col">수주수량</th>
						<th scope="col">재고수량</th>
						<th scope="col">부족수량</th>
						<th scope="col">판매단가</th>
						<th scope="col">합계</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="8">상세품목을 보길 원하신다면 수주서를 클릭하세요
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<br>

<!-- 하단 두번째 -->
<div class="card">
	<div class="card-body">
		<div class="d-flex gap-1 mb-4 flex-wrap" style="height:38px">
			<div class="d-flex gap-1 me-auto flex-wrap" style="height:38px">
				<button class="btn btn-primary d-inline-flex align-items-center gap-1" data-ordersheetno="" id="setSellCompleteStatus">
					판매완료 처리
				</button> 
			</div>
		</div>
		<div class="d-flex gap-1 mb-4 flex-wrap" style="display:none !important">
			<div class="d-flex gap-1 me-auto flex-wrap">
				<button class="btn btn-primary d-inline-flex align-items-center gap-1" data-bs-toggle="modal" data-bs-target="#addUserModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    	<path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd" />
                  	</svg>
					품목 추가
				</button>
				<button class="btn btn-primary d-inline-flex align-items-center gap-1" data-bs-toggle="modal" data-bs-target="#addUserModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
					  <path clip-rule="evenodd" d="m11,9l3,0a1,1 0 1 1 0,2l-3,0l-2,0l-3,0a1,1 0 1 1 0,-2l3,0l2,0z" clip-rule="evenodd"/>
					</svg>
					선택 삭제
				</button>
			</div>
		</div>
		<div class="table-responsive my-1">
			<table class="table align-middle" id="table3">
				<thead>
					<tr>
						<th scope="col" style="display:none">상세번호</th>
						<th scope="col" style="display:none">수주서번호</th>
						<th scope="col"></th>
						<th scope="col" style="display:none">품목번호</th>
						<th scope="col">품목코드</th>
						<th scope="col">품목명</th>
						<th scope="col">로트번호</th>
						<th scope="col">판매수량</th>
						<th scope="col">판매단가</th>
						<th scope="col">합계</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="8">상세품목을 보길 원하신다면 수주서를 클릭하세요
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<!-- 첫번째 모달 -->
<div class="modal fade" id="addOrderSheetModal" tabindex="-1">
	<div class="modal-dialog modal-dialog-scrollable modal-lg">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 id="modal-title">수주서 등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<!-- form start -->
			<form class="needs-validation" novalidate id="firstModalForm" action="" method="post">
				<!-- 같은 페이지로 돌아가기 위해 넘겨주는 데이터 -->
				<input type="hidden" name="pageNumber" value="${searchvo.pageNumber}" class="form-control" readonly>
				<input type="hidden" name="whatColumn" value="${searchvo.whatColumn}" class="form-control" readonly>
				<input type="hidden" name="keyword" value="${searchvo.keyword}" class="form-control" readonly>
				
				<div class="modal-body">
						<!-- 컨트롤러로 넘기는 정보 -->
						<!-- out_day -->
						<input type="hidden" name="no" class="form-control" value="0" readonly>
						<input type="hidden" name="member_no" class="form-control" readonly>
						<input type="hidden" name="client_no" class="form-control" readonly>
						<!-- 품목번호 및 개수 -->
						<!-- input type='text' name='item_no' -->
						<!-- input type='text' name='amount' -->
						
						<div class="row">		
							<div class="col-sm-3">		
								<label for="day" class="form-label">납기일자</label> 
		                		<input type="date" name="out_day" class="form-control" required onchange="calendarChangeHandler()">
		                		<div class="invalid-feedback">납기일자를 입력해주세요</div>
							</div>
							<div class="col-sm-4">	
								<label for="userFullname" class="form-label">&nbsp;&nbsp;</label>
							</div>
						</div>
						
						<div class="row">		
							<div class="col-sm-3">		
								<label for="userFullname" class="form-label">부서명</label>
								<input type="text" id="member_dep_name" class="form-control" readonly>
								<div class="invalid-feedback">담당자를 입력해주세요</div>
							</div>
							<div class="col-sm-3">
								<label for="userFullname" class="form-label">담당자명</label>
								<input type="text" id="member_name" class="form-control" readonly>
							</div>
							<div class="col-sm-4">	
								<label for="userFullname" class="form-label">&nbsp;&nbsp;</label>
								<button type="button" class="btn btn-primary" style="display:block" data-bs-target="#secondModal" data-bs-toggle="modal" data-bs-dismiss="modal" id="choiceMemberBtn">담당자 선택</button>	
							</div>
						</div>
						
						<div class="row">		
							<div class="col-sm-3">		
								<label for="userFullname" class="form-label">코드</label>
								<input type="text" id="client_code" class="form-control" readonly>
								<div class="invalid-feedback">거래처를 입력해주세요</div>
							</div>
							<div class="col-sm-3">		
								<label for="userFullname" class="form-label">거래처명</label>
								<input type="text" id="client_name" class="form-control" readonly>
							</div>
							<div class="col-sm-4">	
								<label for="userFullname" class="form-label">&nbsp;&nbsp;</label>
								<button type="button" class="btn btn-primary" style="display:block" data-bs-target="#secondModal" data-bs-toggle="modal" data-bs-dismiss="modal" id="choiceClientBtn">거래처 선택</button>	
							</div>
						</div>	
						
						<hr>
						
						<!-- 상품 상세추가 부분 -->
						<div id="modalItemDetail">
							<div class="row">		
								<input type="hidden" name="item_no" class="form-control" readonly>
							
								<div class="col-sm-3">		
									<label for="userFullname" class="form-label">품목코드</label>
									<input type="text" class="form-control choiceItemBtn" data-bs-target="#secondModal" data-bs-toggle="modal" data-bs-dismiss="modal" readonly>
									<div class="invalid-feedback">품목을 입력해주세요</div>
								</div>
								<div class="col-sm-3">		
									<label for="userFullname" class="form-label">품목명</label>
									<input type="text" class="form-control" readonly>
								</div>
								<div class="col-sm-2">		
									<label for="userFullname" class="form-label">취급처</label>
									<input type="text" class="form-control" readonly>
								</div>
								<div class="col-sm-2">		
									<label for="userFullname" class="form-label">수량</label>
									<input type="text" name="amount" class="form-control">
									<div class="invalid-feedback">수량을 입력해주세요</div>
									
								</div>
								<div class="col-sm-2">	
									<label for="userFullname" class="form-label">&nbsp;&nbsp;</label>
									<button type="button" class="btn btn-primary deleteItemBtn" style="display:block">삭제</button>	
								</div>
							</div>
							
						</div>
					
				</div>
				<div class="modal-footer border-0">
					<button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
					<button type="button" id="modalRegisterBtn"class="btn btn-primary px-5">등록</button>		
				</div>
			</form>
			<!-- form end -->
		</div>
	</div>
</div>

<!-- 두번째 모달 -->
<div class="modal fade" id="secondModal" tabindex="-2">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
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

<!-- 삭제확인 모달 -->
<div class="modal fade" id="deleteCheckModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 id="modal-title">삭제여부 재확인</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<!-- form start -->
			<form class="needs-validation" novalidate id="deleteCheckModalForm" action="/ordersheet/delete/one" method="post">
				<div class="modal-body">
						<input type="hidden" name="no" class="form-control" readonly>
						정말로 삭제 하시겠습니까?
						
						<!-- 같은 페이지로 돌아가기 위해 넘겨주는 데이터 -->
						<input type="hidden" name="pageNumber" value="${searchvo.pageNumber}" class="form-control" readonly>
						<input type="hidden" name="whatColumn" value="${searchvo.whatColumn}" class="form-control" readonly>
						<input type="hidden" name="keyword" value="${searchvo.keyword}" class="form-control" readonly>
						
				</div>
				<div class="modal-footer border-0">
					<button type="button" class="btn btn-light" data-bs-dismiss="modal" id="deleteCancleBtn">취소</button>
					<button type="button" id="modalDeleteBtn"class="btn btn-primary px-5">삭제</button>		
				</div>
			</form>
			<!-- form end -->
		</div>
	</div>
</div>

<!-- bottom.jsp -->
<%@include file="../common/bottom.jsp"%>

<script type="text/javascript">
	/* 왼쪽 카테고리창이 해당화면에 맞게 펼쳐지게 하는 코드 */
	$(function(){ 
		document.getElementById('ordersheet').click(); 
	});
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
	var clickedBtnInMain = "";	// add or edit

	/* 첫번째 모달 이 뜰 때 모달 초기화 */
	$("#addOrderSheet").on("click", function(e){

		clickedBtnInMain = "add";
		
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
		
		$("#modal-title").text("수주서 등록");
	});
	
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
		str += "</tr>";
		$("#secondModalThead").html(str);	
		
		// 두번째 모달의 테이블의 레코드를 그려내는 코드
		requestClientRecord();
	});
	
	
	/* ajax로 두번째 모달에서 보여줄 레코드정보를 요청하는 부분 + 화면전환없이 레코드들을 그리는 부분 + 화면전환없이 페이지네이션을 그리는 부분 */
	function requestClientRecord(){
		console.log("요청url : " + "/basicinfo/" + secondModalName + "/pages/"+ pageNum +"/" + amount + "/" + searchWhatColumn + "/" + searchKeyword)
		$.getJSON("/basicinfo/" + secondModalName + "/pages/"+ pageNum +"/" + amount + "/" + searchWhatColumn + "/" + searchKeyword,  
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
					str += "</tr>";
				}
			}
			
			if(list.length == 0){
				str = "<tr><td colspan='5' style='text-align:center'>검색결과가 없습니다</td></tr>";
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
			
			// 유효성 유효처리 관련 코드
			$("#member_dep_name").attr("class","form-control is-valid");
			$("#member_name").attr("class","form-control is-valid");
		}	
		else if(secondModalName == "client"){
			var clientNo = $('input[name=clientRadio]:checked').parent().next().text();
			var clientCode = $('input[name=clientRadio]:checked').parent().next().next().text();
			var clientName = $('input[name=clientRadio]:checked').parent().next().next().next().text();
			
			$("input[name='client_no']").val(clientNo);
			$("#client_code").val(clientCode);
			$("#client_name").val(clientName);
			
			// 유효성 유효처리 관련 코드
			$("#client_code").attr("class","form-control is-valid");
			$("#client_name").attr("class","form-control is-valid");
		}
		
		else if(secondModalName == "item"){
			var itemNo = $('input[name=clientRadio]:checked').parent().next().text();
			var itemCode = $('input[name=clientRadio]:checked').parent().next().next().text();
			var itemName = $('input[name=clientRadio]:checked').parent().next().next().next().text();
			var itemClientName = $('input[name=clientRadio]:checked').parent().next().next().next().next().text();
				
			console.log(itemNo);
			console.log(itemCode);
			console.log(itemName);
			console.log(itemClientName);
			
			clickedLocation.parent().parent().find('input[name=item_no]').val(itemNo);
			clickedLocation.val(itemCode);
			clickedLocation.parent().next().find('input[type=text]').val(itemName);
			clickedLocation.parent().next().next().find('input[type=text]').val(itemClientName);
			
			addRowItemDetail(); // 새로 입력받을 수 있게 아래 줄을 추가하는 함수
			
			clickedLocation.attr("class","form-control is-valid choiceItemBtn");
		}
	});
	
	/* 새로 입력받을 수 있게 아래 줄을 추가하는 부분 */
	function addRowItemDetail(){
		
		var str = "<div class='row'>";
		str += "<input type='hidden' name='item_no' class='form-control' readonly>"; 
		str += "<div class='col-sm-3'>";
		str += "<label for='userFullname' class='form-label'>품목코드</label>";
		str += "<input type='text' class='form-control choiceItemBtn' data-bs-target='#secondModal' data-bs-toggle='modal' data-bs-dismiss='modal' readonly>";
		str += "<div class='invalid-feedback'>품목을 입력해주세요</div>";
		str += "</div>";
		str += "<div class='col-sm-3'>";
		str += "<label for='userFullname' class='form-label'>품목명</label>";
		str += "<input type='text' class='form-control' readonly>";
		str += "</div>";
		str += "<div class='col-sm-2'>";
		str += "<label for='userFullname' class='form-label'>취급처</label>";
		str += "<input type='text' class='form-control' readonly>";
		str += "</div>";
		str += "<div class='col-sm-2'>";
		str += "<label for='userFullname' class='form-label'>수량</label>";
		str += "<input type='text' name='amount' class='form-control'>";
		str += "<div class='invalid-feedback'>수량 입력요먕</div>"
		str += "</div>";
		str += "<div class='col-sm-2'>";
		str += "<label for='userFullname' class='form-label'>&nbsp;&nbsp;</label>";
		str += "<button type='button' class='btn btn-primary deleteItemBtn' style='display:block'>삭제</button>";
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
		
		// action 수정
		if(clickedBtnInMain == "add"){
			$("#firstModalForm").attr("action", "/ordersheet/add");
		}
		else if(clickedBtnInMain == "edit"){
			$("#firstModalForm").attr("action", "/ordersheet/update");
		}
		
		//form 전송전에 빈줄 삭제
		var allItemCodeInputs = $("#modalItemDetail").find("input[name='item_no']");
		var currentRowCount = allItemCodeInputs.length; 
		
		console.log("currentRowCount(빈줄을 제거하기전 전체 row 수): " + currentRowCount);
		
		for(var i = currentRowCount-1; i >= 0; i--){
			console.log("allItemCodeInputs[i].value: " + i +" " + allItemCodeInputs[i].value);
			if(allItemCodeInputs[i].value == "" && i != 0){
				$("#modalItemDetail div[class=row]").eq(i).remove();
			}	
		}
		
		var isValid = true;
		
		//유효성 검사하는 부분
		if($("input[name='out_day']").val() == ""){
			$("input[name='out_day']").attr("class","form-control is-invalid");
			//$("#client_code").focus();
			isValid = false;
	    }
		
		if($("#member_dep_name").val() == ""){
	    	$("#member_dep_name").attr("class","form-control is-invalid");
	    	$("#member_name").attr("class","form-control is-invalid");
	    	isValid = false;
	    }
		
		if($("#client_code").val() == ""){
			$("#client_code").attr("class","form-control is-invalid");
			$("#client_name").attr("class","form-control is-invalid");
			isValid = false;
		}
		
		//상품이 입력되지 않은경우 처리되도록
		$("#modalItemDetail .row").eq(i).find("input").each(function(index){
			if(index == 1 && $(this).val() == ""){
				$(this).attr("class","form-control is-invalid choiceItemBtn");
				isValid = false;
			}
		});
		
		//수량관련 유효성검사		
		for(var i = 0; i<$("#modalItemDetail .row").length; i++){
			$("#modalItemDetail .row").eq(i).find("input").each(function(index){
				if(index == 4 && $(this).val() == ""){
					$(this).attr("class","form-control is-invalid");
					isValid = false;
				}
			});
		}
		
		if(isValid == false){
			return;
		}
		console.log("isValid:" + isValid);
		
		//form submit after check validation
		$("#firstModalForm").submit();
	});
</script>

<!-- 메인화면 상단 동작관련 코드 -->
<script type="text/javascript">

	var clickedMainNo = "" ; //클릭된 수주서 번호  

	$(function(){
		
		/* 리스트 화면에서 클릭시 아래 Detail 레코드들을 가져와 뿌려주는 코드 */
		$("#table1 tbody tr").on("click", function(){
			// 클릭된 수주서의 no 번호
			clickedMainNo = $(this).children("td")[0].innerHTML;
			console.log("clickedMainNo: " + clickedMainNo);
			
			console.log("요청url : " + "/ordersheet/orderdetail/" + clickedMainNo);
			$.getJSON("/ordersheet/orderdetail/" + clickedMainNo,  
	 			function(list){
					console.log("list: " + list);
					
					$("#table2 tbody").empty();
					
					for(var i = 0, len = list.length || 0; i < len; i++){
						
						var str = "";
						
						//부족수량의 결과를 넣기 위한 변수
						var result="";
						
						//부족수량은 재고수량-수주수량 양수시 0, 음수시는 수주수량-재고수량
						if(list[i].current_amount-list[i].amount>0){
							result = 0;
						}
						else{
							result = list[i].amount-list[i].current_amount;
						}
						str2 = "";
						if(result != 0){
							str2 = "<td style='color:red;'>" + result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "개</td>";
						}else{
							str2 = "<td>" + result + "개</td>";
						}
						
						str += "<tr>";
						/* str += "<td><div><input class='form-check-input' type='checkbox' value=''></div></td>"; */
						str += "<td style='display:none'>" + list[i].no + "</td>";
						str += "<td style='display:none'>" + list[i].order_no + "</td>";
						
						str += "<td><i class='fa-solid fa-gift'></i></td>";
						
						str += "<td style='display:none'>" + list[i].item_no + "</td>";
						str += "<td>" + list[i].item_code + "</td>";
						str += "<td>" + list[i].item_name + "</td>";
						str += "<td>" + list[i].client_name + "</td>";
						str += "<td>" + list[i].amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 개</td>";
						str += "<td>" + list[i].current_amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 개</td>";
						str += str2;
						str += "<td>" + list[i].out_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원</td>";
						str += "<td>" + (list[i].amount * list[i].out_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원</td>";
						str += "</tr>";
						
						$("#table2 tbody").append(str);
					}
	 			}).fail(function(xhr, status, err){
	 					alert("데이터 조회실패");
	 			});
		});
		
		/* 리스트 화면에서 클릭시 아래 판매완료 Detail 레코드들을 가져와 뿌려주는 코드 */
		$("#table1 tbody tr").on("click", function(){
			// 클릭된 수주서의 no 번호
			clickedMainNo = $(this).children("td")[0].innerHTML;
			console.log("clickedMainNo: " + clickedMainNo);
			
			console.log("요청url : " + "/sell/origin/detail/more/ordersheetbase/" + clickedMainNo);
			$.getJSON("/sell/origin/detail/more/ordersheetbase/" + clickedMainNo,  
	 			function(list){
					console.log("list: " + list);
					
					$("#table3 tbody").empty();
					
					for(var i = 0, len = list.length || 0; i < len; i++){
						
						var str = "";
						
						str += "<tr>";
						/* str += "<td><div><input class='form-check-input' type='checkbox' value=''></div></td>"; */
						str += "<td style='display:none'>" + "</td>";
						str += "<td style='display:none'>" + "</td>";
						
						str += "<td><i class='fa-solid fa-gift'></i></td>";
						
						str += "<td style='display:none'>" + list[i].item_no + "</td>";
						str += "<td>" + list[i].code + "</td>";
						str += "<td>" + list[i].name + "</td>";
						str += "<td><span class='badge bg-dark'>" + list[i].lot_code + "</span></td>";
						str += "<td>" + list[i].amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 개</td>";
						str += "<td>" + list[i].sell_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원</td>";
						str += "<td>" + (list[i].amount * list[i].sell_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원</td>";
						str += "</tr>";
						
						$("#table3 tbody").append(str);
					}
	 			}).fail(function(xhr, status, err){
	 					alert("데이터 조회실패");
	 			});
		});
		
		/* 판매완료 처리 눌렸을 때 처리 */
		$("#setSellCompleteStatus").on("click", function(){
			
			if(clickedMainNo != ""){
				location.href = "/ordersheet/statuschange?ordersheetno=" + clickedMainNo + "&status=2";
			}
			
		});
		
		/* 수정버튼이 눌렸을 때 처리 */
		$(".editBtn").on("click", function(e){
			 e.stopPropagation(); // 부모에게 이벤트가 상위 전파 안되도록 막음(버튼을 누르는데 부모인 tr에 이벤트를 걸어뒀더니 중복으로 실행되어 이걸 사용)		
			
			 clickedBtnInMain = "edit";
			  
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
			
			$("#modal-title").text("수주서 수정");
			
			$("#modalRegisterBtn").text("수정");
			
			var mainNo = $(this).parent().parent().parent().children("td").eq(0).text();
			
			//수정 모달의 상단을 채워넣는 코드
			console.log("요청url : " + "/ordersheet/" + mainNo);
			$.getJSON("/ordersheet/" + mainNo,  
	 			function(obj){
					console.log("obj: " + obj);
					
					// 수주서 번호를 채워넣는 코드
					$("input[name='no']").val(obj.no);
					
					// 납기일자 입력
					$("input[name='out_day']").val(obj.out_day);
					
					// 담당자 정보 채워넣기
					$("input[name='member_no']").val(obj.member_no);
					$("#member_dep_name").val(obj.dep_name);
					$("#member_name").val(obj.member_name);
					
					// 거래처 정보 채워넣기
					$("input[name='client_no']").val(obj.client_no);
					$("#client_code").val(obj.client_code);
					$("#client_name").val(obj.client_name);
					
	 			}).fail(function(xhr, status, err){
	 					alert("데이터 조회실패");
	 			});
			
			//수정 모달의 하단을 채워넣는 코드
			console.log("요청url : " + "/ordersheet/orderdetail/" + mainNo);
			$.getJSON("/ordersheet/orderdetail/" + mainNo,  
	 			function(list){
					console.log("list: " + list);
										
					for(var i = 0, len = list.length || 0; i < len; i++){
						
						addRowItemDetail();
						
						$("#modalItemDetail .row").eq(i).find("input").each(function(index){
							
							if(index == 0){
								$(this).val(list[i].item_no);	
							} else if(index == 1){
								$(this).val(list[i].item_code);
							} else if(index == 2){
								$(this).val(list[i].item_name);
							} else if(index == 3){
								$(this).val(list[i].client_name);
							}else if(index == 4){
								$(this).val(list[i].amount);	
							}
						});
					}
	 			}).fail(function(xhr, status, err){
	 					alert("데이터 조회실패");
	 			});
			
		});
		
		/* 하나짜리 삭제버튼 눌렸을 때 처리 */
		$(".deleteOneBtn").on("click", function(e){
			e.stopPropagation(); // 부모에게 이벤트가 상위 전파 안되도록 막음(버튼을 누르는데 부모인 tr에 이벤트를 걸어뒀더니 중복으로 실행되어 이걸 사용)		
			clickedBtnInMain = "delete_one";
			$("#deleteCheckModal input").eq(0).val($(this).data("no"));
			 
			if(confirm("삭제하시겠습니까?")){
				$("#deleteCheckModalForm").attr("action", "/ordersheet/delete/one");
				$("#deleteCheckModalForm").submit();
			}
		});
		
		/* 상단의 체크박스 전체선택 및 해제 기능 */
		$("#allMainCheck").on("click", function(){
			var allcheck = document.deleteManyMainForm.allMainCheck;
			var rowcheck = document.deleteManyMainForm.checkedMain;
			
			if(allcheck.checked == true){
				for(var i = 0; i<rowcheck.length; i++){	// 전체 체크
					rowcheck[i].checked = true;
				}
			}else{
				for(var i = 0; i<rowcheck.length; i++){	// 전체 해제
					rowcheck[i].checked = false;	
				}	
			}
		});
		
		$("input[name='checkedMain']").on("click", function(e){
			e.stopPropagation(); // 이벤트 상위전파 중지(tr 누르면 발생하는 이벤트랑 중첩으로 동작하는 것을 없애기 위함)
		});
		
		/* 체크박스가 하나도 체크되어 있지 않았을 때 삭제가 동작하지 않도록 하는 코드 + 삭제기능실행 */
		$("#deleteCheckModalBtn").on("click", function(e){
			//clickedBtnInMain = "delete_many";	
			
			var rowcheck = document.deleteManyMainForm.checkedMain;
			
			var count = 0;
			
			for(var i = 0; i<rowcheck.length; i++){	// 전체 체크
				if(rowcheck[i].checked == true){
					count += 1;					
				}
			}
			
			console.log(count);
			
			// 다중삭제 버튼은 체크박스가 체크되어 있어야 동작을 함.
			if(count > 0){
				if(confirm("삭제하시겠습니까?")){
					$("#deleteManyMainForm").submit();
				}
			}else{
				alert("체크박스를 먼저 체크 후 다시 시도해주세요");
			}
		});
		
		/* 이하 등록모달폼, 수정모달폼 유효성 검사  */
		$("#modalItemDetail").on("keyup", "input[name='amount']", function(){
			$(this).attr("class","form-control is-valid");
			
			if(isNaN($(this).val())){
				alert("수량은 숫자만 입력 가능합니다.");
				$(this).val("");
				$(this).focus();
			}
		});
		
	});
	
	function calendarChangeHandler(){
		$("input[name='out_day']").attr("class","form-control is-valid");
	} 
	
	
	</script>