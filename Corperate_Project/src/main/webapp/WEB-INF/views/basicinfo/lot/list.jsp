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
	                  String[] search = {"code","name"};
	                  String[] cate = {"로트번호","상품명"};
	                  %>
	                  		<c:set value="<%=search %>" var="s"></c:set>
	                  		<c:set value="<%=cate %>" var="c"></c:set>
	                  		<option value="">검색 선택</option>
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
								<input type="hidden" name="keyword" id="keyword3" >
								<input type="hidden" name="whatColumn" id="whatColumn2">
             					<input type="hidden" name="pageNumber" id="pageNumber2">
							</div>
						</td>
						<td onclick="detail('${item.code}')" data-bs-toggle="modal" data-bs-target="#ClientModal" style="cursor: pointer;">${item.code }</td>
						<td>${item.item_name }</td>
						<td>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex text-danger" onclick="deleteClient('${item.no}')" >
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" /></svg>
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
				<h5 id="modal-title">로트번호 상세</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body row g-3">
              <div align="center">
              	<img src="" id="image" width="280px" height="280px">
              </div>
              <div class="col-sm-5" style="width:230px;">
                <label for="code" class="form-label">로트번호</label>
                <input type="text" class="form-control" aria-describedby="emailHelp" name="code" id="code" readonly>
              </div>
              <div class="col-sm-5" style="width: 230px;">
                <label for="owner" class="form-label">상품명</label>
                <input type="text" class="form-control" id="item_name" name="item_name" readonly>
              </div>
              <div class="col-sm-5" style="width: 230px;">
                <label for="name" class="form-label">거래처명</label>
                <input type="text" class="form-control" id="client_name" name="client_name"readonly>
              </div>
              <div class="col-sm-5" style="width: 230px;">
                <label for="client_tel" class="form-label">거래처 연락처</label>
                <input type="text" class="form-control" id="client_tel" name="client_tel"readonly>
              </div>
              <div class="col-sm-5" style="width: 230px;">
                <label for="name" class="form-label">구매단가</label>
                <input type="text" class="form-control" id="in_price" name="in_price"readonly>
              </div>
              <div class="col-sm-4" style="width: 230px;">
                <label for="owner" class="form-label">판매단가</label>
                <input type="text" class="form-control" id="out_price" name="out_price" readonly>
              </div>
			</div>
			<div class="modal-footer border-0">
				<button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
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
		var whatColumn = $('select option:selected').val();
		$('input[name="whatColumn"]').val(whatColumn);
		$('#keyword2').val($('#keyword').val());
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
	/* 상세페이지 눌렀을때 */
	function detail(code){
		
		/* 수정으로 가게 만들기 위해 */
		$.ajax({
			url : "/basicinfo/lot/selectOne ",
			type : "post",
			data : {  
				code : code 
			},
			datatype : 'json',
				success : function(data){ 
					const pd = JSON.parse(data);
					document.getElementById('code').value=pd.code;
					document.getElementById('client_name').value=pd.client_name;
					document.getElementById('item_name').value=pd.item_name;
					document.getElementById('in_price').value=pd.formattedIn_price;
					document.getElementById('out_price').value=pd.formattedOut_price;
					document.getElementById('client_tel').value=pd.client_tel;
					$('#image').attr("src","${pageContext.request.contextPath}/resources/assets/itemimg/"+pd.image);
					// /assets/itemimg
				}//success 
		});//ajax 
		
	}
	
</script>
