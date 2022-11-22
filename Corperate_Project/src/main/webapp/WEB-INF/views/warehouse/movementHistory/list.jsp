<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- top.jsp -->
<%@include file="/WEB-INF/views/common/top.jsp" %>
<style>

	th, td {
		text-align: center;
	}

	td {
		vertical-align: middle;
	}

	.col-sm-3.outputModal {
		overflow: auto;
	}

	.mb-4.outputModal {
	    margin-bottom: 1.5rem !important;
	    width: 250px;
	    overflow: auto;
	}
	
	@media (max-width: 575.98px) {
		.mb-4.outputModal {
		    margin-bottom: 1.5rem !important;
		    width: 100%;
		    overflow: auto;
		}
	}

	.arrow {
		width: 60%;
		height: 60%;
	}

</style>
<div class="card">
          <div class="card-body">
            <div class="d-flex gap-1 mb-4 flex-wrap">
              <div class="d-flex gap-1 me-auto flex-wrap">
                <button class="btn btn-primary d-inline-flex align-items-center gap-1" data-bs-toggle="modal" data-bs-target="#movementItem">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
					</svg>
                  재고이동
                </button>
              </div>
            </div>
            <div class="table-responsive my-1">
              <table class="table align-middle">
                <thead>
                  <tr>
                    <th scope="col">번호</th>
                    <th scope="col">로트번호</th>
                    <th scope="col">품목</th>
                    <th scope="col">수량</th>
                    <th scope="col">출고 창고</th>
                    <th scope="col"></th>
                    <th scope="col">입고 창고</th>
                    <th scope="col">이동날짜</th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach items="${list }" var="item">
                		<tr>
                			<td>${item.no }</td>
                			<td><span class="badge bg-dark">${item.lot_code }</span></td>
                			<td>${item.item_name }</td>
                			<td><fmt:formatNumber value="${item.qty }" /> 개</td>
                			<td>${item.ware1 }</td>
                               <td scope="col">
		                    	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
								</svg>
								</td>
                			<td>${item.ware2 }</td>
                			<td>${item.day }</td>
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
        
