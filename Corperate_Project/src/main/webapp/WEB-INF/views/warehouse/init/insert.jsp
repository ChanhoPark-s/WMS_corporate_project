<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- top.jsp -->
<%@include file="/WEB-INF/views/common/top.jsp" %>

<style>
table th {
	text-align: center;	
	font-size: 14px;
}

table td {
	text-align: center;
	font-size: 14px;
}
</style>

<div class="card">
	<div class="card-body">
        <div class="mb-3">
          <label for="member_no" class="form-label">담당자</label>
          <input type="text" name="member_name" class="form-control" id="member_no" readonly="readonly" data-bs-toggle="modal" data-bs-target="#addMember" required>
          <div class="invalid-feedback">담당자를 입력하세요.</div>
        </div>
	</div>
</div>
<br>
<div class="card">
	<div class="card-body">
		<div class="d-flex gap-1 mb-4 flex-wrap">
          <div class="d-flex gap-1 me-auto flex-wrap">
            <button class="btn btn-secondary d-inline-flex align-items-center gap-1" onclick="item.itemInput()">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                <path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd"></path>
              </svg>
              품목추가
            </button>
            <button type="submit" form="itemForm" class="btn btn-primary d-inline-flex align-items-center gap-1">
              	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-save2" viewBox="0 0 16 16">
				  <path d="M2 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H9.5a1 1 0 0 0-1 1v4.5h2a.5.5 0 0 1 .354.854l-2.5 2.5a.5.5 0 0 1-.708 0l-2.5-2.5A.5.5 0 0 1 5.5 6.5h2V2a2 2 0 0 1 2-2H14a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h2.5a.5.5 0 0 1 0 1H2z"/>
				</svg>
              저장
            </button>
          </div>
        </div>
		<div class="table-responsive">
		   <form class="needs-validation" novalidate id="itemForm">
           		<table class="table table-item"></table>
           </form>
         </div>
	</div>
</div>

<!-- Modal 코드 넣을 위치 -->

<!-- 담당자 검색 -->
        <div class="modal fade" id="addMember" tabindex="-1">
          <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
              <div class="modal-header border-0">
                <h5 class="modal-title">담당자 검색</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <div class="modal-footer border-0">
					<form style="margin:auto;text-align:center;" onsubmit="return false;">
						<div class="d-flex gap-1 me-auto flex-wrap">
							<select id="searchMemberWhatColumn" class="form-select" style="width: 140px;">
								<option value="" selected="">검색 선택</option>
								<option value="dep">부서</option>
								<option value="rank">직급</option>
								<option value="name">이름</option></select>
			              	<input type="text" id="searchMemberKeyword" class="form-control" placeholder="입력" style="width: 200px; height: 38px;">
							<button type="submit" class="btn btn-light" id="searchMemberBtn"> 검색 </button>
						</div>			
					</form>	
				</div>
                <div class="table-responsive">
	              <table class="table member-table">
	                <thead class="table">
	                  <tr>
	                    <th scope="col" class="text-center">부서</th>
	                    <th scope="col" class="text-center">직급</th>
	                    <th scope="col" class="text-center">이름</th>
	                    <th scope="col" class="text-center">선택</th>
	                  </tr>
	                </thead>
	                <tbody></tbody>
	              </table>
	            </div>
	           	<!-- 페이지내이션 -->
				<nav aria-label="Page navigation borderless example">
					<ul class="pagination pagination-borderless justify-content-end" id="memberPageNation">
						<!-- 페이지내이션이 javascript 코드에 의해 그려지는 위치 -->
					</ul>
				</nav>
              </div>
            </div>
          </div>
        </div>

<!-- 품목검색 -->
        <div class="modal fade" id="addUserModal" tabindex="-1">
          <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
              <div class="modal-header border-0">
                <h5 class="modal-title">품목검색</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <div class="modal-footer border-0">
					<form style="margin:auto;text-align:center;" onsubmit="return false;">
						<div class="d-flex gap-1 me-auto flex-wrap">
							<select id="searchItemWhatColumn" class="form-select" style="width: 140px;"><option value="" selected="">검색 선택</option><option value="dep">부서</option><option value="rank">직급</option><option value="name">이름</option></select>
			              	<input type="text" id="searchItemKeyword" class="form-control" placeholder="입력" style="width: 200px; height: 38px;">
							<button type="submit" class="btn btn-light" id="searchItemsBtn"> 검색 </button>
						</div>			
					</form>	
				</div>
                <div class="table-responsive">
	              <table class="table item-table">
	                <thead class="table">
	                  <tr>
	                    <th scope="col" class="text-center">번호</th>
	                    <th scope="col" class="text-center">코드</th>
	                    <th scope="col" class="text-center">이름</th>
	                    <th scope="col" class="text-center">선택</th>
	                  </tr>
	                </thead>
	                <tbody></tbody>
	              </table>
	            </div>
            	<!-- 페이지내이션 -->
				<nav aria-label="Page navigation borderless example">
					<ul class="pagination pagination-borderless justify-content-end" id="itemPageNation">
						<!-- 페이지내이션이 javascript 코드에 의해 그려지는 위치 -->
					</ul>
				</nav>
              </div>
            </div>
          </div>
        </div>
        
