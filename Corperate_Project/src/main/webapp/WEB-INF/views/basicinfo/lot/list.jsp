<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
			
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
.btn_search{
  cursor : pointer;
  position : absolute;
  right : 65px;
  top : 50%;
  transform : translatey(-50%);
}
#search{
  position : relative;
}
</style>



<!-- top.jsp -->
<%@include file="../../common/top.jsp"%>

<div class="card" >
	<div class="card-body">
		<div class="d-flex gap-1 mb-4 flex-wrap">
			<div class="search" >
			<form name="search" action="/basicinfo/lot/list" id="search">
			<table>
			<tr>
				<td>
					<select id="whatColumn" name="whatColumn" class="form-select" style="width: 200px;" id="whatColumn" >
	                  <%
	                  String[] search = {"code","item_no"};
	                  String[] cate = {"로트번호","상품명"};
	                  %>
	                  <c:set value="<%=search %>" var="s"></c:set>
	                  <c:set value="<%=cate %>" var="c"></c:set>
	                  <option>검색 선택</option>
	                  	<c:forEach begin="0" end="1" var="i">
	                  		<option value="${s[i] }"<c:if test="${searchvo.whatColumn== s[i] }">selected</c:if>>${c[i] }</option>
	                  	</c:forEach>
	              </select>
				</td>
				<td>
					<input type="text"  name="keyword" id="keyword" class="form-control" value=<c:if test="${searchvo.keyword=='null' }">""</c:if><c:if test="${searchvo.keyword!='null' }">"${searchvo.keyword }"</c:if>  placeholder="입력" style="width: 200px; height: 38px;">
				</td>
				<td>
					<i class="fa-solid fa-magnifying-glass btn_search" id="searchIcon" onclick="searchForm()"></i>
				</td>
				<td><button class="btn btn-light d-inline-flex align-items-center gap-1" onclick="selectDelete()"><i class="fa-regular fa-trash-can fa-1.5x" style="height: 20px;"></i></button></td>
			</tr>	
			</table>
				</form>
			</div>
		</div>
		<div class="table-responsive my-1">
		 <form name="f" action="/basicinfo/client/selectDelete" method="post">
			<table class="table align-middle">
				<thead>
					<tr>
						<th scope="col">
							<div>
								<input class="form-check-input" type="checkbox" name="allselect" onclick="allSelect()" value="">
							</div>
						</th>
						<th scope="col">LOT 번호</th>
						<th scope="col">상품명</th>
						<th scope="col">삭제</th>
					</tr>
				</thead>
				<tbody id="table_insert">
					<!-- 여기에 넣어야함 테이블 -->
					<c:if test="${fn:length(list)==0 }">
					<tr height="400px">
						<td colspan="7" align="center"><br><br><i class="fa-regular fa-circle-xmark fa-4x"></i><br><br>검색된 결과가 없습니다</td>
					</tr>
					</c:if>
					<c:forEach var="item" items="${list }">
					<tr>
						<td>
							<div>
								<input class="form-check-input" type="checkbox" name="rowcheck" value="${item.no }">
							</div>
						</td>
						<td>${item.code }</td>
						<td>${item.no }</td>
						<td>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex text-danger" onclick="deleteClient('${item.no}')" >
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
		<div align="center">
			${pageInfo.pagingHtml}
		</div>
	</div>
</div>