<!-- 재고이동 모달 -->
 <div class="modal fade" id="movementItem" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel">재고이동</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <form class="needs-validation" novalidate name="modal1_form" id="itemmovementForm">
      <div class="d-flex flex-wrap gap-1">
		<div class="col">		
			<div class="row-sm-3 mb-3">
				<label for="ware1" class="form-label">출고 창고</label>
				<input type="text" name="ware1" class="form-control" required readonly>
				<div class="invalid-feedback">출고 품목을 선택해 주세요.</div>
			</div>
			<div class="row-sm-3 mb-3">
				<label for="area1" class="form-label">출고 구역</label>
				<input type="text" name="area1" class="form-control" readonly="">
			</div>
			<div class="row-sm-3 mb-3">
				<label for="rack1" class="form-label">출고 렉</label>
				<input type="text" name="rack1" class="form-control" readonly="">
			</div>
			<div class="row-sm-3 mb-3">
				<label for="cell1" class="form-label">출고 셀</label>
				<input type="text" name="cell1" class="form-control" readonly="">
			</div>
			<div class="row-sm-2">	
				<label for="userFullname" class="form-label">&nbsp;&nbsp;</label>
				<button type="button" class="btn btn-light" style="display:block" data-bs-target="#movementItem2" data-bs-toggle="modal" data-bs-dismiss="modal" id="outputBtn">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-bar-up" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M8 10a.5.5 0 0 0 .5-.5V3.707l2.146 2.147a.5.5 0 0 0 .708-.708l-3-3a.5.5 0 0 0-.708 0l-3 3a.5.5 0 1 0 .708.708L7.5 3.707V9.5a.5.5 0 0 0 .5.5zm-7 2.5a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13a.5.5 0 0 1-.5-.5z"/>
					</svg>
					출고 품목 선택
				</button>	
			</div>
		</div>
		<div class="col">
			<div style="height: 100%; width: 100%; display: flex; justify-content: center; align-items: center;">
				<svg class="arrow" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-square-fill" viewBox="0 0 16 16">
				  <path d="M0 14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v12zm4.5-6.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5a.5.5 0 0 1 0-1z"/>
			</div>
		</div>
		<div class="col">		
			<div class="row-sm-3 mb-3">
				<label for="ware2" class="form-label">입고 창고</label>
				<input type="text" name="ware2" class="form-control" readonly required>
				<div class="invalid-feedback">입고 창고를 선택해 주세요.</div>
			</div>
			<div class="row-sm-3 mb-3">
				<label for="area2" class="form-label">입고 구역</label>
				<input type="text" name="area2" class="form-control" readonly>
			</div>
			<div class="row-sm-3 mb-3">
				<label for="rack2" class="form-label">입고 렉</label>
				<input type="text" name="rack2" class="form-control" readonly>
			</div>
			<div class="row-sm-3 mb-3">
				<label for="cell2" class="form-label">입고 셀</label>
				<input type="text" name="cell2" class="form-control" readonly>
			</div>
			<div class="row-sm-2">	
				<label for="userFullname" class="form-label">&nbsp;&nbsp;</label>
				<button type="button" class="btn btn-light" style="display:block" data-bs-target="#movementItem3" data-bs-toggle="modal" data-bs-dismiss="modal" id="intputBtn">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-bar-down" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M1 3.5a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13a.5.5 0 0 1-.5-.5zM8 6a.5.5 0 0 1 .5.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 .708-.708L7.5 12.293V6.5A.5.5 0 0 1 8 6z"/>
					</svg>
					입고 창고 선택
				</button>	
			</div>
		</div>
	 </div>
	 <hr>
	 <div class="col d-flex flex-wrap gap-1">
	 	<div class="col">
			<label for="lot_code" class="form-label">로트번호</label>
			<input type="text" name="lot_code" class="form-control" readonly>
	 	</div>
	 	<div class="col">
			<label for="item_name" class="form-label">품목</label>
			<input type="text" name="item_name" class="form-control" readonly>
		</div>			 	
	 	<div class="col">
			<label for="item_name" class="form-label">재고</label>
			<input type="text" name="haveQty" class="form-control" readonly>
		</div>			 	
	 </div>
	 <br>
	 <div class="">
		<label for="qty" class="form-label">개수</label>
		<input type="text" name="qty" id="qty" class="form-control" required>
		<div class="invalid-feedback qty-feedback">개수를 선택해 주세요.</div>
	 </div>
	 </form>
	 </div>
      <div class="modal-footer">
        <button type="submit" form="itemmovementForm" class="btn btn-primary px-5 itemmovement">재고이동</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="movementItem2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel2" data-bs-target="#movementItem3" data-bs-toggle="modal" data-bs-dismiss="modal">출고 품목 선택</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div>
      <div class="modal-body">
        <div class="container">
	        <div class="row">
	        
	        <!-- 왼쪽 -->
			<div class="col-sm-3 outputModal">		
				<ul class="navbar-nav mb-4 outputModal" id="mainMenu">
	         	 <li class="nav-label px-2 small mt-3"><small>품목 선택</small></li>
	          		<c:forEach items="${warehouse }" var="w" varStatus="wi">
	          		<li class="nav-item" data-no=${w.no }>
			            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" data-no=${w.no } href="#area-${w.no }" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="dashboard-collapse">
			              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
			                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z"></path>
			              </svg>
			              <span class="me-auto" id="basicinfo">${w.name }</span>
			            </a>
			            <div class="ms-4 collapse" id="area-${w.no }" data-bs-parent="#mainMenu">
			              <ul class="navbar-nav">
					          <c:forEach items="${area }" var="a" varStatus="ai">
					          	<c:if test="${w.no eq a.ware_no }">
									<li class="nav-item" data-no=${a.no }>
							            <a class="nav-link px-2 d-flex align-items-center gap-3 <c:if test="${fn:length(area) != 0 }">dropdown-toggle</c:if>" data-no=${a.no } href="#rack-${a.no }" data-bs-toggle="collapse" role="button" aria-expanded="true" aria-controls="dashboard-collapse">
							              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
							                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z"></path>
							              </svg>
							              <span class="me-auto" id="basicinfo">${a.name }</span>
							            </a>
							            <div class="ms-4 collapse" id="rack-${a.no }" data-bs-parent="#mainMenu" style="">
							              <ul class="navbar-nav">
							              	<c:forEach items="${rack }" var="r" varStatus="ri">
							              		<c:if test="${a.no eq r.area_no }">
							              			<li class="nav-item" data-no=${r.no }>
											            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#cell-${r.no }" data-bs-toggle="collapse" role="button" aria-expanded="true" aria-controls="dashboard-collapse">
											              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
											                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z"></path>
											              </svg>
											              <span class="me-auto" id="basicinfo">${r.name }</span>
											            </a>
											            <div class="ms-4 collapse" id="cell-${r.no }" data-bs-parent="#mainMenu" style="">
											              <ul class="navbar-nav">
											              	<c:forEach items="${cell }" var="c">
											              		<c:if test="${r.no eq c.rack_no }">
											              			<li class="nav-item cell1" data-no=${c.no }>
															            <a class="nav-link px-2 d-flex align-items-center gap-3" href="#dashboard-collapse2" data-bs-toggle="collapse" role="button" aria-expanded="true" aria-controls="dashboard-collapse">
																			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bucket" viewBox="0 0 16 16">
																			  <path d="M2.522 5H2a.5.5 0 0 0-.494.574l1.372 9.149A1.5 1.5 0 0 0 4.36 16h7.278a1.5 1.5 0 0 0 1.483-1.277l1.373-9.149A.5.5 0 0 0 14 5h-.522A5.5 5.5 0 0 0 2.522 5zm1.005 0a4.5 4.5 0 0 1 8.945 0H3.527zm9.892 1-1.286 8.574a.5.5 0 0 1-.494.426H4.36a.5.5 0 0 1-.494-.426L2.58 6h10.838z"/>
																			</svg>
															              <span class="me-auto" id="basicinfo">${c.name }</span>
															            </a>
															          </li>
											              		</c:if>
											              	</c:forEach>
											              </ul>
											            </div>
											          </li>
							              		</c:if>
							              	</c:forEach>
							              </ul>
							            </div>
							          </li>
					          	</c:if>
					          </c:forEach>
			              </ul>
			            </div>
			          </li>
	          </c:forEach>
	        </ul>
			</div>
			<!-- 왼쪽 끝 -->
			
			<!-- 오른쪽 -->
			<div class="col-sm-9">		
	            <div class="table-responsive">
	                  <table class="table align-middle">
	                    <thead>
	                      <tr>
	                        <th scope="col" class="col-sm-2.5">로트번호</th>
	                        <th scope="col" class="col-sm-1.5">코드</th>
	                        <th scope="col" class="col-sm-3">품목</th>
	                        <th scope="col" class="col-sm-1.5">재고</th>
	                        <th scope="col" class="col-sm-1.5">선택</th>
	                      </tr>
	                    </thead>
	                    <tbody class="itemTable">
	                    	<tr>
	                    		<td colspan=6 align="center">검색결과 없음</td>
	                    	</tr>
	                    </tbody>
	                  </table>
	                </div>
	               <!-- 페이지내이션 -->
				<nav aria-label="Page navigation borderless example">
					<ul class="pagination pagination-borderless justify-content-end" id="itemPageNation">
						<!-- 페이지내이션이 javascript 코드에 의해 그려지는 위치 -->
					</ul>
				</nav>
	          </div>
	          <!-- 오른쪽 끝 -->
          
		</div>
		</div>
	 </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#movementItem" data-bs-toggle="modal" data-bs-dismiss="modal">뒤로가기</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="movementItem3" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel2">입고 창고 선택</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div>
      <div class="modal-body">
        <div class="d-flex flex-wrap gap-1">
		<div class="col">		
			
			<!-- 창고 -->
			<ul class="navbar-nav mb-4" id="mainMenu">
         	 <li class="nav-label px-2 small mt-3"><small>창고 선택</small></li>
          		<c:forEach items="${warehouse }" var="w" varStatus="wi">
          		<li class="nav-item" data-no=${w.no }>
		            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" data-no=${w.no } href="#area2-${w.no }" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="dashboard-collapse">
		              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
		                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z"></path>
		              </svg>
		              <span class="me-auto" id="basicinfo">${w.name }</span>
		            </a>
		            
		            <!-- 구역 -->
		            <div class="ms-4 collapse" id="area2-${w.no }">
		              <ul class="navbar-nav">
				          <c:forEach items="${area }" var="a" varStatus="ai">
				          	<c:if test="${w.no eq a.ware_no }">
								<li class="nav-item" data-no=${a.no }>
						            <a class="nav-link px-2 d-flex align-items-center gap-3 <c:if test="${fn:length(area) != 0 }">dropdown-toggle</c:if>" data-no=${a.no } href="#rack2-${a.no }" data-bs-toggle="collapse" role="button" aria-expanded="true" aria-controls="dashboard-collapse">
						              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
						                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z"></path>
						              </svg>
						              <span class="me-auto" id="basicinfo">${a.name }</span>
						            </a>
						            
						            <!-- 렉 -->
						            <div class="ms-4 collapse" id="rack2-${a.no }">
						              <ul class="navbar-nav">
						              	<c:forEach items="${rack }" var="r" varStatus="ri">
						              		<c:if test="${a.no eq r.area_no }">
						              			<li class="nav-item" data-no=${r.no }>
										            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#cell2-${r.no }" data-bs-toggle="collapse" role="button" aria-expanded="true" aria-controls="dashboard-collapse">
										              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
										                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z"></path>
										              </svg>
										              <span class="me-auto" id="basicinfo">${r.name }</span>
										            </a>
										            
										            <!-- 셀 -->
										            <div class="ms-4 collapse" id="cell2-${r.no }">
										              <ul class="navbar-nav">
										              	<c:forEach items="${cell }" var="c">
										              		<c:if test="${r.no eq c.rack_no }">
										              			<li class="nav-item cell2" data-no=${c.no }>
														            <a class="nav-link px-2 d-flex align-items-center gap-3" href="#dashboard-collapse2" data-bs-toggle="collapse" role="button" aria-expanded="true" aria-controls="dashboard-collapse">
																		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bucket" viewBox="0 0 16 16">
																		  <path d="M2.522 5H2a.5.5 0 0 0-.494.574l1.372 9.149A1.5 1.5 0 0 0 4.36 16h7.278a1.5 1.5 0 0 0 1.483-1.277l1.373-9.149A.5.5 0 0 0 14 5h-.522A5.5 5.5 0 0 0 2.522 5zm1.005 0a4.5 4.5 0 0 1 8.945 0H3.527zm9.892 1-1.286 8.574a.5.5 0 0 1-.494.426H4.36a.5.5 0 0 1-.494-.426L2.58 6h10.838z"/>
																		</svg>
														              <span class="me-auto" id="basicinfo">${c.name }</span>
														            </a>
														          </li>
										              		</c:if>
										              	</c:forEach>
										              </ul>
										            </div>
										          </li>
						              		</c:if>
						              	</c:forEach>
						              </ul>
						            </div>
						          </li>
				          	</c:if>
				          </c:forEach>
		              </ul>
		            </div>
		          </li>
          </c:forEach>
        </ul>
		</div>
		</div>
	 </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#movementItem" data-bs-toggle="modal" data-bs-dismiss="modal">뒤로가기</button>
      </div>
    </div>
  </div>
