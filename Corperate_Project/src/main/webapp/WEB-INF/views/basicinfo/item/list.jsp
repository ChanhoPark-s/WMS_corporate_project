<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- top.jsp -->
<%@include file="../../common/top.jsp"%>

<div class="card">
	<div class="card-body">
		<div class="d-flex gap-1 mb-4 flex-wrap">
			<div class="d-flex gap-1 me-auto flex-wrap">
				<button id="insertBtn" class="btn btn-primary d-inline-flex align-items-center gap-1 add"
					data-bs-toggle="modal" data-bs-target="#itemModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd" />
                  </svg>
                  등록하기
				</button>
				
			</div>
			<form action="/basicinfo/item/list" method="get"> 
			<table>
			<tr>
				<td><select name="whatColumn" id="whatColumn" class="dselect form-select" data-dselect-clearable="true">
					<option value="">선택</option>
					<option value="code">품목코드</option>
					<option value="client_code">거래처코드</option>
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
			<table class="table align-middle">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">이미지</th>
						<th scope="col">품목코드</th>
						<th scope="col">거래처코드</th>
						<th scope="col">품목</th>
						<th scope="col">입고단가</th>
						<th scope="col">출고단가</th>
						<th scope="col">수정/삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${lists}">
					<tr>
						<td>${item.no} </td>
						<td> <!-- 이미지 -->
						<img src="<%=request.getContextPath()%>/resources/assets/itemimg/${item.image}" width="100" height="100" loading="lazy">
						</td>
						<td>${item.code}</td> 
						<td>${item.client_code}</td>
						<td>${item.name}</td>
						<td>${item.in_price}</td>
						<td>${item.out_price}</td>
						<td>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex" data-bs-toggle="modal" data-bs-target="#itemModal" onclick="update('${item.no}')" id="updateItem">
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
				<form class="needs-validation" id="modalForm" action="" enctype="multipart/form-data" method="post" >
					
				<input type="hidden" name="keyword" id="keyword2">
				<input type="hidden" name="whatColumn" id="whatColumn">					
					<div>
                <label for="image" class="form-label">이미지</label>
                <input class="form-control" type="file" id="upload" name="upload">
              		</div>
					<div class="mb-3">
						<label for="code" class="form-label">품목코드</label> <input
							type="text" class="form-control" name="code" id="code"
							placeholder="품목코드 입력은 필수입니다.">
					</div>
					<div class="mb-3">
						<label for="client_no" class="form-label">거래처코드[거래처명]</label> 
						<select class="form-select" id="client_no" name="client_no">
	                  	<option selected>선택</option>
						<c:forEach items="${clientList}" var="client">
							<option value="${client.no }">${client.code }[${client.name }]</option>
						</c:forEach>
	                </select>
					</div>
					<div class="mb-3">
						<label for="name" class="form-label">품목</label> <input
							type="text" name="name" class="form-control" id="name"
							placeholder="품목 입력은 필수입니다.">
					</div>
					<div class="mb-3">
						<label for="in_price" class="form-label">입고단가</label> <input
							type="text" class="form-control" name="in_price" id="in_price"
							placeholder="입고단가 입력은 필수입니다.">
					</div>
					<div class="mb-3">
						<label for="out_price" class="form-label">출고단가</label> <input
							type="text" class="form-control" name="out_price" id="out_price"
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
     
<!-- bottom.jsp -->
<%@include file="../../common/bottom.jsp"%>
<script src="https://kit.fontawesome.com/75769dc150.js" crossorigin="anonymous"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script type="text/javascript">
$(function(){
	/* 왼쪽 카테고리창이 해당화면에 맞게 펼쳐지게 하는 코드 */
    document.getElementById('basicinfo').click();
    $('#code').keyup(function(){$('#code').attr("class","form-control is-valid")})
    $('#name').keyup(function(){$('#name').attr("class","form-control is-valid")})
    $('#in_price').keyup(function(){$('#in_price').attr("class","form-control is-valid")})
    $('#out_price').keyup(function(){$('#out_price').attr("class","form-control is-valid")})
})
$('#insertBtn').on("click",function(){
	$(".modal").find("#modal-title").text("등록하기");
	$(".modal").find('#modaladdBtn').text("등록");
	
	var taskForm = $("#modalForm");
	$('#modaladdBtn').click(function(){
		if($("#code").val() == ""){
			$('#code').attr("class","form-control is-invalid");
	    	$("#code").focus();
	    	return "/basicinfo/item/insert";
		
	}
		if($("#name").val() == ""){
			$('#name').attr("class","form-control is-invalid");
	    	$("#name").focus();
	    	return "/basicinfo/item/insert";
		
	}
		if($("select[name=client_no] > option:selected").text() == "good"){ 
			$('#client_no').attr("class","form-control is-invalid");
    		$("#client_no").focus();
    		return "/basicinfo/item/insert";
	}
		if($("#in_price").val() == ""){
			$('#in_price').attr("class","form-control is-invalid");
	    	$("#in_price").focus();
	    	return "/basicinfo/item/insert";
		
	}
		if($("#out_price").val() == ""){
			$('#out_price').attr("class","form-control is-invalid");
	    	$("#out_price").focus();
	    	return "/basicinfo/item/insert";
		
	}
		taskForm.attr("action", "/basicinfo/item/insert").submit();
	});
	
});
//삭제
function deleteItem(no){
	if(confirm("삭제하시겠습니까?")){
		var whatColumn = $('select option:selected').val();
		var keyword = $('#keyword').val();
		var pageNumber = $('#pageNumber').val();
		location.href="/basicinfo/item/delete?no="+no+"&whatColumn="+whatColumn+"&keyword="+keyword+"&pageNumber="+pageNumber;
	}
};
//수정
function update(no){
	$(".modal").find("#modal-title").text("수정하기");
	$(".modal").find('#modaladdBtn').text("수정");
	
	var taskForm = $("#modalForm");
	$('#modaladdBtn').click(function(){
		if($("#code").val() == ""){
			$('#code').attr("class","form-control is-invalid");
	    	$("#code").focus();
	    	return "/basicinfo/item/update";
		
	}
		if($("#name").val() == ""){
			$('#name').attr("class","form-control is-invalid");
	    	$("#name").focus();
	    	return "/basicinfo/item/update";
		
	}
		if($("select[name=client_no] > option:selected").text() == "good"){ 
			$('#client_no').attr("class","form-control is-invalid");
    		$("#client_no").focus();
    		return "/basicinfo/item/update";
	}
		if($("#in_price").val() == ""){
			$('#in_price').attr("class","form-control is-invalid");
	    	$("#in_price").focus();
	    	return "/basicinfo/item/update";
		
	}
		if($("#out_price").val() == ""){
			$('#out_price').attr("class","form-control is-invalid");
	    	$("#out_price").focus();
	    	return "/basicinfo/item/update";
		
	}
		taskForm.attr("action", "/basicinfo/item/update").submit();
	})
	$.ajax({
			url : "/basicinfo/item/get ",
			type : "post",
			data : {  
				no : no 
			},
			dataType:'json',
			success : function(data){
			 	
				
				document.getElementById('code').value=data.code;
				document.getElementById('name').value=data.name;
				const client_no = document.getElementById('client_no'); 
				const leng = client_no.options.length;
				
				for(var j=0;j<leng;j++){
					if(client_no.options[j].value == data.client_no)
						client_no.options[j].selected = true;
				}
				document.getElementById('in_price').value=data.in_price;
				document.getElementById('out_price').value=data.out_price;
			}
		});
	
}
		
</script>