<!-- Modal 코드 넣을 위치 -->
<!-- Add user modal -->
<div class="modal fade" id="ClientModal" tabindex="-1" >
	<div class="modal-dialog modal-dialog-scrollable" >
		<div class="modal-content" >
			<div class="modal-header border-0" >
				<h5 id="modal-title"></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form class="row g-3" name="modalForm" id="modalForm" action="" method="post">
				
				<!-- 수정했을때도 가게 만들기위해 -->
				<input type="hidden" name="keyword" id="keyword2" value="">
				<input type="hidden" name="whatColumn" id="whatColumn" value="">
             
              <div class="col-sm-5" style="width:250px;">
                <label for="code" class="form-label">거래처 코드</label>
                <input type="hidden" name="no" id="no" value="">
                <input type="text" class="form-control" aria-describedby="emailHelp" name="code" id="code" placeholder="거래처 코드">
              </div>
              <div class="col-sm-4" style="width: 227px;">
                <label for="category" class="form-label">분류</label>
                <select id="category" name="category" class="form-select">
                  <option selected value="">선택</option>
                  <option value="수주처">수주처</option>
                  <option value="발주처">발주처</option>
                </select>
              </div>
            
              <div class="col-sm-5" style="width: 250px;">
                <label for="name" class="form-label">거래처명</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="거래처명">
              </div>
              <div class="col-sm-4" style="width: 227px;">
                <label for="owner" class="form-label">대표자명</label>
                <input type="text" class="form-control" id="owner" name="owner" placeholder="대표자명">
              </div>
              <div class="col-12">
                <label for="tel" class="form-label">전화번호</label>
                <input type="text" class="form-control" id="tel" name="tel" placeholder="010-1234-5678">
              </div>
              <div class="col-12">
                <label for="fax" class="form-label">팩스번호</label>
                <input type="text" class="form-control" id="fax" name="fax" placeholder="02-123-5678">
              </div>
              <div class="col-sm-4">
                <label for="bank" class="form-label">은행명</label>
                <select id="bank" name="bank" class="form-select">
                  <option selected value="">선택</option>
                  <option value="KEB">KEB</option>
                  <option value="SC제일">SC제일</option>
                  <option value="국민">국민</option>
                  <option value="신한">신한</option>
                  <option value="외환">외한</option>
                  <option value="우리">우리</option>
                  <option value="한국시티">한국시티</option>
                </select>
              </div>
               <div class="col-sm-5" style="width:318px;">
                <label for="account" class="form-label">계좌번호</label>
                <input type="text" class="form-control" name="account" id="account" placeholder="302-1209-3456">
              </div>
              <div class="col-12">
              	<label for="address1" class="form-label">주소</label>
                <input type="text" class="form-control" id="address1" name="address1" placeholder="주소" readonly>
                <input type="hidden" class="form-control" id="zipcode" name="zipcode" placeholder="주소">
              </div>
              <div  class="col-12">
              	<label for="address2" class="form-label">상세주소</label>
                <input type="text" class="form-control" id="address2" name="address2" placeholder="상세주소">
              </div>
                <input class="btn btn-outline-primary" id="search_zipcode" type="button" value="우편번호 찾기" onclick="execDaumPostcode()">
				<div class="col-12">
	                <label for="email" class="form-label">이메일</label>
	                <input type="email" class="form-control" id="email" name="email" placeholder="이메일">
	              </div>
	          <!-- 수정 했을 때 넘기기 위해 -->
	          <input type="hidden" name="pageNumber" id="pageNumber" value="${pageInfo.pageNumber }">
            </form>
			</div>
			<div class="modal-footer border-0">
				<button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
				<button type="button" form="taskForm" class="btn btn-primary px-5" id="okaybtn"></button>
			</div>
		</div>
	</div>
</div>

<!-- bottom.jsp -->
<%@include file="../../common/bottom.jsp"%>
<!-- 오른쪽 상단 아이콘 관련 -->
<script src="https://kit.fontawesome.com/75769dc150.js" crossorigin="anonymous"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script type="text/javascript">
	var modal = $(".modal");
	var modalForm = $("#modalForm");
	$(function(){
	/* 메뉴바가 클릭되게 하기 위해 */
	document.getElementById('basicinfo').click();
	
	})
	
	/* 삭제 버튼 눌렀을 때  */
	function deleteClient(item_no){
		var whatColumn = $('select option:selected').val();
		var keyword = $('#keyword').val();
		var pageNumber = $('#pageNumber').val();

		if(confirm("삭제하시겠습니까?")){
			location.href="/basicinfo/lot/delete?item_no="+item_no+"&whatColumn="+whatColumn+"&keyword="+keyword+"&pageNumber="+pageNumber;
		}
		
	}
	
	/* 검색 */
	function searchForm(){
		search.submit();
	}
	
	
	/* 체크박스 */
	function allSelect(){
		var ac = document.f.allselect;
		var rc = document.f.rowcheck;

	if (ac.checked) {
			for (var i = 0; i < rc.length; i++) {
				rc[i].checked = true;
			}
		}
	else {
			for (var i = 0; i < rc.length; i++) {
				rc[i].checked = false;
			}
		}
	
	}//allselect
	
	function selectDelete(){

		x=false;
		var rc = document.f.rowcheck;
		
		for(var i=0;i<rc.length;i++){
			if(rc[i].checked==true){
				x=true;
			}
		}
		if(!x){
			alert("체크박스를 선택하세요");
			return;
		}
		if(confirm("삭제하시겠습니까?"))
			f.submit();
		}
	
	function addreadonly(){
		$("#code" ).prop('readonly', true);
		$('#category').attr('disabled', true);
		$("#name" ).prop('readonly', true);
		$("#owner" ).prop('readonly', true);
		$("#tel" ).prop('readonly', true);
		$("#fax" ).prop('readonly', true);
		$('#bank').attr('disabled', true);
		$("#account" ).prop('readonly', true);
		$("#zipcode" ).prop('readonly', true);
		$("#address1" ).prop('readonly', true);
		$("#address2" ).prop('readonly', true);
		$("#email" ).prop('readonly', true);
		$('#search_zipcode').hide();
	}
	function deletereadonly(){
		$("#code" ).prop('readonly', false);
		$('#category').attr('disabled', false);
		$("#name" ).prop('readonly', false);
		$("#owner" ).prop('readonly', false);
		$("#tel" ).prop('readonly', false);
		$("#fax" ).prop('readonly', false);
		$('#bank').attr('disabled', false);
		$("#account" ).prop('readonly', false);
		$("#zipcode" ).prop('readonly', false);
		$("#address1" ).prop('readonly', false);
		$("#address2" ).prop('readonly', false);
		$("#email" ).prop('readonly', false);
		$('#search_zipcode').show();
	}
	
</script>
