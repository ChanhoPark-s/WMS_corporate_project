<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- top.jsp -->
<%@include file="../common/top.jsp"%>
<!-- fontawsome -->
<script src="https://kit.fontawesome.com/75769dc150.js" crossorigin="anonymous"></script>

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

#choiceOrderBtn{
	margin-bottom: 10px; 
}
</style>
<!-- 상단 -->
<div class="card">
	<div class="card-body">
		<div class="d-flex gap-1 mb-4 flex-wrap" style="height:38px">
			<div class="d-flex gap-1 me-auto flex-wrap" style="height:38px">
				<button
					class="btn btn-primary d-inline-flex align-items-center gap-1"
					data-bs-toggle="modal" data-bs-target="#addOrderSheetModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd" />
                  </svg>
					입고 등록
				</button>
				
			</div>
			<div class="search">
				<form name="search" action="/input_warehouse/list" id="search">
					<table>
						<tr>
							<td>
								<select id="whatColumn" name="whatColumn" class="form-select" style="width: 200px;">
									<%
									String[] search = { "member", "client", "item", "lot_code"};
									String[] cate = { "담당자", "수주처", "품목명", "로트코드"};
									%>
									<c:set value="<%=search%>" var="s"></c:set>
									<c:set value="<%=cate%>" var="c"></c:set>
									<option>검색 선택</option>
									<c:forEach begin="0" end="3" var="i">
										<option value="${s[i] }"
											<c:if test="${searchvo.whatColumn== s[i] }">selected</c:if>>${c[i] }</option>
									</c:forEach>
								</select>
							</td>
							<td><input type="text" name="keyword" id="keyword" class="form-control" value=<c:if test="${searchvo.keyword=='null' }">""</c:if> <c:if test="${searchvo.keyword!='null' }">"${searchvo.keyword }"</c:if> placeholder="입력" style="width: 200px; height: 38px;"></td>
							<td><i class="fa-solid fa-magnifying-glass btn_search" id="searchIcon" onclick="document.getElementById('search').submit();"></i></td>
						</tr>
					</table>
				</form>
			</div>
			
		</div>
		<div class="table-responsive my-1">
			<table class="table align-middle"  id="table1">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">담당자</th>
						<th scope="col">발주처</th>
						<th scope="col" nowrap>품목명</th>
						<th scope="col">구분</th>
						<th scope="col">입고일</th>
						<th scope="col">수정/삭제</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="input" items="${lists}">
					<tr class="tr" data-no=" ${input.no }">
						<td>${input.no}</td>
						<td>${input.member_name}</td>
						<td>${input.client_name}</td>
						<td>${input.temp_item_name}</td>
						<td>
									<c:if test="${input.status eq 0}">
										<span class="badge bg-success" style="background-color: #FFBB00 !important">기타 입고</span>
									</c:if>
									<c:if test="${input.status eq 1}">
										<span class="badge bg-success">발주분 입고</span>
									</c:if>
						</td>
						<td>
						<fmt:parseDate value="${input.arrival_date}" var="day" pattern="yyyy-MM-dd" />
              			<fmt:formatDate value="${day}" pattern="yyyy-MM-dd" />
              			</td>
						<td>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                          </svg>
								</button>
								<button type="button" class="btn btn-light d-flex text-danger deleteOneBtn" data-no="${input.no }">
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
		</div>
		<nav aria-label="Page navigation borderless example">
			${pageInfo.pagingHtml}
		</nav>
	</div>
</div>

<br>

<!-- 하단 -->
<div class="card">
	<div class="card-body">
		<div class="table-responsive my-1">
			<table class="table align-middle"  id="table2">
				<thead>
					<tr>
						<th scope="col" style="display:none">상세번호</th>
						<th scope="col" style="display:none">입고번호</th>
						<th>발주서번호</th>
						<th>로트코드</th>
						<th>품목코드</th>
						<th>품목명</th>
						<th>창고</th>
						<th>구역</th>
						<th>랙</th>
						<th>셀</th>
						<th>입고량</th>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>
		</div>
	</div>
</div>


