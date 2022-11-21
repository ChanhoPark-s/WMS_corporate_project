<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
table th {
	text-align: center;
}

table td {
	text-align: center;
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


<!-- top.jsp -->
<%@include file="../../common/top.jsp"%>

<div class="card">
	<div class="card-body">
		<div class="d-flex gap-1 mb-4 flex-wrap">
			<div class="d-flex gap-1 me-auto flex-wrap" style="height: 20px;">
				<button id="insertBtn" onclick="insertBtn()"class="btn btn-primary d-inline-flex align-items-center gap-1 add"
					data-bs-toggle="modal" data-bs-target="#itemModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd" />
                  </svg>
                  상품 등록
				</button>
				<button class="btn btn-light d-inline-flex align-items-center gap-1" onclick="selectDelete()"><i class="fa-regular fa-trash-can fa-1.5x"></i></button>
			</div>
			<form action="/basicinfo/item/list" method="get"> 
			<table>
			<tr>
				<td><select name="whatColumn" id="whatColumn" class="dselect form-select" data-dselect-clearable="true">
					<option value="">선택</option>
					<option value="code">품목코드</option>
					<option value="client_name">거래처명</option>
					<option value="name">품목명</option>
				</select></td>
				<td>
				<input type="text" class="form-control" placeholder="입력 후 Enter" name="keyword" id="keyword">
				</td>
			</tr>
			</table>
			</form>
		</div>
		<div class="table-responsive my-1">
			 <form name="f" action="/basicinfo/item/selectDelete" method="post">
			<table class="table align-middle">
				<thead>
					<tr>
					<th scope="col">
							<div>
								<input class="form-check-input" type="checkbox" id="allselect" name="allselect" onclick="allSelect()">
							</div>
						</th>
						<th scope="col">번호</th>
						<th scope="col">이미지</th>
						<th scope="col">품목코드</th>
						<th scope="col">거래처명</th>
						<th scope="col">품목</th>
						<th scope="col">입고단가</th>
						<th scope="col">출고단가</th>
						<th scope="col">수정/삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${lists}">
					<tr>
					<td>
							<div>
								<input class="form-check-input" type="checkbox" id="rowcheck" name="rowcheck" value="${item.no }">
								<!--선택 삭제할때도 넘어가게하기 위해  -->
								<input type="hidden" name="keyword" id="keyword3" >
								<input type="hidden" name="whatColumn" id="whatColumn2">
             					<input type="hidden" name="pageNumber" id="pageNumber2">
							</div>
						</td>
						<td>${item.no} </td>
						<td> <!-- 이미지 -->
						<img src="<%=request.getContextPath()%>/resources/assets/img/item/${item.image}" width="70" height="70" loading="lazy">
						</td>
						<td>${item.code}</td> 
						<td>${item.client_name}</td>
						<td>${item.name}</td>
						<td><fmt:formatNumber pattern="###,###" value="${item.in_price}" var="in_price"/>${in_price} 원</td>
						<td><fmt:formatNumber pattern="###,###" value="${item.out_price}" var="out_price"/>${out_price} 원</td>
						<td>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex" data-bs-toggle="modal" data-bs-target="#itemModal" onclick="update('${item.no}')" >
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                          </svg>
								</button>
								<button type="button" class="btn btn-light d-flex text-danger" onclick="deleteItem('${item.no}')">
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
<div class="modal fade" id="itemModal" tabindex="-1">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 id="modal-title"></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form class="needs-validation" novalidate id="modalForm" name="modalForm" action="" enctype="multipart/form-data" method="post" >
				<input type="hidden"id="no" name="no">
					<div>
                <label for="image" class="form-label">이미지</label> 
                <input class="form-control" type="file" id="upload" name="upload">
              		</div>
					<div class="mb-3">
						<label for="code" class="form-label">품목코드</label> <input
							type="text" class="form-control" id="code" name="code"
							placeholder="품목코드 입력은 필수입니다." >
					</div>
								<div class="row">		
						<div class="col-sm-3">		
							<label for="client_code" class="form-label">거래처코드</label>
							<input type="text" id="client_code" name="client_code" class="form-control" readonly>
						</div>
						<div class="col-sm-5">		
							<label for="client_name" class="form-label">거래처명</label>
							<input type="text" id="client_name" name="client_name"class="form-control" readonly>
							<input type="hidden" name="client_no" id="client_no" class="form-control" readonly>
						</div>
						<div class="col-sm-4">	
							<label for="client_no" class="form-label">&nbsp;&nbsp;</label>
							<button type="button" class="btn btn-primary" style="display:block" data-bs-target="#choiceClientModal" data-bs-toggle="modal" data-bs-dismiss="modal" id="choiceClientBtn">거래처 선택</button>	
						</div>
					</div>
					<div class="mb-3">
						<label for="name" class="form-label">품목</label> <input
							type="text"class="form-control" id="name" name="name"
							placeholder="품목 입력은 필수입니다.">
					</div>
					<div class="mb-3">
						<label for="in_price" class="form-label">입고단가</label> <input
							type="text" class="form-control" id="in_price" name="in_price"
							placeholder="입고단가 입력은 필수입니다.">
					</div>
					<div class="mb-3">
						<label for="out_price" class="form-label">출고단가</label> <input
							type="text" class="form-control" id="out_price" name="out_price"
							placeholder="출고단가 입력은 필수입니다.">
					</div>
					 <input type="hidden" name="pageNumber" id="pageNumber" value="${pageInfo.pageNumber }">
				</form>
			</div>
			<div class="modal-footer border-0">
				<button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
				<button type="button" form="taskForm" id="modaladdBtn" class="btn btn-primary px-5"></button>
			</div>
		</div>
	</div>
</div>

<!-- 거래처를 선택하는 두번째 모달 -->
<div class="modal fade" id="choiceClientModal" tabindex="-2">
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
							<ul class="pagination pagination-borderless justify-content-end" id="clientPageNation">
								<!-- 페이지내이션이 javascript 코드에 의해 그려지는 위치 -->
							</ul>
						</nav>
						
					</div>
				
			<div class="modal-footer border-0">
				<button type="button" class="btn btn-light" data-bs-target="#itemModal" data-bs-toggle="modal" data-bs-dismiss="modal">돌아가기</button>
				<button class="btn btn-primary" data-bs-target="#itemModal" data-bs-toggle="modal" data-bs-dismiss="modal" id="delivery_data">확인</button>
			</div>
		</div>
	</div>
</div>

<!-- bottom.jsp -->
<%@include file="../../common/bottom.jsp"%>

<script src="https://kit.fontawesome.com/75769dc150.js" crossorigin="anonymous"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script type="text/javascript">
	var modalForm = $("#modalForm");
	var check = false;
	var code = $("#code").val();
	
	$(function(){
		/* 왼쪽 카테고리창이 해당화면에 맞게 펼쳐지게 하는 코드 */
	    document.getElementById('basicinfo').click();
		
		// 유효성 검사
	    $('#code').keyup(function(){
			check = false;
			$.ajax({
			url: "/basicinfo/item/code_check",
			type: "post",
			data:{ code : code },
			success: function (data) {
			if(data!=0) {//사용자가 입력한 값이 DB에 존재할 경우, 서버가 1을 보내준다
				$('#code').attr("class","form-control is-invalid");
				}
			else {
				$('#code').attr("class","form-control is-valid");
				check = true;
					}
				}//sucess 
			});//ajax
		});//key up
		 $('#upload').keyup(function(){$('#upload').attr("class","form-control is-valid")})
		 $('#code').keyup(function(){$('#code').attr("class","form-control is-valid")})
		 $('#client_code').keyup(function(){$('#client_code').attr("class","form-control is-valid")})
		 $('#client_name').keyup(function(){$('#client_name').attr("class","form-control is-valid")})
		 $('#name').keyup(function(){$('#name').attr("class","form-control is-valid")})
		 $('#in_price').keyup(function(){$('#in_price').attr("class","form-control is-valid")})
		 $('#out_price').keyup(function(){$('#out_price').attr("class","form-control is-valid")})
	    })
		
	   
		
	    function insertBtn(){
		clearModal();
		document.getElementById('no').value='123';
		$(".modal").find("#modal-title").text("등록하기");
		$(".modal").find("#modaladdBtn").show();
		$(".modal").find('#modaladdBtn').text("등록");
		readonly(false);
		modalForm.attr("action", "/basicinfo/item/insert");
		$('#modaladdBtn').click(function(){
			if($("#upload").val() ==''){
				$('#upload').attr("class","form-control is-invalid");
			    $("#upload").focus();
			    alert("사진은 필수입니다.");
			}
			else if($("#code").val() ==''){
				$('#code').attr("class","form-control is-invalid");
			    $("#code").focus();
			}
			else if(!check){
				$('#code').attr("class","form-control is-invalid")
				$('#code').focus();
				alert("품목코드가 중복되었습니다.")
			}	 
			else if($("#client_code").val() ==''){
				$('#client_code').attr("class","form-control is-invalid");
			    $("#client_code").focus();
			}
			else if($("#client_name").val() ==''){
				$('#client_name').attr("class","form-control is-invalid");
			    $("#client_name").focus();
			}
			else if($("#name").val() ==''){
				$('#name').attr("class","form-control is-invalid");
			    $("#name").focus();
			}
			else if($("#in_price").val() ==''){
				$('#in_price').attr("class","form-control is-invalid");
			    $("#in_price").focus();
			}
			else if($("#out_price").val() ==''){
					$('#out_price').attr("class","form-control is-invalid");
			    	$("#out_price").focus();
			}
			else{
				modalForm.submit();
			}
		})
		
	
		
}
//등록하기 버튼
//삭제
		function deleteItem(no){
			if(confirm("삭제하시겠습니까?")){
				var whatColumn = $('select option:selected').val();
				var keyword = $('#keyword').val();
				var pageNumber = $('#pageNumber').val();
				location.href="/basicinfo/item/delete?no="+no+"&whatColumn="+whatColumn+"&keyword="+keyword+"&pageNumber="+pageNumber;
		
			}
		};
		//수정 버튼
		function update(no){
			
			document.getElementById('no').value=no;
			$(".modal").find("#modal-title").text("수정하기");
			$(".modal").find('#modaladdBtn').show();
			$(".modal").find('#modaladdBtn').text("수정");
			
			
			modalForm.attr("action", "/basicinfo/item/update");
			
			$.ajax({
					url : "/basicinfo/item/get ",
					type : "post",
					data : {  
						no : no 
					},
					dataType:'json',
					success : function(data){
						$('#code').attr('readonly','true');
						document.getElementById('code').value=data.code;
						document.getElementById('client_code').value=data.client_code;
						document.getElementById('client_name').value=data.client_name;
						document.getElementById('client_no').value=data.client_no;
						document.getElementById('name').value=data.name;
						document.getElementById('in_price').value=data.in_price;
						document.getElementById('out_price').value=data.out_price;
					}//success
				}); //ajax
			
				$('#modaladdBtn').click(function(){
					if($("#upload").val() ==''){
						$('#upload').attr("class","form-control is-invalid");
					    $("#upload").focus();
					    alert("사진은 필수입니다.");
					}
					else if($("#code").val() ==''){
						$('#code').attr("class","form-control is-invalid");
					    $("#code").focus();
					}
					else if($("#client_code").val() ==''){
						$('#client_code').attr("class","form-control is-invalid");
					    $("#client_code").focus();
					}
					else if($("#client_name").val() ==''){
						$('#client_name').attr("class","form-control is-invalid");
					    $("#client_name").focus();
					}
					else if($("#name").val() ==''){
						$('#name').attr("class","form-control is-invalid");
					    $("#name").focus();
					}
					else if($("#in_price").val() ==''){
						$('#in_price').attr("class","form-control is-invalid");
					    $("#in_price").focus();
					}
					else if($("#out_price").val() ==''){
							$('#out_price').attr("class","form-control is-invalid");
					    	$("#out_price").focus();
					}
					else{
						modalForm.submit();
					}
				})
				
				
		}//update
		
			/* $('#modaladdBtn').click(function(){
				if($("#code").val() == ""){
					$('#code').attr("class","form-control is-invalid");
			    	$("#code").focus();
				
				}
				
			}) */
	
		function clearModal(){
		
			document.getElementById('code').value="";
			document.getElementById('client_code').value="";
			document.getElementById('client_no').value="";
			document.getElementById('client_name').value="";
			document.getElementById('name').value="";
			document.getElementById('in_price').value="";
			document.getElementById('out_price').value="";
		}
		
		function readonly(x){
			$("#code" ).prop('readonly', x);
		}
		
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
			}
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
			if(confirm("삭제하시겠습니까?")){
				f.submit();
			}

		}

		<!-- 거래처를 선택하는 두번째 모달처리 -->

			/* 전역변수 */
			var secondModalName = ""; // member or client 이 값은 두번째 모달로 넘어가는 버튼에 의해 변경된다. 
			var pageNum = 1;
			var amount = 10;
			var searchWhatColumn = "";
			var searchKeyword = "";

			/* 두번째 모달에서 첫번째 모달로 데이터를 옮기는 코드 */
			$("#delivery_data").on("click", function(e){
				
				if(secondModalName == "client"){
					var clientNo = $('input[name=clientRadio]:checked').parent().next().text();
					var clientCode = $('input[name=clientRadio]:checked').parent().next().next().text();
					var clientName = $('input[name=clientRadio]:checked').parent().next().next().next().text();
						
					$("input[name='client_no']").val(clientNo);
					$("#client_code").val(clientCode);
					$("#client_name").val(clientName);	
				}
			});
			
			
			
			/* 첫번째 모달에서 거래처 선택이 눌렸을 때 이동한 두번째 모달창에서 데이터를 요청하고 관련 화면을 그리는 부분 */
			$("#choiceClientBtn").on("click", function(e){
				
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
			
			/* ajax로 거래처정보를 요청하는 부분 + 화면전환없이 레코드들을 그리는 부분 + 화면전환없이 페이지네이션을 그리는 부분 */
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
			
			/* 거래처 선택 모달의 거래처 레코드들을 그리는 함수 */
			function paintRecord(list){

					var str = "";
					
					if(secondModalName == "client"){
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
					
					if(list.length == 0){
						str = "<tr><td colspan='5' style='text-align:center'>검색결과가 없습니다</td></tr>";
					}
					
					$("#secondModalTbody").html(str);
			}
			
			/* 거래처 선택 모달의 페이지네이션을 그리는 함수 */
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
				
				$("#clientPageNation").html(str);
			}
			
			/* 거래처 선택 모달의 페이지네이션에서 번호 클릭시 다시 그리는 함수 */
			$("#clientPageNation").on("click", "li a", function(e){
				e.preventDefault(); // 번호를 눌러도 페이지가 이동하지 않도록 a태그 기능 무력화
				pageNum = $(this).attr("href");
				
				requestClientRecord();
			});
			
			/* 거래처 선택 모달에서 사용자가 검색을 시도할 때 이를 처리하는 부분*/
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
</script>