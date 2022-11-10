<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- top.jsp -->
<%@include file="../../common/top.jsp"%>

<div class="card">
	<div class="card-body">
		<div class="d-flex gap-1 mb-4 flex-wrap">
			<div class="d-flex gap-1 me-auto flex-wrap">
				<button id="insert_btn"
					class="btn btn-primary d-inline-flex align-items-center gap-1"
					data-bs-toggle="modal" data-bs-target="#addUserModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd" />
                  </svg>
					거래처 등록
				</button>
				<button class="btn btn-light d-inline-flex align-items-center gap-1" onclick="location.href='/basicinfo/client/list?select=1'">
				<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" viewBox="0 0 150 150"><path d="m137 40-5-1H55c-3 1-5 4-5 7 0 4 3 8 7 8h68l-6 31c-1 4-4 6-7 6H55c-3 0-6-2-7-6L36 30c-2-7-8-12-15-12h-5a8 8 0 0 0 0 15h5l12 55c2 11 11 18 22 18h57c9 0 18-6 21-15l4-18 3-19 1-4 1-4c0-3-2-6-5-6Zm-99 81a11 11 0 1 0 23 0 11 11 0 0 0-23 0Zm68 0a11 11 0 1 0 22 0 11 11 0 0 0-22 0Zm0 0" style="stroke:none;fill-rule:nonzero;fill:#000;fill-opacity:1"/></svg>
					발주처
				</button>
				<button class="btn btn-light d-inline-flex align-items-center gap-1" onclick="location.href='/basicinfo/client/list?select=0'">
				<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" viewBox="0 0 384 384"><path d="m91 102-11 11a8 8 0 1 0 11 11l11-11a8 8 0 0 0-11-11ZM52 141l-7 7a8 8 0 1 0 11 11l7-7a8 8 0 0 0-11-11Zm0 0" style="stroke:none;fill-rule:nonzero;fill:#000;fill-opacity:1"/><path d="m382 138-90-90c-3-3-8-3-11 0l-37 37a8 8 0 0 0 0 11l3 3-10 11c-4 4-9 6-16 7h-62c-4 0-8 1-11 4l-5-5 3-3a8 8 0 0 0 0-11l-43-43c-3-3-8-3-11 0L2 149a8 8 0 0 0 0 11l43 43a8 8 0 0 0 11 0l3-3 11 11c4 4 7 9 9 14v1c3 7 7 13 12 18l87 87a23 23 0 0 0 38-7 23 23 0 0 0 30-12 23 23 0 0 0 31-31l6-5h1c8-9 8-23 0-32l-1-1 15-14c4-5 10-12 13-20l1-1 8-13 12-12 2 3a8 8 0 0 0 11 0l37-37c3-3 3-8 0-11ZM53 184l-2 2-32-32 79-79 32 32-3 3Zm220 81h-1c-2 3-7 3-10 0a278015 278015 0 0 0-48-47 8 8 0 0 0-8 13l56 57c2 3 2 7 0 9-3 3-8 3-11 0l-60-60a8 8 0 0 0-11 0 8 8 0 0 0 0 11l51 51a7 7 0 0 1-6 11l-5-2-56-56a8 8 0 0 0-11 11l48 48c1 3 1 7-1 9-3 3-8 3-11 0l-87-87c-4-4-7-8-8-13l-1-1c-3-7-7-13-12-18l-11-12 62-62 8 7v3c0 16 13 29 29 29h15l89 89c2 3 2 7 0 10Zm36-81c-5 5-9 11-12 18v1c-2 4-6 11-10 15l-15 14-41-41c14 0 22-4 23-4l-7-14s-12 5-33 1l-22-21c-1-2-3-2-5-2h-18c-7 0-14-7-14-14 0-3 2-4 4-4l63-1h1c10-1 18-5 24-11l11-11 63 62Zm31-15-3-2-73-74-3-3 25-25 79 79Zm0 0" style="stroke:none;fill-rule:nonzero;fill:#000;fill-opacity:1"/></svg>
					수주처
				</button>
			</div>
			<select id="inputState" class="form-select" style="width: 200px;">
                  <option selected="">검색 선택</option>
                  <option>거래처코드</option>
                  <option>분류</option>
                  <option>거래처명</option>
                  <option>대표자명</option>
                  <option>전화번호</option>
                  <option>팩스번호</option>
                  <option>은행명</option>
                  <option>은행계좌</option>
                  <option>우편번호</option>
                  <option>주소</option>
                  <option>이메일</option>
              </select>
			<form>
				<input type="text" class="form-control" placeholder="입력">
			</form>
		</div>
		<div class="table-responsive my-1">
			<table class="table align-middle">
				<thead>
					<tr>
						<th scope="col">
							<div>
								<input class="form-check-input" type="checkbox" value="">
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
				<tbody>
					<c:forEach var="item" items="${list}">
					<tr>
						<td>
							<div>
								<input class="form-check-input" type="checkbox" value="">
							</div>
						</td>
						<td>
							<div class="d-flex align-items-center gap-3">
								<div class="d-flex flex-column">
									<c:if test="${item.category==0 }">
									<h6>수주</h6>
									</c:if>
									<c:if test="${item.category==1 }">
									<h6>발주</h6>
									</c:if>
								</div>
							</div>
						</td>
						<td>${item.name }</td>
						<td>
								<h6>${item.owner }</h6>
						</td>
						<td>${item.tel }</td>
						<td><span class="badge bg-light text-muted">${item.address1}</span></td>
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
								<button type="button" class="btn btn-light d-flex text-danger">
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
<div class="modal fade" id="addUserModal" tabindex="-1" >
	<div class="modal-dialog modal-dialog-scrollable" >
		<div class="modal-content" >
			<div class="modal-header border-0" >
				<h5 id="modal-title">부서등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form class="row g-3" name="f" method="post">
              <div class="col-sm-5" style="width:250px;">
                <label for="code" class="form-label">거래처 코드</label>
                <input type="text" class="form-control" name="code" id="code" placeholder="거래처 코드">
              </div>
              <div class="col-sm-4" style="width: 227px;">
                <label for="category" class="form-label">분류</label>
                <select id="category" name="category" class="form-select">
                  <option selected value="">선택</option>
                  <option value="수주">수주</option>
                  <option value="발주">발주</option>
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
                  <option selected>선택</option>
                  <option>KEB</option>
                  <option>SC제일</option>
                  <option>국민</option>
                  <option>신한</option>
                  <option>외한</option>
                  <option>우리</option>
                  <option>한국시티</option>
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
                <input class="btn btn-outline-primary" type="button" value="우편번호 찾기" onclick="execDaumPostcode()">
				<div class="col-12">
	                <label for="email" class="form-label">이메일</label>
	                <input type="text" class="form-control" id="email" name="email" placeholder="이메일">
	              </div>
            </form>
			</div>
			<div class="modal-footer border-0">
				<button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
				<button type="button" form="taskForm" class="btn btn-primary px-5" onclick="check()">등록</button>
			</div>
		</div>
	</div>
</div>

<!-- bottom.jsp -->
<%@include file="../../common/bottom.jsp"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script type="text/javascript">
$(function(){
	document.getElementById('member').click();
	
	
	
	$('#insert_btn').on("click",function(){
		modal.find("#modal-title").text("부록");
	})
});


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
	
	/* 유효성검사 */
	function check(){
		f.submit();
	}
	
</script>