<!-- Modal 코드 넣을 위치 -->
<div class="modal fade" id="addOrderSheetModal" tabindex="-1">
	<div class="modal-dialog modal-dialog-scrollable modal-lg">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 id="modal-title">입고 등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<!-- form start -->
			<form class="needs-validation" novalidate id="firstModalForm" action="/input_warehouse/add" method="post">
				<div class="modal-body">
						<!-- 컨트롤러로 넘기는 정보 -->
						<!-- input_day -->
						<input type="hidden" name="member_no" class="form-control" readonly>
						<input type="hidden" name="client_no" class="form-control" readonly>
						<input type="hidden" name="ware_no" class="form-control" readonly>
						<input type="hidden" name="area_no" class="form-control" readonly>
						<input type="hidden" name="rack_no" class="form-control" readonly>
						<input type="hidden" name="cell_no" class="form-control" readonly>
						<input type="hidden" name="purchase_Sheet_No" value="0" class="form-control" readonly>
						<input type="hidden" name="status" value="0" class="form-control" readonly>
						<!-- 품목번호 및 개수 -->
						<!-- input type='text' name='item_no' -->
						<!-- input type='text' name='amount' -->
						
								<button type="button" class="btn btn-primary" style="display:block" data-bs-target="#secondModal" data-bs-toggle="modal" data-bs-dismiss="modal" id="choiceOrderBtn">발주서 선택</button>
						<div class="row">		
							<div class="col-sm-3">		
								<label for="day" class="form-label">입고일자</label> 
		                		<input type="date" name="input_day" class="form-control" required onchange="calendarChangeHandler()">
		                		<div class="invalid-feedback">입고일자를 입력해주세요.</div>
							</div>
							<div class="col-sm-4">	
							</div>
						</div>
						
						<div class="row">		
							<div class="col-sm-3">		
								<label for="userFullname" class="form-label">부서명</label>
								<input type="text" id="member_dep_name" class="form-control" readonly>
								<div class="invalid-feedback">담당자를 입력해주세요.</div>
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
								<div class="invalid-feedback">거래처를 입력해주세요.</div>
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
						
						<div class="row">		
							<div class="col-sm-2">		
								<label for="userFullname" class="form-label">창고명</label>
								<input type="text" id="ware_name" class="form-control" readonly>
								<div class="invalid-feedback">창고 입력 요망</div>
							</div>
							<div class="col-sm-2">		
								<label for="userFullname" class="form-label">구역명</label>
								<input type="text" id="area_name" class="form-control" readonly>
							</div>
							<div class="col-sm-2">		
								<label for="userFullname" class="form-label">랙명</label>
								<input type="text" id="rack_name" class="form-control" readonly>
							</div>
							<div class="col-sm-2">		
								<label for="userFullname" class="form-label">셀명</label>
								<input type="text" id="cell_name" class="form-control" readonly>
							</div>
							<div class="col-sm-4">	
								<label for="userFullname" class="form-label">&nbsp;&nbsp;</label>
								<button type="button" class="btn btn-primary" style="display:block" 
							data-bs-target="#MyModal" data-bs-toggle="modal" data-bs-dismiss="modal" 
							id="choiceCellBtn">셀 선택</button>
							</div>
						</div>	
							
						<!-- 상품 상세추가 부분 -->
						<div id="modalItemDetail">
							
							<div class="row">		
								<input type="hidden" name="item_no" class="form-control" readonly>
							
								<div class="col-sm-3">		
									<label for="userFullname" class="form-label">품목코드</label>
									<input type="text" class="form-control choiceItemBtn" data-bs-target="#secondModal" data-bs-toggle="modal" data-bs-dismiss="modal" readonly>
									<div class="invalid-feedback">품목을 입력해주세요.</div>
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
									<input type="text" name="QTY" class="form-control">
									<div class="invalid-feedback">수량 입력요망</div>
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

