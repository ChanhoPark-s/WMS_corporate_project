<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- top.jsp -->
<%@include file="/WEB-INF/views/common/top.jsp" %>
<style>
	svg.arrow {
    width: 80px;
    height: 80px;
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
                    <th scope="col">입고 창고</th>
                    <th scope="col">이동날짜</th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach items="${list }" var="item">
                		<tr>
                			<td>${item.no }</td>
                			<td>${item.lot_code }</td>
                			<td>${item.item_name }</td>
                			<td>${item.qty }</td>
                			<td>${item.ware1 }</td>
                			<td>${item.ware2 }</td>
                			<td>${item.day }</td>
                		</tr>
                	</c:forEach>
                </tbody>
              </table>
            </div>
            <nav aria-label="Page navigation borderless example">
              <ul class="pagination pagination-borderless justify-content-end">
                <li class="page-item disabled">
                  <a class="page-link d-flex align-items-center px-2" href="#" tabindex="-1" aria-disabled="true" aria-label="Previous">
                    <svg width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd"></path>
                    </svg>
                  </a>
                </li>
                <li class="page-item active" aria-current="page">
                  <a class="page-link" href="javascript:void(0)">1</a>
                </li>
                <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                <li class="page-item">
                  <a class="page-link d-flex align-items-center px-2" href="javascript:void(0)" aria-label="Next">
                    <svg width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
                    </svg>
                  </a>
                </li>
              </ul>
            </nav>
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
			<div class="row-sm-3">
				<label for="ware1" class="form-label">출고 창고</label>
				<input type="text" name="ware1" class="form-control" required readonly>
				<div class="invalid-feedback">출고 품목을 선택해 주세요.</div>
			</div>
			<div class="row-sm-3">
				<label for="area1" class="form-label">출고 구역</label>
				<input type="text" name="area1" class="form-control" readonly="">
			</div>
			<div class="row-sm-3">
				<label for="rack1" class="form-label">출고 렉</label>
				<input type="text" name="rack1" class="form-control" readonly="">
			</div>
			<div class="row-sm-3">
				<label for="cell1" class="form-label">출고 셀</label>
				<input type="text" name="cell1" class="form-control" readonly="">
			</div>
			<div class="row-sm-2">	
				<label for="userFullname" class="form-label">&nbsp;&nbsp;</label>
				<button type="button" class="btn btn-primary" style="display:block" data-bs-target="#movementItem2" data-bs-toggle="modal" data-bs-dismiss="modal" id="choiceMemberBtn">출고 품목 선택</button>	
			</div>
		</div>
		<div class="col">
			<div style="height: 100%; width: 100%; display: flex; justify-content: center; align-items: center;">
				<svg class="arrow" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-square-fill" viewBox="0 0 16 16">
				  <path d="M0 14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v12zm4.5-6.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5a.5.5 0 0 1 0-1z"/>
			</div>
		</div>
		<div class="col">		
			<div class="row-sm-3">
				<label for="ware2" class="form-label">입고 창고</label>
				<input type="text" name="ware2" class="form-control" readonly required>
				<div class="invalid-feedback">입고 창고를 선택해 주세요.</div>
			</div>
			<div class="row-sm-3">
				<label for="area2" class="form-label">입고 구역</label>
				<input type="text" name="area2" class="form-control" readonly>
			</div>
			<div class="row-sm-3">
				<label for="rack2" class="form-label">입고 렉</label>
				<input type="text" name="rack2" class="form-control" readonly>
			</div>
			<div class="row-sm-3">
				<label for="cell2" class="form-label">입고 셀</label>
				<input type="text" name="cell2" class="form-control" readonly>
			</div>
			<div class="row-sm-2">	
				<label for="userFullname" class="form-label">&nbsp;&nbsp;</label>
				<button type="button" class="btn btn-primary" style="display:block" data-bs-target="#movementItem3" data-bs-toggle="modal" data-bs-dismiss="modal">입고 창고 선택</button>	
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
	 </div>
	 <br>
	 <div class="">
		<label for="qty" class="form-label">개수</label>
		<input type="text" name="qty" id="qty" class="form-control" required>
		<div class="invalid-feedback">개수를 선택해 주세요.</div>
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
        <div class="d-flex flex-wrap gap-1">
		<div class="col">		
			<ul class="navbar-nav mb-4" id="mainMenu">
         	 <li class="nav-label px-2 small mt-3"><small>품목 선택</small></li>
          		<c:forEach items="${warehouse }" var="w" varStatus="wi">
          		<li class="nav-item" data-no=${w.no }>
		            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" data-no=${w.no } href="#area-${wi.index }" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="dashboard-collapse">
		              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
		                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z"></path>
		              </svg>
		              <span class="me-auto" id="basicinfo">${w.name }</span>
		            </a>
		            <div class="ms-4 collapse" id="area-${wi.index }" data-bs-parent="#mainMenu">
		              <ul class="navbar-nav">
				          <c:forEach items="${area }" var="a" varStatus="ai">
				          	<c:if test="${w.no eq a.ware_no }">
								<li class="nav-item" data-no=${a.no }>
						            <a class="nav-link px-2 d-flex align-items-center gap-3 <c:if test="${fn:length(area) != 0 }">dropdown-toggle</c:if>" data-no=${a.no } href="#rack-${ai.index }" data-bs-toggle="collapse" role="button" aria-expanded="true" aria-controls="dashboard-collapse">
						              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
						                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z"></path>
						              </svg>
						              <span class="me-auto" id="basicinfo">${a.name }</span>
						            </a>
						            <div class="ms-4 collapse" id="rack-${ai.index }" data-bs-parent="#mainMenu" style="">
						              <ul class="navbar-nav">
						              	<c:forEach items="${rack }" var="r" varStatus="ri">
						              		<c:if test="${a.no eq r.area_no }">
						              			<li class="nav-item" data-no=${r.no }>
										            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#cell-${ri.index }" data-bs-toggle="collapse" role="button" aria-expanded="true" aria-controls="dashboard-collapse">
										              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
										                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z"></path>
										              </svg>
										              <span class="me-auto" id="basicinfo">${r.name }</span>
										            </a>
										            <div class="ms-4 collapse" id="cell-${ri.index }" data-bs-parent="#mainMenu" style="">
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
		<div class="col">		
            <div class="table-responsive">
                  <table class="table caption-top mb-0">
                    <thead>
                      <tr>
                        <th scope="col">이미지</th>
                        <th scope="col">로트번호</th>
                        <th scope="col">코드</th>
                        <th scope="col">이름</th>
                        <td scope="col">재고</td>
                        <td scope="col">선택</td>
                      </tr>
                    </thead>
                    <tbody class="itemTable">
                    	
                    </tbody>
                  </table>
                </div>
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
			<ul class="navbar-nav mb-4" id="mainMenu">
         	 <li class="nav-label px-2 small mt-3"><small>창고 선택</small></li>
          		<c:forEach items="${warehouse }" var="w" varStatus="wi">
          		<li class="nav-item" data-no=${w.no }>
		            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" data-no=${w.no } href="#area2-${wi.index }" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="dashboard-collapse">
		              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
		                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z"></path>
		              </svg>
		              <span class="me-auto" id="basicinfo">${w.name }</span>
		            </a>
		            <div class="ms-4 collapse" id="area2-${wi.index }" data-bs-parent="#mainMenu">
		              <ul class="navbar-nav">
				          <c:forEach items="${area }" var="a" varStatus="ai">
				          	<c:if test="${w.no eq a.ware_no }">
								<li class="nav-item" data-no=${a.no }>
						            <a class="nav-link px-2 d-flex align-items-center gap-3 <c:if test="${fn:length(area) != 0 }">dropdown-toggle</c:if>" data-no=${a.no } href="#rack2-${ai.index }" data-bs-toggle="collapse" role="button" aria-expanded="true" aria-controls="dashboard-collapse">
						              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
						                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z"></path>
						              </svg>
						              <span class="me-auto" id="basicinfo">${a.name }</span>
						            </a>
						            <div class="ms-4 collapse" id="rack2-${ai.index }" data-bs-parent="#mainMenu" style="">
						              <ul class="navbar-nav">
						              	<c:forEach items="${rack }" var="r" varStatus="ri">
						              		<c:if test="${a.no eq r.area_no }">
						              			<li class="nav-item" data-no=${r.no }>
										            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#cell2-${ri.index }" data-bs-toggle="collapse" role="button" aria-expanded="true" aria-controls="dashboard-collapse">
										              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
										                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z"></path>
										              </svg>
										              <span class="me-auto" id="basicinfo">${r.name }</span>
										            </a>
										            <div class="ms-4 collapse" id="cell2-${ri.index }" data-bs-parent="#mainMenu" style="">
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
		const searchDefault = {
				pageNum: 1,
				amount: 10
		};
		let 
			warehouse_no = null,
			area_no = null,
			rack_no = null,
			cell_no = null;
		
		// 왼쪽 cell을 클릭했을 경우
		document.querySelectorAll('.cell1').forEach(elem => {
			elem.addEventListener('click', event => {
				
				const cell = event.target.closest('li');
				cell_no = cell.dataset.no;
				
				const rack = cell.parentElement.closest('li');
				rack_no = rack.dataset.no;
				
				const area = rack.parentElement.closest('li');
				area_no = area.dataset.no;
				
				const warehouse = area.parentElement.closest('li');
				warehouse_no = warehouse.dataset.no;
				
				const url = 'get';
				const attr = {
						method: 'post',
						headers: {'Content-Type': 'application/json; charset=utf-8'},
						body: JSON.stringify(clickPageNum({
							ware_no: warehouse_no,
							area_no: area_no,
							rack_no: rack_no,
							cell_no: cell_no
						}))
				}
				getJsonData(url, attr);
			});
		});
		
		function clickPageNum(search) {
			return {...searchDefault, ...search};
		}
		
		async function getJsonData(url, attr) {
			
			const data = await fetch(url, attr);
			const jsonData = await data.json();
			console.log(jsonData);
			drawItemTable(jsonData);
		}
		
		function drawItemTable(jsonData) {
			 const itemTable = document.querySelector('.itemTable');
			 itemTable.innerHTML = "";
			 
			 jsonData.list.forEach(item => {
				 const tr = document.createElement('tr');
				 
				 const td1 = document.createElement('td');
				 td1.append(makeElement('img', {'src': item.image}))
				 tr.append(td1);
				 
				 const td2 = document.createElement('td')
				 td2.innerHTML = item.lot_code;
				 tr.append(td2);
				 
				 const td3 = document.createElement('td')
				 td3.innerHTML = item.code;
				 tr.append(td3);
				 
				 const td4 = document.createElement('td')
				 td4.innerHTML = item.name;
				 tr.append(td4);
				 
				 const td5 = document.createElement('td')
				 td5.innerHTML = item.amount;
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
				 });
				 
				 itemTable.append(tr);
			 });
		}
		
		function makeElement(elem, attr, event) {
			const e = document.createElement(elem);
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
				const jsonData = await getJsonData(url, attr);
				
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
		
		async function getJsonData(url, attr) {
			const data = await fetch(url, attr);
			const jsonData = await data.json();
			return jsonData;
		}
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
	})();
	
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    void(function() {
    	
      document.querySelectorAll('.needs-validation').forEach(form => {
        form.addEventListener('submit', event => {
        	
        	const war1 = document.querySelector('input[name="ware1"]');
        	war1.value === '' ? war1.classList.add('is-invalid') : war1.classList.remove('is-invalid');
        	const war2 = document.querySelector('input[name="ware2"]');
        	war2.value === '' ? war2.classList.add('is-invalid') : war2.classList.remove('is-invalid');
        	
        	// 유효성 검사
          	if (!form.checkValidity() || war1.value === '' || war2.value === '') {
              event.preventDefault()
           	  event.stopPropagation()
	          form.classList.add('was-validated');
              return;
          	}
        	
			let obj = {};
			Array.from(event.target.querySelectorAll('.form-control')).forEach((value, index) => {
				obj[value.name] = value.name === 'qty'? value.value : value.dataset.no;
			});
			
			console.log(obj);
			
			fetch('update', {method: 'post', headers: {'Content-Type': 'application/json'}, body: JSON.stringify(obj)});
			window.location.reload();
            event.preventDefault()
         	event.stopPropagation()
        });
      });
      
	 	async function getJsonData(url, attr) {
			const data = await fetch(url, attr);
			const jsonData = await data.json();
			return jsonData;
		}
    })()
    

</script>
<!-- bottom.jsp -->
<%@include file="../../common/bottom.jsp" %>
