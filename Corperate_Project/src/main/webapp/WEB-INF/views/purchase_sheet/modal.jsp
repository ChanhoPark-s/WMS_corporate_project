<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Modal 코드 넣을 위치 -->
<div class="modal fade" id="addOrderSheetModal" tabindex="-1">
	<div class="modal-dialog modal-dialog-scrollable modal-lg">
		<div class="modal-content" style="width: ">
			<div class="modal-header border-0">
				<h5 id="modal-title">발주서 등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
					</div>
			<!-- form start -->
			<form class="needs-validation" novalidate="" id="modal1form" action="/insert.ps" method="post">
				<div class="modal-body">
						<!-- 컨트롤러로 넘기는 정보 -->
						<!-- out_day -->
						<input type="hidden" name="order_no" class="form-control" readonly>
						<input type="hidden" name="member_no" class="form-control" readonly>
						<input type="hidden" name="client_no" class="form-control" readonly>
						<!-- 품목번호 및 개수 -->
						<!-- input type='text' name='item_no' -->
						<!-- input type='text' name='amount' -->
						<button type="button" class="btn btn-primary " style="" data-bs-target="#secondModal" data-bs-toggle="modal" data-bs-dismiss="modal" id="choiceOrderBtn">수주서 선택</button>	
						<div class="row">		
							<div class="col-sm-3">
								<label for="userFullname" class="form-label">납기일자</label>
									<input type="date" name="delivery_date" class="form-control" onchange="calendarChangeHandler()">
							</div>
							
						</div>
						<div class="row" >		
							<div class="col-sm-3">		
								<label for="userFullname" class="form-label">부서명</label>
								<input type="text" id="member_dep_name" class="form-control" readonly >
							</div>
							<div class="col-sm-3 has-validation">
								<label for="userFullname" class="form-label">담당자명</label>
								<input type="text" id="member_name" class="form-control" readonly required="">
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
							</div>
							<div class="col-sm-3">		
								<label for="userFullname" class="form-label">거래처명</label>
								<input type="text" id="client_name" class="form-control" readonly required>
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
								<!-- <input type="hidden" name="detail_no" class="form-control" readonly> -->
							
								<div class="col-sm-2">		
									<label for="userFullname" class="form-label">품목코드</label>
									<input type="text" class="form-control choiceItemBtn" data-bs-target="#secondModal" data-bs-toggle="modal" data-bs-dismiss="modal" readonly placeholder="품목 선택">
									
								</div>
								<div class="col-sm-2">		
									<label for="userFullname" class="form-label">품목명</label>
									<input type="text" class="form-control" readonly required>
								</div>
								<div class="col-sm-2">		
									<label for="userFullname" class="form-label">취급처</label>
									<input type="text" class="form-control" readonly>
								</div>
								<div class="col-sm-2">		
									<label for="userFullname" class="form-label">구매단가</label>
									<input type="text" class="form-control" readonly>
								</div>
								<div class="col-sm-1">		
									<label for="userFullname" class="form-label">수량</label>
									<input type="text" name="amount" class="form-control">
								</div>
								<div class="col-sm-2">		
									<label for="ware_no" class="form-label">창고명</label>
									<select class="form-select" id="ware_no" name="ware_no" onchange="wareChangeHandler()">
					                <option selected disabled value="">선택</option>
										<c:forEach items="${WareList }" var="ware">
											<option value="${ware.no }">${ware.name }(${ware.code })</option>
										</c:forEach>
					                </select>
								</div>
								<div class="col-sm-1">
								<label for="" class="form-label">&nbsp;&nbsp;</label>	
									<button type="button" class="btn btn-primary deleteItemBtn" style="display:block">X</button>	
								</div>
							</div>
							
						</div>
					
				</div>
				<div class="modal-footer border-0">
					<button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
					<button type="button" form="modal1form" id="modalRegisterBtn" class="btn btn-primary px-5">등록</button>		
				</div>
			</form>
			<!-- form end -->
			
			
			
			
		</div>
	</div>
</div>