<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- top.jsp -->
<%@include file="/WEB-INF/views/common/top.jsp" %>

<div class="card">
	<div class="card-body">
        <div class="mb-3">
          <label for="userFullname" class="form-label">담당자</label>
          <input type="text" name="name" class="form-control" id="userFullname" required autofocus>
          <div class="invalid-feedback">User full name is required.</div>
        </div>
	</div>
</div>
<br>
<div class="card">
	<div class="card-body">
		<div class="d-flex gap-1 mb-4 flex-wrap">
          <div class="d-flex gap-1 me-auto flex-wrap">
            <button class="btn btn-primary d-inline-flex align-items-center gap-1" onclick="item.itemInput()">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                <path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd"></path>
              </svg>
              품목추가
            </button>
            <button class="btn btn-primary d-inline-flex align-items-center gap-1">
              저장
            </button>
          </div>
        </div>
		<div class="table-responsive">
           <table class="table"></table>
         </div>
	</div>
</div>

<!-- Modal 코드 넣을 위치 -->

<!-- 물품검색 -->
        <div class="modal fade" id="addUserModal" tabindex="-1">
          <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
              <div class="modal-header border-0">
                <h5 class="modal-title">물품추가</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form class="needs-validation" novalidate id="taskForm" enctype="multipart/form-data" method="post" action="">
                  <div class="mb-3">
                    <label for="userFullname" class="form-label">검색</label>
                    <input type="text" name="name" class="form-control" id="userFullname" required autofocus>
                    <div class="invalid-feedback">User full name is required.</div>
                  </div>
                </form>
                <div class="table-responsive">
	              <table class="table item-table">
	                <thead class="table-dark">
	                  <tr>
	                    <th scope="col">품목번호</th>
	                    <th scope="col">품목코드</th>
	                    <th scope="col">품목이름</th>
	                  </tr>
	                </thead>
	                <tbody></tbody>
	              </table>
	            </div>
              </div>
              <div class="modal-footer border-0">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
                <button type="submit" form="taskForm" class="btn btn-primary px-5">저장</button>
              </div>
            </div>
          </div>
        </div>
        
<!-- 창고검색 -->
        <div class="modal fade" id="searchInvenModal" tabindex="-1">
          <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
              <div class="modal-header border-0">
                <h5 class="modal-title">물품추가</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form class="needs-validation" novalidate id="taskForm" enctype="multipart/form-data" method="post" action="">
                  <div class="mb-3">
                    <label for="userFullname" class="form-label">검색</label>
                    <input type="text" name="name" class="form-control" id="userFullname" required autofocus>
                    <div class="invalid-feedback">User full name is required.</div>
                  </div>
                </form>
                <div class="table-responsive">
	              <table class="table item-table">
	                <thead class="table-dark">
	                  <tr>
	                    <th scope="col">품목번호</th>
	                    <th scope="col">품목코드</th>
	                    <th scope="col">품목이름</th>
	                  </tr>
	                </thead>
	                <tbody></tbody>
	              </table>
	            </div>
              </div>
              <div class="modal-footer border-0">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
                <button type="submit" form="taskForm" class="btn btn-primary px-5">저장</button>
              </div>
            </div>
          </div>
        </div>

<!-- bottom.jsp -->
<%@include file="/WEB-INF/views/common/bottom.jsp" %>

<script>

	// 표
	const Item = (function() {
		
		const def = {
				tagname: 'input',
				type: 'text',
				class:'form-control',
		}
		
		function Plguin(table, columns) {
			this.table = table;
			this.columns = columns;
			this.init();
		}
		
		Plguin.prototype.init = function () {
			
			this.columns = this.columns.map(obj => ({...def, ...obj}));
			
			// column 생성
			makeTheadTbody.call(this);
			
			// row 생성
			this.itemInput(this);
		}
		
		Plguin.prototype.itemInput = function () {
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
				if(column == '창고') addInvenEventListener(input);
			});
			let td = makeElement('td');
			td.innerHTML =  '<button type="button" class="btn btn-light d-flex text-danger delete">'
							+ '<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">'
					        + '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" /></svg>'
							+ '</button>';
			tr.append(td);
			body.append(tr);
		}
		
		function makeTheadTbody() {
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
				e.setAttribute(key, value);
			});
			event && e.addEventListener(event.type, event.event);
			return e;
		}
		
		// 품목 리스트 fetch
		async function getItemList() {
			const data = await fetch('http://localhost:8080/warehouse/init/get', {method: 'post'});
			const json = await data.json();
			return json;
		};
		
		// 품목 fetch
		async function getItem(no) {
			const data = await fetch('http://localhost:8080/warehouse/init/get/' + no, {method: 'get'});
			const json = await data.json();
			return json;
		};
		
		function addItemEventListener(elem) {
			
			elem.addEventListener('click', async (event) => {
				
				const 	target = event.target,
						body = document.querySelector('.item-table tbody');
				body.innerHTML = "";
				
				// fetch를 이용해 품목리스트 가져옴
				const items = await getItemList();
				
				items.forEach((value, index) => {
					let {no, code, name} = value;
					
					let tr = document.createElement('tr');
					tr.setAttribute('data-bs-dismiss', 'modal');
					
					let td1 = document.createElement('td');
					td1.textContent = no;
					tr.append(td1);
					let td2 = document.createElement('td');
					td2.textContent = code;
					tr.append(td2);
					let td3 = document.createElement('td');
					td3.textContent = name;
					tr.append(td3);
					
					body.append(tr);
					tr.addEventListener('click', event => {
						console.log(no);
					});
				});
			})
		}
		
		function addInvenEventListener() {
			
		}
		
		return Plguin;
	})();
	
	const item = new Item('table', [
		{column: '품목', name: 'item_name', class:'form-control insert', 'data-bs-toggle':"modal", 'data-bs-target':"#addUserModal", autocomplete:"off"},
		{column: '수량', name: 'item_code', class:'form-control'},
		{column: '창고', name: 'item_code', class:'form-control'},
		{column: '구역', name: 'item_code', class:'form-control'},
		{column: '렉', name: 'item_code', class:'form-control'},
		{column: '셀', name: 'item_code', class:'form-control'},
	]);
</script>
