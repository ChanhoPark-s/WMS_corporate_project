<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- top.jsp -->
<%@include file="../../common/top.jsp"%>

<div class="card">
	<div class="card-body">
	
		<a class="btn btn-primary" data-bs-toggle="modal" href="#addUserModal1" role="button">품목등록</a>
		
		"두번째 모달에서 첫번쨰 모달로 데이터를 옮기는 예시"
	</div>
</div>

<!-- 부서등록/수정 Modal 코드-->
<div class="modal fade" id="addUserModal1" tabindex="-1">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 id="modal-title">품목등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<!-- form start -->
				<form class="needs-validation" novalidate id="modalForm" action="" method="post">
							
					<div class="mb-3">
						<label for="userFullname" class="form-label">거래처</label>
						
						<div class="row">
						  <div class="col">
						    <input type="text" name="name" id="name" class="form-control" required autofocus readonly>
						  </div>
						  <div class="col">
						    <button type="button" class="btn btn-primary" data-bs-target="#addUserModal2" data-bs-toggle="modal" data-bs-dismiss="modal">거래처 선택</button>
						  </div>
						</div>
					</div>
					
					<div class="mb-3">
						<label for="userEmail" class="form-label">품목명</label> 
						<input type="text" name="name" id="name" class="form-control" required>
						<div class="invalid-feedback">User email is required.</div>
					</div>
					
				</form>
				<!-- form end -->
			</div>
			<div class="modal-footer border-0">
				<button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
				<button type="button" id="modalRegisterBtn"class="btn btn-primary px-5">등록</button>		
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="addUserModal2" tabindex="-2">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 id="modal-title">거래처 선택</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<!-- form start -->
				<form class="needs-validation" novalidate id="modalForm" action="" method="post">
					<div class="mb-3">
						<label for="userFullname" class="form-label">거래처명</label> 
						<input type="text" name="name2" id="modal2_client_name" class="form-control" required autofocus>
						<div class="invalid-feedback">User full name is required.</div>
					</div>
				</form>
				<!-- form end -->
			</div>
			<div class="modal-footer border-0">
				<button type="button" class="btn btn-light" data-bs-target="#addUserModal1" data-bs-toggle="modal" data-bs-dismiss="modal">취소</button>
				<button class="btn btn-primary" data-bs-target="#addUserModal1" data-bs-toggle="modal" data-bs-dismiss="modal" id="delivery_data">거래처 저장</button>
			</div>
		</div>
	</div>
</div>

<!-- bottom.jsp -->
<%@include file="../../common/bottom.jsp"%>

<script type="text/javascript">
$(function(){
	alert("/basicinfo/modal/modal_example.jsp");
		
	/* 두번째 모달에서 첫번째 모달로 데이터를 옮기는 코드 */
	$("#delivery_data").on("click", function(e){
		alert($("#modal2_client_name").val() + "를 입력하셨네요");
		
		//두번째 모달에서 첫번째 모달로 값을 옮김
		$("#name").val($("#modal2_client_name").val());
		
		//두번쨰 모달에 입력되어 있던 값 초기화
		$("#modal2_client_name").val("");
	});
	
});
</script>
