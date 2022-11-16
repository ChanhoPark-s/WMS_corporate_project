<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
			
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
.btn_search{
  cursor : pointer;
  position : absolute;
  right : 7px;
  top : 50%;
  transform : translatey(-50%);
}
#search{
  position : relative;
}
</style>



<!-- top.jsp -->
<%@include file="../../common/top.jsp"%>

<div class="card">
	<div class="card-body">
		<div class="d-flex gap-1 mb-4 flex-wrap">
			<div class="d-flex gap-1 me-auto flex-wrap" style="height: 20px;">
				<button id="insert_btn" onclick="insert_btn()"
					class="btn btn-primary d-inline-flex align-items-center gap-1"
					data-bs-toggle="modal" data-bs-target="#ClientModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd" />
                  </svg>
					거래처 등록
				</button>
				<button class="btn btn-light d-inline-flex align-items-center gap-1" onclick="inbtn('발주처')">
				<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" viewBox="0 0 150 150"><path d="m137 40-5-1H55c-3 1-5 4-5 7 0 4 3 8 7 8h68l-6 31c-1 4-4 6-7 6H55c-3 0-6-2-7-6L36 30c-2-7-8-12-15-12h-5a8 8 0 0 0 0 15h5l12 55c2 11 11 18 22 18h57c9 0 18-6 21-15l4-18 3-19 1-4 1-4c0-3-2-6-5-6Zm-99 81a11 11 0 1 0 23 0 11 11 0 0 0-23 0Zm68 0a11 11 0 1 0 22 0 11 11 0 0 0-22 0Zm0 0" style="stroke:none;fill-rule:nonzero;fill:#000;fill-opacity:1"/></svg>
					발주처
				</button>
				<button class="btn btn-light d-inline-flex align-items-center gap-1" onclick="inbtn('수주처')">
				<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" viewBox="0 0 384 384"><path d="m91 102-11 11a8 8 0 1 0 11 11l11-11a8 8 0 0 0-11-11ZM52 141l-7 7a8 8 0 1 0 11 11l7-7a8 8 0 0 0-11-11Zm0 0" style="stroke:none;fill-rule:nonzero;fill:#000;fill-opacity:1"/><path d="m382 138-90-90c-3-3-8-3-11 0l-37 37a8 8 0 0 0 0 11l3 3-10 11c-4 4-9 6-16 7h-62c-4 0-8 1-11 4l-5-5 3-3a8 8 0 0 0 0-11l-43-43c-3-3-8-3-11 0L2 149a8 8 0 0 0 0 11l43 43a8 8 0 0 0 11 0l3-3 11 11c4 4 7 9 9 14v1c3 7 7 13 12 18l87 87a23 23 0 0 0 38-7 23 23 0 0 0 30-12 23 23 0 0 0 31-31l6-5h1c8-9 8-23 0-32l-1-1 15-14c4-5 10-12 13-20l1-1 8-13 12-12 2 3a8 8 0 0 0 11 0l37-37c3-3 3-8 0-11ZM53 184l-2 2-32-32 79-79 32 32-3 3Zm220 81h-1c-2 3-7 3-10 0a278015 278015 0 0 0-48-47 8 8 0 0 0-8 13l56 57c2 3 2 7 0 9-3 3-8 3-11 0l-60-60a8 8 0 0 0-11 0 8 8 0 0 0 0 11l51 51a7 7 0 0 1-6 11l-5-2-56-56a8 8 0 0 0-11 11l48 48c1 3 1 7-1 9-3 3-8 3-11 0l-87-87c-4-4-7-8-8-13l-1-1c-3-7-7-13-12-18l-11-12 62-62 8 7v3c0 16 13 29 29 29h15l89 89c2 3 2 7 0 10Zm36-81c-5 5-9 11-12 18v1c-2 4-6 11-10 15l-15 14-41-41c14 0 22-4 23-4l-7-14s-12 5-33 1l-22-21c-1-2-3-2-5-2h-18c-7 0-14-7-14-14 0-3 2-4 4-4l63-1h1c10-1 18-5 24-11l11-11 63 62Zm31-15-3-2-73-74-3-3 25-25 79 79Zm0 0" style="stroke:none;fill-rule:nonzero;fill:#000;fill-opacity:1"/></svg>
					수주처
				</button>
				<button class="btn btn-light d-inline-flex align-items-center gap-1" onclick="selectDelete()"><i class="fa-regular fa-trash-can fa-1.5x"></i></button>
			</div>
			
			
			
			<div class="search">
			<form name="search" action="/basicinfo/client/list" id="search">
			<table>
			<tr>
				<td>
					<select id="whatColumn" name="whatColumn" class="form-select" style="width: 200px;">
	                  <%
	                  String[] search = {"code","category","name","owner","tel","fax","bank","account","zipcode","address1","address2","email","business"};
	                  String[] cate = {"거래처코드","분류","거래처명","대표자명","전화번호","팩스번호","은행명","은행계좌","우편번호","주소","상세주소","이메일","사업자번호"};
	                  %>
	                  <c:set value="<%=search %>" var="s"></c:set>
	                  <c:set value="<%=cate %>" var="c"></c:set>
	                  <option>검색 선택</option>
	                  	<c:forEach begin="0" end="12" var="i">
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
								<input class="form-check-input" type="checkbox" id="allselect" name="allselect" onclick="allSelect()">
							</div>
						</th>
						<th scope="col">분류</th>
						<th scope="col">거래처명</th>
						<th scope="col">대표자명</th>
						<th scope="col">전화번호</th>
						<th scope="col">주소</th>
						<th scope="col">수정&nbsp; / &nbsp; 삭제</th>
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
								<input class="form-check-input" type="checkbox" id="rowcheck" name="rowcheck" value="${item.no }">
								<!--선택 삭제할때도 넘어가게하기 위해  -->
								<input type="hidden" name="keyword" id="keyword3" >
								<input type="hidden" name="whatColumn" id="whatColumn2">
             					<input type="hidden" name="pageNumber" id="pageNumber2">
							</div>
						</td>
						<td>
							<div class="d-flex align-items-center gap-3">
								<div class="d-flex flex-column">
									<c:if test="${item.category=='수주처' }">
									<h6>수주처</h6>
									</c:if>
									<c:if test="${item.category=='발주처' }">
									<h6>발주처</h6>
									</c:if>
								</div>
							</div>
						</td>
						<td onclick="detail('${item.no}')" data-bs-toggle="modal" data-bs-target="#ClientModal" style="cursor: pointer;">${item.name }</td>
						<td>
								<h6>${item.owner }</h6>
						</td>
						<td>${item.tel }</td>
						<td><span class="badge bg-light text-muted">${item.address1}</span></td>
						<td>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex" data-bs-toggle="modal" data-bs-target="#ClientModal" onclick="updateClient('${item.no}')">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                          </svg>
								</button>
								<button type="button" class="btn btn-light d-flex text-danger" onclick="deleteClient('${item.no}')">
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
                  <option value="">선택</option>
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
                  <option value="">선택</option>
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
				<div class="col-12">
	                <label for="business" class="form-label">사업자등록번호</label>
	                <input type="text" class="form-control" id="business" name="business" placeholder="109-01-21023">
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
	/* 거래처 코드 중복확인  */
	var codeCheck = false;
	
	var modal = $(".modal");
	var modalForm = $("#modalForm");
	$(function(){
	/* 메뉴바가 클릭되게 하기 위해 */
	document.getElementById('basicinfo').click();
	
	})
	
	/* 거래처 등록 눌렀을 때  */
	function insert_btn(){
		clearModal();
		/* readonly attr 삭제 */
		deletereadonly();
		
		modal.find("#modal-title").text("거래처 등록");
		modal.find('#okaybtn').show();
		modal.find('#okaybtn').text("등록");
		modalForm.attr("action", "/basicinfo/client/add");
		
		/* 싹 지우고 시작 */
		
	}
	
	/* 상세페이지 눌렀을때 */
	function detail(item_no){
		modal.find("#modal-title").text("거래처 상세");
		modal.find('#okaybtn').hide();
		
		addreadonly();
		
		/* 수정으로 가게 만들기 위해 */
		modalForm.attr("action", "/basicinfo/client/update");
		
		$.ajax({// 다른 jsp 가서 중복체크할것
			url : "/basicinfo/client/select ", // 일로가서 중복체크
			type : "post",
			data : {  // 보낼 데이터
				item_no : item_no // 값을 담을 변수 내맘 userid= choi 가지고 jsp로 넘어감.
			},
			datatype : 'json',
				success : function(data){ // 사용가능 불가능 한 걸 data로 받는다. data:응답정보 url 갔다온 답
				const pd = JSON.parse(data);
			
				document.getElementById('code').value=pd.code;
					var el = document.getElementById('category');  //select box
					el.options[0].selected = true;
					var len = el.options.length; //select box의 option 갯수
					//select box의 option 갯수만큼 for문 돌림
					for (var i=0; i<len; i++){  
					//select box의 option value가 입력 받은 value의 값과 일치할 경우 selected
					if(el.options[i].value == pd.category)
					   el.options[i].selected = true;
				}
				document.getElementById('name').value=pd.name;
				document.getElementById('owner').value=pd.owner;
				document.getElementById('tel').value=pd.tel;
				document.getElementById('fax').value=pd.fax;
				
				/* select 박스 선택되게 */ 
				var bank = document.getElementById('bank'); 
				var leng = bank.options.length;
				bank.options[0].selected = true;
				for(var j=0;j<leng;j++){
					if(bank.options[j].value == pd.bank)
						bank.options[j].selected = true;
				}
				document.getElementById('account').value=pd.account;
				document.getElementById('zipcode').value=pd.zipcode;
				document.getElementById('address1').value=pd.address1;
				document.getElementById('address2').value=pd.address2;
				document.getElementById('email').value=pd.email;
				document.getElementById('business').value=pd.business;
				}//success 
		});//ajax 
	}
	
	/* 수정버튼을 눌렀을때 */
	function updateClient(item_no){
		/* readonly attr 삭제 */
		deletereadonly();
		
		modal.find("#modal-title").text("거래처 수정");
		modal.find('#okaybtn').show();
		modal.find('#okaybtn').text("수정");
		/* 수정할때도 검색어 가게 만들기위해 */
		var whatColumn = $('select option:selected').val();
		$('input[name="whatColumn"]').val(whatColumn);
		$('#keyword2').val($('#keyword').val());
		
		/* 수정으로 가게 만들기 위해 */
		modalForm.attr("action", "/basicinfo/client/update");
		
		$.ajax({// 다른 jsp 가서 중복체크할것
			url : "/basicinfo/client/select ", // 일로가서 중복체크
			type : "post",
			data : {  // 보낼 데이터
				item_no : item_no // 값을 담을 변수 내맘 userid= choi 가지고 jsp로 넘어감.
			},
			datatype : 'json',
				success : function(data){ // 사용가능 불가능 한 걸 data로 받는다. data:응답정보 url 갔다온 답
				const pu = JSON.parse(data);
					var el = document.getElementById('category');  //select box
					var len = el.options.length; //select box의 option 갯수
					el.options[0].selected = true;
					//select box의 option 갯수만큼 for문 돌림
					for (var i=0; i<len; i++){  
					//select box의 option value가 입력 받은 value의 값과 일치할 경우 selected
						if(el.options[i].value == pu.category)
						   el.options[i].selected = true;
					}
					/* select 박스 선택되게 */ 
					var bank = document.getElementById('bank'); 
					var leng = bank.options.length;
					bank.options[0].selected = true;
					for(var j=0;j<leng;j++){
						if(bank.options[j].value == pu.bank)
							bank.options[j].selected = true;
					}
				document.getElementById('no').value=pu.no;
				document.getElementById('code').value=pu.code;
				document.getElementById('name').value=pu.name;
				document.getElementById('owner').value=pu.owner;
				document.getElementById('tel').value=pu.tel;
				document.getElementById('fax').value=pu.fax;
				document.getElementById('account').value=pu.account;
				document.getElementById('zipcode').value=pu.zipcode;
				document.getElementById('address1').value=pu.address1;
				document.getElementById('address2').value=pu.address2;
				document.getElementById('email').value=pu.email;
				document.getElementById('business').value=pu.business;
				}//success 
		});//ajax
	}
	
	
	/* 삭제 버튼 눌렀을 때  */
	function deleteClient(item_no){
		var whatColumn = $('select option:selected').val();
		var keyword = $('#keyword').val();
		var pageNumber = $('#pageNumber').val();
		if(confirm("삭제하시겠습니까?")){
			location.href="/basicinfo/client/delete?item_no="+item_no+"&whatColumn="+whatColumn+"&keyword="+keyword+"&pageNumber="+pageNumber;
		}
		
	}
	// 발주/수주처 눌렀을때
	function inbtn(what){
		const wh = document.getElementById('whatColumn');  //select box
		const lens = wh.options.length; //select box의 option 갯수
		for (var i=0; i<lens; i++){  
			if(wh.options[i].value == 'category')
			   wh.options[i].selected = true;
			 $('#keyword').val(what);
		}
		search.submit();
	}