<!-- 창고선택 -->
<div class="modal fade" id="searchInvenModal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
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
    </div>
  </div>
</div>
<!-- bottom.jsp -->
<%@include file="/WEB-INF/views/common/bottom.jsp" %>

<script>
	// 표
	const Item = (function() {
		const defaults = {
				tagname: 'input',
				type: 'text',
				class:'form-control',
		},
		
		// 페이징 기본설정
		defaultPaging = {
				pageNum : 1,
				amount : 10,
				whatColumn : null,
				keyword : null,
		},
		
		wt = document.querySelector('.warehouse-table tbody'),
		warehouse = document.querySelector('#warehouse'),
		area = document.querySelector('#area'),
		rack = document.querySelector('#rack'),
		cell = document.querySelector('#cell'),
		saveWareHouse = document.querySelector('.saveWareHouse');
		
		/* 페이징 전역변수 */
		let pageNum = 1,
			amount = 10,
			searchWhatColumn = "",
			searchKeyword = "";		
		
		let target;
		
		function Plguin(table, columns) {
			this.table = table;
			this.columns = columns;
			
			this.init();
		}
		
		Plguin.prototype = {
				// 초기화
				init: function () {
					this.columns = this.columns.map(obj => ({...defaults, ...obj}));
					// column 생성
					drawBody.call(this);
					// row 생성
					this.itemInput();
				},
				// row 생성
				itemInput:  function () {
					const body = document.querySelector('.' + this.table + ' tbody');
					const tr = makeElement('tr');
					this.columns.map(value => {
						const {column, tagname, ...attr} = value; 
						let td = makeElement('td');
						let div = makeElement('div');
						let input = makeElement(tagname, attr);
						div.append(input);
						td.append(div);
						tr.append(td);
						
						if(column == '품목') addItemEventListener(input);
						if(column == '창고') addWareHouseEventListener(input);
					});
					let delRow = makeElement('td');
					delRow.innerHTML =  '<button class="btn btn-light d-flex text-danger delete" onclick=item.itemDelete(this) >'
									+ '<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">'
							        + '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" /></svg>'
									+ '</button>';
					tr.append(delRow);
					body.append(tr);
				},
				
				// row 삭제
				itemDelete: function(t) {
					t.closest('tr').remove();
				},
				
				// 생성자로 만들어진 컬럼들 리턴
				getColumns: getColumns = function() {
					return this.columns;
				}
		}
		
		// table의 head와 body를 생성
		function drawBody() {
			const t = document.querySelector('.' + this.table),
				head = makeElement('thead'),
				body = makeElement('tbody');
				tr = makeElement('tr');
			this.columns.map(value => {
				let th = makeElement('th');
				th.innerHTML = value.column;
				tr.append(th);
			});
			let th = makeElement('th');
			th.innerHTML = '삭제';
			tr.append(th);
			head.append(tr);
			t.append(head);
			t.append(body);
		}
		
		// ----------------------------------------------- 멤버 
		
		// 메인 페이지의 담당자를 눌렀을 경우 해당 input을 가리킴
		let memberTarget;
		
		// 담당자 검색버튼 눌렀을 경우 (1페이지로 돌아감)
		document.querySelector('#searchMemberBtn').addEventListener('click', event => {
			drawMember();
		});
		
		// 메인 페이지의 담당자를 눌렀을 경우 (1페이지로 돌아감)
		document.querySelector('#member_no').addEventListener('click', event => {
			memberTarget = event.target;
			drawMember();	
		});
		
		// 검색 키워드 조회
		function getMemberList(paging, callback) {
			const newPaging = {...defaultPaging, ...paging},
				whatColumn = document.querySelector('#searchMemberWhatColumn').value,
				keyword = document.querySelector('#searchMemberKeyword').value,
				attr = null,
				url = location.origin + '/basicinfo/member/pages/' + newPaging.pageNum + '/' + newPaging.amount + '/' + whatColumn + '/' + keyword;
			
			// getJsonData 함수 내의 fetch를 이용해 품목리스트 가져옴
			getJsonData(url, attr, (data) => {
				callback(data);
			});		
		}
		
		// 비동기 통신을 이용해 가져온 데이터들을 토대로 테이블 작성
		function drawMember(paging) {
			body = document.querySelector('.member-table tbody');
			getMemberList(paging, data => {
				body.innerHTML = "";
				data.list.forEach((value, index) => {
					let {no, dep_name, rank_name, name} = value;
					
					let tr = document.createElement('tr');
					
					let td1 = document.createElement('td');
					td1.textContent = dep_name;
					td1.classList.add('text-center');
					tr.append(td1);
					
					let td2 = document.createElement('td');
					td2.textContent = rank_name;
					td2.classList.add('text-center');
					tr.append(td2);
					
					let td3 = document.createElement('td');
					td3.textContent = name;
					td3.classList.add('text-center');
					tr.append(td3);
					
					let td4 = document.createElement('td');
					td4.innerHTML = '<button type="button" class="btn btn-dark btn-sm">선택</button>';
					td4.setAttribute('data-bs-dismiss', 'modal');
					td4.classList.add('text-center');
					tr.append(td4);
					
					// 담당자를 선택 시
					td4.addEventListener('click', event => {
						memberTarget.value = name;
						memberTarget.setAttribute('data-value', no);
					});
					
					body.append(tr);
				});
				
				// 멤버의 페이지네이션을 그림
				paintPageNation(data.totalCount, data.cri, 'memberPageNation');
			});
		}
		
		// ----------------------------------------------- 멤버 끝
		
		// ----------------------------------------------- 품목
		
		// 메인 페이지의 품목 눌렀을 경우 해당 input을 가리킴
		let itemTarget;
		
		// 품목 검색버튼 눌렀을 경우 (1페이지로 돌아감)
		document.querySelector('#searchItemsBtn').addEventListener('click', event => {
			drawItem();
		});
		
		// 품목을 클릭했을 경우 이벤트 리스너를 붙여줌
		function addItemEventListener(elem) {
			elem.addEventListener('click', (event) => {
				itemTarget = event.target;
				drawItem();
			})
		}
		
		function getItemList(paging, callback) {
			
			const newPaging = {...defaultPaging, ...paging},
				whatColumn = document.querySelector('#searchItemWhatColumn').value,
				keyword = document.querySelector('#searchItemKeyword').value,
				attr = null,
				url = location.origin + '/basicinfo/item/pages/' + newPaging.pageNum + '/' + newPaging.amount + '/' + whatColumn + '/' + keyword;
			
			// fetch를 이용해 품목리스트 가져옴
			getJsonData(url, attr, (data) => {
				callback(data);
			});		
		}
		
		function drawItem(paging) {
			body = document.querySelector('.item-table tbody');
			getItemList(paging, data => {
				body.innerHTML = "";
				data.list.forEach((value, index) => {
					let {no, code, name} = value;
					
					let tr = document.createElement('tr');
					
					let td1 = document.createElement('td');
					td1.textContent = no;
					td1.classList.add('text-center');
					tr.append(td1);
					
					let td2 = document.createElement('td');
					td2.textContent = code;
					td2.classList.add('text-center');
					tr.append(td2);
					
					let td3 = document.createElement('td');
					td3.textContent = name;
					td3.classList.add('text-center');
					tr.append(td3);
					
					let td4 = document.createElement('td');
					td4.innerHTML = '<button type="button" class="btn btn-dark btn-sm">선택</button>';
					td4.setAttribute('data-bs-dismiss', 'modal');
					td4.classList.add('text-center');
					tr.append(td4);
					
					td4.addEventListener('click', event => {
						itemTarget.value = name;
						itemTarget.setAttribute('data-value', no);
					});
					
					body.append(tr);
				});
				/* 페이지네이션 */
				paintPageNation(data.totalCount, data.cri, 'itemPageNation');
			});
		}
		
		// ----------------------------------------------- 품목 끝
		
		// ----------------------------------------------- 창고
		
		// 왼쪽 클릭한 cell의 상세정보
		let warehouse_cell = {},
		arr = ['ware', 'area', 'rack', 'cell'],
		wareTarget;
		
		function addWareHouseEventListener(elem) {
			elem.addEventListener('click', (event) => {
				wareTarget = event.target;
			})			
		}
		
		document.querySelectorAll('.cell2').forEach(elem => {
			elem = makeElement(elem, {'data-bs-target': '#searchInvenModal', 'data-bs-toggle': 'modal', 'data-bs-dismiss': 'modal'});
			elem.addEventListener('click', async event => {
				
				const cell = event.target.closest('li');
				warehouse_cell['cell_no'] = cell.dataset.no;
				
				const rack = cell.parentElement.closest('li');
				warehouse_cell['rack_no'] = rack.dataset.no;
				
				const area = rack.parentElement.closest('li');
				warehouse_cell['area_no'] = area.dataset.no;
				
				const warehouse = area.parentElement.closest('li');
				warehouse_cell['ware_no'] = warehouse.dataset.no;
				
				const url = 'ware/get';
				const attr = {
						method: 'post',
						headers: {'Content-Type': 'application/json; charset=utf-8'},
						body: JSON.stringify(warehouse_cell)
				}
				await getJsonData(url, attr, (jsonData) => {
					
					const tr = wareTarget.closest('tr');
					const tds = Array.from(tr.children).slice(2, 6);
					tds.forEach((value, index) => {
						value.querySelector('input').value = jsonData[arr[index] + '_name'];
						value.querySelector('input').setAttribute('data-value',jsonData[arr[index] + '_no']);
					});	
				});
			});
		});
			
		// ----------------------------------------------- 창고 끝
		
		/* 거래처 선택 모달의 페이지네이션을 그리는 함수 */
		function paintPageNation(totalCount, cri, location){
			
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
		
		$("#memberPageNation").on("click", "li a.page-link", function(e){
			e.preventDefault(); // 번호를 눌러도 페이지가 이동하지 않도록 a태그 기능 무력화
			pageNum = $(this).attr("href");
			drawMember({pageNum : pageNum});
		});
		
		return Plguin;
		
	})();
	
	
	const item = new Item('table', [
		{column: '품목', name: 'item_no', class:'form-control insert', 'data-bs-toggle':"modal", 'data-bs-target':"#addUserModal", autocomplete:"off", readonly: "readonly", required: "required"},
		{column: '수량', name: 'qty', class:'form-control', required: "required"},
		{column: '창고', name: 'ware_code', class:'form-control', 'data-bs-toggle':"modal", 'data-bs-target':"#searchInvenModal", readonly: "readonly", required: "required"},
		{column: '구역', name: 'area_code', class:'form-control', readonly: "readonly"},
		{column: '렉', name: 'rack_code', class:'form-control', readonly: "readonly"},
		{column: '셀', name: 'cell_code', class:'form-control', readonly: "readonly"},
	]);
	
	// 저장
	function saveData() {
		const trs = Array.from(document.querySelectorAll('.table-item tr')).slice(1),
		columns = item.getColumns(),
		member_no = document.querySelector('#member_no').dataset.value;
		lists = [];
		trs.forEach((value, index) => {
			let obj = {};
			Array.from(value.querySelectorAll('.form-control')).forEach((value, index) => {
				obj[columns[index].name] = value.name === 'qty'? value.value : value.dataset.value;
			});
			lists.push(obj);
		});
		fetch(window.location.origin + '/warehouse/init/save', {method: 'post', headers: {'Content-Type': 'application/json'}, body: JSON.stringify({member_no: member_no, detail: lists})});
		window.location.reload();
	}
	
	// fetch를 이용한 비동기 통신
	async function getJsonData(url, attr, callback) {
		const data = await fetch(url, attr);
		const json = await data.json();
		callback(json);
	};
	
	// 태그 생성
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
	
    // 유효성 검사
    void(function() {
    	
   	  const idcheck = document.querySelector('.idcheck');
      document.querySelectorAll('.needs-validation').forEach(form => {
        form.addEventListener('submit', event => {
        	
        	let a = false, b = false;
        	const items = document.querySelectorAll('input[name="item_no"]');
        	items.forEach(item => {
        		item.value === '' ? item.classList.add('is-invalid') : item.classList.remove('is-invalid');
        		a = item.value == '' && true;
        	});
        	
        	const ware_code = document.querySelectorAll('input[name="ware_code"]');
        	ware_code.forEach(item => {
	        	item.value === '' ? item.classList.add('is-invalid') : item.classList.remove('is-invalid');
	        	b = item.value == '' && true;
        	});
        	
        	let c = false;
        	const member = document.querySelector('input[name="member_name"]');
        	member.value === '' ? member.classList.add('is-invalid') : member.classList.remove('is-invalid');
        	c = member.value == '' && true;
        	
          if (!form.checkValidity() || a || b || c) {
            event.preventDefault()
            event.stopPropagation()
	        form.classList.add('was-validated')
	        return;
          }
          saveData();
          event.preventDefault()
          event.stopPropagation()
        })
      })
    })()
</script>

<script type="text/javascript">
	/* 왼쪽 카테고리창이 해당화면에 맞게 펼쳐지게 하는 코드 */
	$(function(){ 
		document.getElementById('basicinfo').click();
	});
</script>