</div>

<script>

	// 출고 품목 선택
	(function() {
		
		// 페이징 기본설정
		const defaultPaging = {
				pageNum : 1,
				amount : 10,
				whatColumn : null,
				keyword : null,
		};
		
		// 왼쪽 클릭한 cell의 상세정보
		let warehouse_cell = {};
		
		// 왼쪽 cell을 클릭했을 경우
		document.querySelectorAll('.cell1').forEach(elem => {
			elem.addEventListener('click', event => {
				
				const cell = event.target.closest('li');
				warehouse_cell['cell_no'] = cell.dataset.no;
				
				const rack = cell.parentElement.closest('li');
				warehouse_cell['rack_no'] = rack.dataset.no;
				
				const area = rack.parentElement.closest('li');
				warehouse_cell['area_no'] = area.dataset.no;
				
				const warehouse = area.parentElement.closest('li');
				warehouse_cell['ware_no'] = warehouse.dataset.no;
				
				drawItem();
			});
		});
		
		function getItemList(paging, callback) {
			
			const newPaging = {...warehouse_cell, ...defaultPaging, ...paging};
			const url = 'get';
			const attr = {
				method: 'post',
				headers: {'Content-Type': 'application/json; charset=utf-8'},
				body: JSON.stringify(newPaging)
			}	
			
			getJsonData(url, attr, (data) => {
				callback(data);
			});
		}
		
		function drawItem(paging) {
			
			getItemList(paging, (jsonData) => {
				 
				const itemTable = document.querySelector('.itemTable');
				 itemTable.innerHTML = "";
				 
				 if(jsonData.list.length === 0) {
					 itemTable.innerHTML = '<tr><td colspan=6 align=center>검색결과가 없습니다.</td></tr>';
				 }
				 else{
					 jsonData.list.forEach(item => {
						 const tr = document.createElement('tr');		
						 
						 const td2 = document.createElement('td')
						 td2.innerHTML = '<span class=\'badge bg-dark\'>'+item.lot_code+'</span>'
						 tr.append(td2);
						 
						 const td3 = document.createElement('td')
						 td3.innerHTML = item.code;
						 tr.append(td3);
						 
						 const td4 = document.createElement('td')
						 td4.innerHTML = item.name;
						 tr.append(td4);
						 
						 const td5 = document.createElement('td')
						 td5.innerHTML = transformNumberDot(item.amount) + " 개";
						 tr.append(td5);
						 
						 const td6 = document.createElement('td')
						 const btn = makeElement('btn', {class: 'btn btn-primary', 'data-bs-target': '#movementItem', 'data-bs-toggle': 'modal', 'data-bs-dismiss': 'modal'});
						 btn.innerHTML = '선택';
						 td6.append(btn);
						 tr.append(td6);
						 
						 // 아이템 선택 시
						 btn.addEventListener('click', evnet => {
							 modal1_form.ware1.value = item['ware_name'];
							 modal1_form.ware1.setAttribute('data-no', item['ware_no'])
							 modal1_form.area1.value = item['area_name'];
							 modal1_form.area1.setAttribute('data-no', item['area_no'])
							 modal1_form.rack1.value = item['rack_name'];
							 modal1_form.rack1.setAttribute('data-no', item['rack_no'])
							 modal1_form.cell1.value = item['cell_name'];
							 modal1_form.cell1.setAttribute('data-no', item['cell_no'])
							 
							 modal1_form.lot_code.value = item['lot_code'];
							 modal1_form.lot_code.setAttribute('data-no', item['lot_code'])
							 modal1_form.item_name.value = item['name'];
							 modal1_form.haveQty.value = item['amount'];
							 modal1_form.qty.value = item['amount'];
						 });
						 
						 itemTable.append(tr);
					 });
				 }
				 
				 paintPageNation(jsonData.totalCount, jsonData.cri, 'itemPageNation')
			});
		}
		
		/* 거래처 선택 모달의 페이지네이션을 그리는 함수 */
		function paintPageNation(totalCount, cri, location){
			
	    	console.log(cri);
	    	
			var str = ""; 
			
			var pageCount = 5; // 한번에 보여줄 페이지번호 개수 
			
			//pageNum에 따른 cri.amount 단위의 시작페이지, 끝페이지를 구함
			var endPageNum = Math.ceil(cri.pageNum / pageCount) * pageCount;// javascript 에서 pageNum / cri.amount 결과는 그냥 0.1 
			var startPageNum = endPageNum - (pageCount-1);
			var lastPageNum = Math.ceil(totalCount / cri.amount	);
			
			var isNeedFirst = cri.pageNum > 5;
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
				var active = (cri.pageNum == i ? "active" : "");
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
			
			$('#'+ location).html(str);
		}
		
		$("#itemPageNation").on("click", "li a.page-link", function(e){
			e.preventDefault(); // 번호를 눌러도 페이지가 이동하지 않도록 a태그 기능 무력화
			pageNum = $(this).attr("href");
			drawItem({pageNum : pageNum});
		});
	})();
	
	// 입고 창고 선택
	(function() {
		document.querySelectorAll('.cell2').forEach(elem => {
			elem = makeElement(elem, {'data-bs-target': '#movementItem', 'data-bs-toggle': 'modal', 'data-bs-dismiss': 'modal'});
			elem.addEventListener('click', async event => {
				
				const cell = event.target.closest('li');
				cell_no = cell.dataset.no;
				
				const rack = cell.parentElement.closest('li');
				rack_no = rack.dataset.no;
				
				const area = rack.parentElement.closest('li');
				area_no = area.dataset.no;
				
				const warehouse = area.parentElement.closest('li');
				warehouse_no = warehouse.dataset.no;
				
				const url = 'get/ware';
				const attr = {
						method: 'post',
						headers: {'Content-Type': 'application/json; charset=utf-8'},
						body: JSON.stringify({
							ware_no: warehouse_no,
							area_no: area_no,
							rack_no: rack_no,
							cell_no: cell_no
						})
				}
				await getJsonData(url, attr, (jsonData) => {
					modal1_form.ware2.value = jsonData['ware_name'];
				 	modal1_form.ware2.setAttribute('data-no', jsonData['ware_no'])
					modal1_form.area2.value = jsonData['area_name'];
					modal1_form.area2.setAttribute('data-no', jsonData['area_no'])
					modal1_form.rack2.value = jsonData['rack_name'];
					modal1_form.rack2.setAttribute('data-no', jsonData['rack_no'])
					modal1_form.cell2.value = jsonData['cell_name'];
					modal1_form.cell2.setAttribute('data-no', jsonData['cell_no'])
				});
				
			});
		});
	})();
	
    // 유효성검사
    void(function() {
    	
      document.querySelectorAll('.needs-validation').forEach(form => {
        form.addEventListener('submit', event => {
        	
        	// 창고 유효성 검사
        	const war1 = document.querySelector('input[name="ware1"]');
        	war1.value === '' ? war1.classList.add('is-invalid') : war1.classList.remove('is-invalid');
        	const war2 = document.querySelector('input[name="ware2"]');
        	war2.value === '' ? war2.classList.add('is-invalid') : war2.classList.remove('is-invalid');
        	
        	// 개수 유효성 검사
        	const cnt1 = document.querySelector('input[name="haveQty"]');
        	const cnt2 = document.querySelector('input[name="qty"]');
        	const qty_feedback = document.querySelector('.qty-feedback');
        	
        	let boolcnt = Number(cnt1.value) < Number(cnt2.value);
        	if(boolcnt) {
        		qty_feedback.innerHTML = '개수가 초과되었습니다.';
        		cnt2.classList.add('is-invalid');
        	}
        	else {
        		qty_feedback.innerHTML = '개수를 선택해 주세요.';
        		cnt2.classList.remove('is-invalid')
        	}
        	
        	// 유효성 검사
          	if (!form.checkValidity() || war1.value === '' || war2.value === '' || boolcnt) {
              event.preventDefault()
           	  event.stopPropagation()
	          form.classList.add('was-validated');
              return;
          	}
        	
			let obj = {};
			Array.from(event.target.querySelectorAll('.form-control')).forEach((value, index) => {
				obj[value.name] = value.name === 'qty'? value.value : value.dataset.no;
			});
			
			fetch('update', {method: 'post', headers: {'Content-Type': 'application/json'}, body: JSON.stringify(obj)});
			window.location.reload();
            event.preventDefault()
         	event.stopPropagation()
        });
      });
    })()
    
    // 태그 생성
   	function makeElement(elem, attr, event) {
		const e = typeof elem === 'string' &&  document.createElement(elem) || elem;
		attr && Object.keys(attr).forEach((key, index) => {
			let value = attr[key];
			if(key === 'class') {
				const classes = value.split(' ');
				classes.map(c => {
					e.classList.add(c);
				})
			}
			else {
				e.setAttribute(key, value);
			}
		});
		event && e.addEventListener(event.type, event.event);
		return e;
	}
    
 	// fetch를 이용한 비동기 통신
 	async function getJsonData(url, attr, callback) {
		const data = await fetch(url, attr);
		const jsonData = await data.json();
		callback(jsonData);
	}
    
    // 숫자에 컴마 찍기
   	function transformNumberDot(number) {
		return String(number).replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}

</script>
<!-- bottom.jsp -->
<%@include file="../../common/bottom.jsp" %>