/** 우편번호 찾기 */
	function execDaumPostcode() {
	    daum.postcode.load(function(){
	        new daum.Postcode({
	            oncomplete: function(data) {
	            	var temp = "";
					
	            	temp += data.sido;
					temp += " " + data.sigungu;
					if(data.bname1 != ""){
						temp += " " + data.bname1;
					}
					temp += " " + data.bname;
					
					$('#address1').val(temp);
					$('#zipcode').val(data.zonecode);
					
	            }
	        }).open();
	    });
	}
	
	
	/* 싹 다 지워지게 */
	function clearModal(){
		document.getElementById('code').value="";
		document.getElementById('category').options[0].selected = true;  //select box
		document.getElementById('name').value="";
		document.getElementById('owner').value="";
		document.getElementById('tel').value="";
		document.getElementById('fax').value="";
	
		/* select 박스 선택되게 */
		document.getElementById('bank').options[0].selected = true; 
	
		document.getElementById('account').value="";
		document.getElementById('zipcode').value="";
		document.getElementById('address1').value="";
		document.getElementById('address2').value="";
		document.getElementById('email').value=""; 
		document.getElementById('business').value=""; 
	}
	
	/* 유효성검사 */
	
	$(function(){
		$('#code').keyup(function(){
			codeCheck = false;
			$.ajax({// 다른 jsp 가서 중복체크할것
				url : "/basicinfo/client/check ", // 일로가서 중복체크
				type : "post",
				data : {  // 보낼 데이터
				code : $('#code').val()
				},// 값을 담을 변수 내맘 userid= choi 가지고 jsp로 넘어감.
				success : function(data){ // 사용가능 불가능 한 걸 data로 받는다. data:응답정보 url 갔다온 답
					const i = JSON.parse(data);
					if(i!=0){
						$('#code').attr("class","form-control is-invalid");
					}
					else{
						$('#code').attr("class","form-control is-valid");
						codeCheck = true;
					}
				}//success 
			})//ajax
				
			})//code keyup
		$('#name').keyup(function(){$('#name').attr("class","form-control is-valid")})
		$('#owner').keyup(function(){$('#owner').attr("class","form-control is-valid")})
		$('#tel').keyup(function(){$('#tel').attr("class","form-control is-valid")})
		$('#fax').keyup(function(){$('#fax').attr("class","form-control is-valid")})
		$('#account').keyup(function(){$('#account').attr("class","form-control is-valid")})
		$('#address1').keyup(function(){$('#address1').attr("class","form-control is-valid")})
		$('#address2').keyup(function(){$('#address2').attr("class","form-control is-valid")})
		$('#email').keyup(function(){$('#email').attr("class","form-control is-valid")})
		$('#business').keyup(function(){$('#business').attr("class","form-control is-valid")})
			
		$('#okaybtn').click(function(){
			if($('#code').val()==''){
				$('#code').attr("class","form-control is-invalid")
				$('#code').focus()
			}
			else if(!codeCheck){
				$('#code').attr("class","form-control is-invalid")
				$('#code').focus();
				alert("거래처 코드 중복")
			}
			else if($('#category').val()==''){
				$('#category').attr("class","form-control is-invalid")
				$('#code').focus()
			}
			else if($('#name').val()==''){
				$('#category').attr("class","form-control is-valid")
				$('#name').attr("class","form-control is-invalid")
				$('#name').focus()
			}
			
			else if($('#owner').val()==''){
				$('#owner').attr("class","form-control is-invalid")
				$('#owner').focus()
			}
			else if($('#tel').val()==''){
				$('#tel').attr("class","form-control is-invalid")
				$('#tel').focus()
			}
			else if($('#fax').val()==''){
				$('#fax').attr("class","form-control is-invalid")
				$('#fax').focus()
			}
			else if($('#bank').val()==''){
				$('#bank').attr("class","form-control is-invalid")
				$('#bank').focus()
			}
			else if($('#account').val()==''){
				$('#bank').attr("class","form-control is-valid")
				$('#account').attr("class","form-control is-invalid")
				$('#account').focus()
			}
			else if($('#address1').val()==''){
				$('#address1').attr("class","form-control is-invalid")
				$('#address1').focus()
			}
			else if($('#address2').val()==''){
				$('#address1').attr("class","form-control is-valid")
				$('#address2').attr("class","form-control is-invalid")
				$('#address2').focus()
			}
			else if($('#email').val()==''){
				$('#email').attr("class","form-control is-invalid")
				$('#email').focus()
			}
			else if($('#business').val()==''){
				$('#business').attr("class","form-control is-invalid")
				$('#business').focus()
			}
			else{
				modalForm.submit();
			}
			
		})
	})
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
		$("#address2" ).prop('readonly', true);
		$("#email" ).prop('readonly', true);
		$("#business" ).prop('readonly', true);
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
		$("#address2" ).prop('readonly', false);
		$("#email" ).prop('readonly', false);
		$("#business" ).prop('readonly', false);
		$('#search_zipcode').show();
	}
	
</script>