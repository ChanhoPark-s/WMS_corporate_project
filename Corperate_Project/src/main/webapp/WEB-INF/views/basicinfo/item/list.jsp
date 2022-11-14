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
				<div class="dropdown">
					<button
						class="btn btn-light d-inline-flex align-items-center gap-1 dropdown-toggle no-caret"
						type="button" data-bs-toggle="dropdown"
						data-bs-auto-close="outside" aria-expanded="false">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
							fill="currentColor" aria-hidden="true">
                      <path fill-rule="evenodd"
								d="M3 3a1 1 0 011-1h12a1 1 0 011 1v3a1 1 0 01-.293.707L12 11.414V15a1 1 0 01-.293.707l-2 2A1 1 0 018 17v-5.586L3.293 6.707A1 1 0 013 6V3z"
								clip-rule="evenodd" />
                    </svg>
						Filter
					</button>
					<form class="dropdown-menu p-3" style="min-width: 250px">
						<h6 class="dropdown-header p-0">Filter options</h6>
						<hr>
						<div class="vstack gap-3">
							<div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
								<label class="form-label">Role:</label> <select
									class="dselect form-select" data-dselect-clearable="true">
									<option value="">선택하세요</option>
									<option value="administrator">품목코드</option>
									<option value="analyst">거래처코드</option>
									<option value="analyst">품목명</option>
								</select>
							</div>
							<button class="btn btn-primary" type="button">적용</button>
						</div>
					</form>
				</div>
			</div>
			<form>
				<input type="text" class="form-control" placeholder="입력 후 Enter">
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
						<th scope="col">품목명</th>
						<th scope="col">입고단가</th>
						<th scope="col">출고단가</th>
						<th scope="col">Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${lists}">
					<tr>
						<td>${item.no} </td>
						<td> <!-- 이미지 -->
						<img src="<%=request.getContextPath()%>/resources/assets/itemimg/${item.image}" width="42" height="42" loading="lazy">
						</td>
						<td>${item.client_code}</td>
						<td>${item.code}</td> 
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
		<nav aria-label="Page navigation borderless example">
			<ul class="pagination pagination-borderless justify-content-end">
				<li class="page-item disabled"><a
					class="page-link d-flex align-items-center px-2" href="#"
					tabindex="-1" aria-disabled="true" aria-label="Previous"> <svg
							width="20" height="20" xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd"
								d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
								clip-rule="evenodd"></path>
                    </svg>
				</a></li>
				<li class="page-item active" aria-current="page"><a
					class="page-link" href="javascript:void(0)">1</a></li>
				<li class="page-item"><a class="page-link"
					href="javascript:void(0)">2</a></li>
				<li class="page-item"><a class="page-link"
					href="javascript:void(0)">3</a></li>
				<li class="page-item"><a
					class="page-link d-flex align-items-center px-2"
					href="javascript:void(0)" aria-label="Next"> <svg width="20"
							height="20" xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd"
								d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
								clip-rule="evenodd"></path>
                    </svg>
				</a></li>
			</ul>
		</nav>
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
				<form class="needs-validation" id="modalForm" enctype="multipart/form-data" method="post" >
					<div>
					<input type="hidden" name="no" id="no">
                <label for="upload" class="form-label">이미지</label>
                <input class="form-control" type="file" id="upload" name="upload" value="${item.image }">
              		</div>
					<div class="mb-3">
						<label for="code" class="form-label">품목코드</label> <input
							type="text" class="form-control" name="code" id="code"
							required autofocus>
					</div>
					<div class="mb-3">
						<label for="client_no" class="form-label">거래처코드</label> 
						<select class="form-select" id="client_no" name="client_no">
	                  	<option selected>선택</option>
						<c:forEach items="${clientList }" var="client">
							<option value="${client.no }">${client.code }</option>
						</c:forEach>
	                </select>
					</div>
					<div class="mb-3">
						<label for="name" class="form-label">품목명</label> <input
							type="text" name="name" class="form-control" id="name"
							required autofocus>
					</div>
					<div class="mb-3">
						<label for="in_price" class="form-label">입고단가</label> <input
							type="text" class="form-control" name="in_price" id="in_price"
							required autofocus>
					</div>
					<div class="mb-3">
						<label for="out_price" class="form-label">출고단가</label> <input
							type="text" class="form-control" name="out_price" id="out_price"
							required autofocus>
					</div>
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

<script type="text/javascript">
$(function(){
	/* 왼쪽 카테고리창이 해당화면에 맞게 펼쳐지게 하는 코드 */
    document.getElementById('basicinfo').click();
})

$('#insertBtn').on("click",function(){
	alert("아....");
	$(".modal").find("#modal-title").text("등록하기");
	$(".modal").find('#modaladdBtn').text("등록");
	
	var taskForm = $("#modalForm");
	$('#modaladdBtn').click(function(){
		taskForm.attr("action", "/basicinfo/item/insert").submit();
	});
	
});

//삭제
function deleteItem(no){
	if(confirm("삭제하시겠습니까?")){
		location.href="/basicinfo/item/delete?no="+no;
		alert(1);
	}
};

//수정
function update(no){
	$(".modal").find("#modal-title").text("수정하기");
	$(".modal").find('#modaladdBtn').text("수정");
	
	var taskForm = $("#modalForm");
	$('#modaladdBtn').click(function(){
		taskForm.attr("action", "/basicinfo/item/update").submit();
	})
	$.ajax({
			url : "/basicinfo/item/get",
			type : 'post',
			data : {  
				no : no 
			},
			datatype : 'json',
			success : function(data){
				const parse = JSON.parse(data);
				
				alert(parse.no)
				alert(parse.upload);
				alert(parse.code);
				alert(parse.name);
				alert(parse.in_price);
				alert(parse.out_price);
				/*document.getElementById('no').value=parse.no;
				 document.getElementById('upload').value=parse.upload;
				document.getElementById('code').value=parse.code;
				document.getElementById('name').value=parse.name;
				document.getElementById('in_price').value=parse.in_price;
				document.getElementById('out_price').value=parse.out_price; */
			}
		});
	
}
</script>
