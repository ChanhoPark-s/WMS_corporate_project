<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JS --> 
<script type="text/javascript">
$(document).ready(function(){
	$(".insert,.update").on("click",function(){
		$(".form-control,.form-select,.cancel").val('');
	});
	
	$(".insert").on("click",function(){
		$(".modal-title").text("발주서등록");
	});
	
	$(".update").on("click",function(){
		$(".modal-title").text("발주서수정");
	});
});
</script>
<!-- Modal 코드 넣을 위치 -->
<div class="modal fade" id="addOrderSheetModal" tabindex="-1">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 id="modal-title">수주서 등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<!-- form start -->
				<form class="needs-validation" novalidate id="modalForm" action="" method="post">
					
					<div class="row">		
						<div class="col-sm-3">		
							<label for="userFullname" class="form-label">부서명</label>
							<input type="text" id="member_dep_name" class="form-control" readonly>
						</div>
						<div class="col-sm-5">
							<label for="userFullname" class="form-label">담당자명</label>
							<input type="text" id="member_name" class="form-control" readonly>
							<input type="hidden" name="member_no" class="form-control" readonly>		
						</div>
						<div class="col-sm-4">	
							<label for="userFullname" class="form-label">&nbsp;&nbsp;</label>
							<button type="button" class="btn btn-primary" style="display:block" data-bs-target="#choiceClientModal" data-bs-toggle="modal" data-bs-dismiss="modal" id="choiceMemberBtn">담당자 선택</button>	
						</div>
					</div>
					
					<div class="row">		
						<div class="col-sm-3">		
							<label for="userFullname" class="form-label">코드</label>
							<input type="text" id="client_code" class="form-control" readonly>
						</div>
						<div class="col-sm-5">		
							<label for="userFullname" class="form-label">거래처명</label>
							<input type="text" id="client_name" class="form-control" readonly>
							<input type="hidden" name="client_no" class="form-control" readonly>
						</div>
						<div class="col-sm-4">	
							<label for="userFullname" class="form-label">&nbsp;&nbsp;</label>
							<button type="button" class="btn btn-primary" style="display:block" data-bs-target="#choiceClientModal" data-bs-toggle="modal" data-bs-dismiss="modal" id="choiceClientBtn">거래처 선택</button>	
						</div>
					</div>
					
					<div class="row">		
						<div class="col-sm-5">		
							<label for="wareName" class="form-label">창고명</label>
							<select class="form-select" id="wareName" name="wareName" required>
			                <option selected disabled value="">선택</option>
								<c:forEach items="${WareList }" var="ware">
									<option value="${ware.no }">${ware.name }(${ware.code })</option>
								</c:forEach>
			                </select>
						</div>
						
						<div class="col-sm-5">
							<label for="userFullname" class="form-label">납기일자</label>
							<div class="row">
								<div class="col">
									<input type="date" name="out_day" class="form-control">
								</div>
							</div>
						</div>
					</div>	
						
					<div class="row">
						
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