<!-- 구역선택 모달 -->
<div class="modal fade" id="MyModal" tabindex="-1">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 class="modal-title" id="modaltitle">구역 지정</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form class="needs-validation" novalidate id="taskForm" action="" method="post">
				<input type="hidden" name="sendno" id="sendno">
				<input type="hidden" name="sendid" id="sendid">
				<input type="hidden" name="showid" id="showid">
				
					<div class="mb-3" id="warehouselocationtitle">
						<label for="warehouselocation" class="form-label">상위창고위치</label>
						<select class="dselect form-select" name="warehouselocation" id="warehouselocation" required onchange="change1()">
							<option value="">창고위치를 선택하세요</option>
				            <c:forEach items="${warehouseLists}" var="warehouseLists">
				              <option value="${warehouseLists.no},${warehouseLists.name}">${warehouseLists.name}</option>
				            </c:forEach>
			            </select>
						<div class="invalid-feedback">User full name is required.</div>
					</div>
					<div class="mb-3" id="arealocationtitle">
						<label for="arealocation" class="form-label">상위구역위치</label>
						<select class="dselect form-select" name="arealocation" id="arealocation" required onchange="change2()">
							<option value="">구역위치를 선택하세요</option>
				            <c:forEach items="${areaLists}" var="areaLists">
				              <option value="${areaLists.no},${areaLists.name}">${areaLists.name}</option>
				            </c:forEach>
			            </select>
						<div class="invalid-feedback">User email is required.</div>
					</div>
					<div class="mb-3" id="racklocationtitle">
						<label for="racklocation" class="form-label">상위랙위치</label>
						<select class="dselect form-select" name="racklocation" id="racklocation" required onchange="change3()">
							<option value="">랙위치를 선택하세요</option>
				            <c:forEach items="${rackLists}" var="rackLists">
				              <option value="${rackLists.no},${rackLists.name}">${rackLists.name}</option>
				            </c:forEach>
			            </select>
						<div class="invalid-feedback">User email is required.</div>
					</div>
					
					<div class="mb-3" id="celllocationtitle">
						<label for="celllocation" class="form-label">상위셀위치</label>
						<select class="dselect form-select" name="celllocation" id="celllocation" required>
							<option value="">셀위치를 선택하세요</option>
				            <c:forEach items="${cellLists}" var="cellLists">
				              <option value="${cellLists.no},${cellLists.name}">${cellLists.name}</option>
				            </c:forEach>
			            </select>
						<div class="invalid-feedback">User email is required.</div>
					</div>
					
				</form>
			</div>
			<div class="modal-footer border-0">
				<button type="button" class="btn btn-light" data-bs-target="#addOrderSheetModal" data-bs-toggle="modal" data-bs-dismiss="modal">돌아가기</button>
				<button class="btn btn-primary" data-bs-target="#addOrderSheetModal" data-bs-toggle="modal" 
				data-bs-dismiss="modal" name="delivery_data" id="delivery_data2">확인</button>
				
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
		document.getElementById('input_warehouse').click();
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
	/* 첫번째 모달 이 뜰 때 모달 초기화 */
	$("#addOrderSheet").on("click", function(e){
		//$(this).find('form')[0].reset();
		// 입고일자 초기화
		$("input[name='input_day']").val("");
		
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
	//셀등록모달
	$("#choiceCellBtn").on("click",function(e){
		secondModalName="cell";
		resetmodal();
		$('#arealocation *').remove();
		$('#arealocation').append('<option value="">구역위치를 선택하세요</option>');
		$('#racklocation *').remove();
		$('#racklocation').append('<option value="">랙위치를 선택하세요</option>');
	})
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
		//요청url
		url = "/basicinfo/";
		if (secondModalName == "order"){
			url = "/purchase_sheet/";
		} else {
			url = "/basicinfo/"+secondModalName;
		}
		$.getJSON(url  + "/pages/"+ pageNum +"/" + amount + "/" + searchWhatColumn + "/" + searchKeyword,  
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
	/* 첫번째 모달에서 수주서 선택이 눌렸을 때 이동한 두번째 모달창에서 데이터를 요청하고 관련 화면을 그리는 부분 */
	$("#choiceOrderBtn").on("click", function(e){
		
		pageNum = 1;
		
		// 두번째 모달에서 그려내야할 정보를 지정
		secondModalName = "order";
		console.log("secondModalName: " + secondModalName);
		
		// 두번째 모달의 제목을 지정
		$("#second-modal-title").text("발주서 선택");
		
		// 두번째 모달의 select의 option을 그려내는 코드
		var str = "";
		str += "<option value='' selected>검색 선택</option>";
		str += "<option value='member'>담당자</option>";
		str += "<option value='client'>거래처</option>";
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
		str += "<th scope='col'>발주일자</th>";
		str += "<th scope='col'>담당자</th>";
		str += "<th scope='col'>거래처</th>";
		str += "<th scope='col'>품목명</th>";
		str += "</tr>";
		$("#secondModalThead").html(str);
		
		// 두번째 모달의 테이블의 레코드를 그려내는 코드
		requestClientRecord();
	});
	$("#delivery_data2").on("click", function(e){
		console.log('여기 왔음22');
		var ware = $('select[name=warehouselocation]').val().split(",");
		var area = $('select[name=arealocation]').val().split(",");
		var rack = $('select[name=racklocation]').val().split(",");
		var cell = $('select[name=celllocation]').val().split(",");
		
		console.log(ware);
		console.log(area);
		console.log(rack);
		console.log(cell);
		
		$("#ware_name").val(ware[1]);
		$("#area_name").val(area[1]);
		$("#rack_name").val(rack[1]);
		$("#cell_name").val(cell[1]);
		$("input[name='ware_no']").val(ware[0]);
		$("input[name='area_no']").val(area[0]);
		$("input[name='rack_no']").val(rack[0]);
		$("input[name='cell_no']").val(cell[0]);
		console.log($("input[name='cell_no']").val());
		$("#ware_name").attr("class","form-control is-valid");

		
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

			clickedLocation.attr("class","form-control is-valid choiceItemBtn");

			addRowItemDetail(); // 새로 입력받을 수 있게 아래 줄을 추가하는 함수
		}
		else if(secondModalName == "order"){
			
			//모달창 크기 초기화
			
			//수주서번호
			no = $('input[name=clientRadio]:checked').parent().next().text();
			
			//품목
			
			$.getJSON("/purchase_sheet/selectOrder/"+no,  
		 			function(resdata){
		 				console.log("resdata.order"+resdata.order);
		 				console.log("resdata.detailList"+resdata.detailList);
		 				var vo = resdata.order;
		 				
		 				//주문서 삽입
		 				$("input[name='purchase_Sheet_No']").val(vo.no);
		 				$("input[name='status']").val(1);
		 				
		 				//날짜 삽입
		 				$("input[name='input_day']").val(vo.day);
		 				$("input[name='input_day']").attr("class","form-control is-valid");
		 				
		 				//담당자 삽입
		 				$("input[name='member_no']").val(vo.member_no);
		 				$("#member_dep_name").val(vo.dep_name);
		 				$("#member_name").val(vo.member_name);
		 				$("#member_name").attr("class","form-control is-valid");
		 				$("#member_dep_name").attr("class","form-control is-valid");
		 				//거래처 삽입
		 				$("input[name='client_no']").val(vo.client_no);
		 				$("#client_code").val(vo.client_code);
		 				$("#client_name").val(vo.client_name);
		 				$("#client_code").attr("class","form-control is-valid");
		 				$("#client_name").attr("class","form-control is-valid");
		 				
		 				//품목삽입
		 				var orderDetail = resdata.detailList;
		 				
		 				for(i=0; i<orderDetail.length; i++){
		 					console.log(orderDetail[i]);
		 					
		 					var str = "<div class='row'>";
		 					str += "<input type='hidden' name='item_no' class='form-control' value='" + orderDetail[i].item_no + "' readonly>"; 
		 					str += "<div class='col-sm-3'>";
		 					str += "<label for='userFullname' class='form-label'>품목코드</label>";
		 					str += "<input type='text' class='form-control choiceItemBtn' value='" + orderDetail[i].item_code + "' readonly>";
		 					str += "</div>";
		 					str += "<div class='col-sm-3'>";
		 					str += "<label for='userFullname' class='form-label'>품목명</label>";
		 					str += "<input type='text' class='form-control' value='" + orderDetail[i].item_name + "' readonly>";
		 					str += "</div>";
		 					str += "<div class='col-sm-2'>";
		 					str += "<label for='userFullname' class='form-label'>취급처</label>";
		 					str += "<input type='text' class='form-control' value='" + orderDetail[i].client_name + "' readonly>";
		 					str += "</div>";
		 					str += "<div class='col-sm-2'>";
		 					str += "<label for='userFullname' class='form-label'>수량</label>";
		 					str += "<input type='text' name='QTY' value='" + orderDetail[i].amount + "' class='form-control'>";
		 					str += "<div class='invalid-feedback'>수량 입력요망</div>";
		 					str += "</div>";
		 					str += "<div class='col-sm-2'>";
		 					str += "<label for='userFullname' class='form-label'>&nbsp;&nbsp;</label>";
		 					str += "<button type='button' class='btn btn-primary deleteItemBtn' style='display:block'>삭제</button>";
		 					str += "<input type='hidden' name='detail_no' class='form-control' value='" + orderDetail[i].no + "' readonly>"; 
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
		str += "<div class='col-sm-3'>";
		str += "<label for='userFullname' class='form-label'>품목코드</label>";
		str += "<input type='text' class='form-control choiceItemBtn' data-bs-target='#secondModal' data-bs-toggle='modal' data-bs-dismiss='modal' readonly>";
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
		str += "<input type='text' name='QTY' class='form-control'>";
		str += "<div class='invalid-feedback'>수량 입력요망</div>";
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
	
	//상위창고위치 셀렉트 선택에 따른 상위구역위치 옵션 설정
	function change1(){
		$.ajax({
			url : "/basicinfo/warehouse/OptionsByLocationNo",
			type : "post",
			data : ({
				"no" : taskForm.warehouselocation.selectedIndex
			}),
			success : function(data){
				var mydata = JSON.parse(data);
				
				$('#arealocation *').remove();
				$('#arealocation').append('<option value="">구역위치를 선택하세요</option>');
				$('#racklocation *').remove();
				$('#racklocation').append('<option value="">랙위치를 선택하세요</option>');
				if(mydata !=null){
					$.each(mydata,function(i){
						option = '<option value="'+mydata[i].no+','+mydata[i].name+'">'+mydata[i].name+'</option>';
						$('#arealocation').append(option);
					});//each
				}//if
			},
			error: function (request, status, error) {
		        console.log("code: " + request.status);
		        console.log("message: " + request.responseText);
		        console.log("error: " + error);
		    }
		});//ajax
	}


	//상위구역위치 셀렉트 선택에 따른 상위랙위치 옵션 설정
	function change2(){
		$.ajax({
			url : "/basicinfo/warehouse/OptionsByAreaLocationNo",
			type : "post",
			data : ({
				"no" : taskForm.arealocation.selectedIndex
			}),
			success : function(data){
				var mydata = JSON.parse(data);
				
				$('#racklocation *').remove();
				$('#racklocation').append('<option value="">랙위치를 선택하세요</option>');
				if(mydata !=null){
					$.each(mydata,function(i){
						option = '<option value="'+mydata[i].no+','+mydata[i].name+'">'+mydata[i].name+'</option>';
						$('#racklocation').append(option);
					});//each
				}//if
			},
			error: function (request, status, error) {
		        console.log("code: " + request.status);
		        console.log("message: " + request.responseText);
		        console.log("error: " + error);
		    }
		});//ajax
	}
	//상위구역위치 셀렉트 선택에 따른 상위랙위치 옵션 설정
	function change3(){
		$.ajax({
			url : "/basicinfo/warehouse/OptionsByRackLocationNo",
			type : "post",
			data : ({
				"no" : taskForm.arealocation.selectedIndex
			}),
			success : function(data){
				var mydata = JSON.parse(data);
				
				$('#celllocation *').remove();
				$('#celllocation').append('<option value="">셀위치를 선택하세요</option>');
				if(mydata !=null){
					$.each(mydata,function(i){
						option = '<option value="'+mydata[i].no+','+mydata[i].name+'">'+mydata[i].name+'</option>';
						$('#celllocation').append(option);
					});//each
				}//if
			},
			error: function (request, status, error) {
		        console.log("code: " + request.status);
		        console.log("message: " + request.responseText);
		        console.log("error: " + error);
		    }
		});//ajax
	}



	//모달리셋
	function resetmodal(){
		//잠긴 셀렉트박스들 해제
		document.getElementById('warehouselocation').disabled = false;
		document.getElementById('arealocation').disabled = false;
		document.getElementById('racklocation').disabled = false;
		document.getElementById('celllocation').disabled = false;
		
		//input 데이터들 리셋
		document.getElementById('warehouselocation').value = '';
		document.getElementById('arealocation').value= '';
		document.getElementById('racklocation').value= '';
		document.getElementById('celllocation').value= '';
		
	};
	
	/* 하나짜리 삭제버튼 눌렸을 때 처리 */
	$(".deleteOneBtn").on("click", function(e){
		e.stopPropagation(); // 부모에게 이벤트가 상위 전파 안되도록 막음(버튼을 누르는데 부모인 tr에 이벤트를 걸어뒀더니 중복으로 실행되어 이걸 사용)		
		clickedBtnInMain = "delete_one";
		$("#deleteCheckModal input").eq(0).val($(this).data("no"));
		 
		if(confirm("삭제하시겠습니까?")){
			$("#deleteCheckModalForm").attr("action", "/input_warehouse/delete/one");
			$("#deleteCheckModalForm").submit();
		}
	});
</script>
<!-- 리스트 화면에서 클릭시 아래 Detail 레코드들을 가져와 뿌려주는 코드 -->
<script type="text/javascript">
	$(function(){
		
		/* 비동기로 하단의 상세품목을 불러와 출력해주는 부분 */
		$("#table1 tbody tr").on("click", function(){
			// 클릭된 수주서의 no 번호
			var clickedMainNo = $(this).children("td")[0].innerHTML;
			console.log("clickedMainNo: " + clickedMainNo);
			
			console.log("요청url : " + "/input_warehouse/input_warehousedetail/" + clickedMainNo);
			$.getJSON("/input_warehouse/input_warehousedetail/" + clickedMainNo,  
	 			function(list){
					console.log("list: " + list);
					
					$("#table2 tbody").empty();
					
					for(var i = 0, len = list.length || 0; i < len; i++){
						
						var str = "";
						
						str += "<tr>";
						str += "<td style='display:none'>" + list[i].no + "</td>";
						str += "<td style='display:none'>" + list[i].input_WareHouse_No + "</td>";
						
						
						str += "<td>" + list[i].purchase_Sheet_No + "</td>";
						str += "<td><span class='badge bg-dark'>" + list[i].lot_Code + "</span></td>";
						str += "<td>" + list[i].item_code + "</td>";
						str += "<td>" + list[i].item_name + "</td>";
						str += "<td>" + list[i].ware_name + "</td>";
						str += "<td>" + list[i].area_name + "</td>";
						str += "<td>" + list[i].rack_name + "</td>";
						str += "<td>" + list[i].cell_name + "</td>";
						str += "<td>" + list[i].qty + " 개</td>";
						str += "</tr>";
						
						$("#table2 tbody").append(str);
					}
	 				
	 			}).fail(function(xhr, status, err){
	 					alert("데이터 조회실패");
	 			});
			
			
		});
		
		
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
	$("#modalRegisterBtn").on("click", function(e){
		
		
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
		
		if($("input[name='input_day']").val() == ""){
			$("input[name='input_day']").attr("class","form-control is-invalid");
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
		if($("#ware_name").val() == ""){
			$("#ware_name").attr("class","form-control is-invalid");
			isValid = false;
		}
		
		//모든 요소를 돌아보고 처리해야함.
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
					$(this).attr("class","form-control is-invalid choiceItemBtn");
					isValid = false;
				}
			});
		}
		
		if(isValid == false){
			return;
		}
		console.log("isValid:" + isValid);
		//form submit
		$("#firstModalForm").submit();
	});
	
	function calendarChangeHandler(){
		$("input[name='input_day']").attr("class","form-control is-valid");
	}
	/* 이하 등록모달폼, 수정모달폼 유효성 검사  */
	$("#modalItemDetail").on("keyup", "input[name='QTY']", function(){
		$(this).attr("class","form-control is-valid");
		
		if(isNaN($(this).val())){
			alert("수량은 숫자만 입력 가능합니다.");
			$(this).val("");
			$(this).focus();
		}
	});
</script>