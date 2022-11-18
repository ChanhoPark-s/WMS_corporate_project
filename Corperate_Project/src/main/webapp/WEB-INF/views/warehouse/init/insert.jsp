<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- top.jsp -->
<%@include file="/WEB-INF/views/common/top.jsp" %>

<style type="text/css">

</style>

<div class="card">
	<div class="card-body">
        <div class="mb-3">
          <label for="member_no" class="form-label">담당자</label>
          <input type="text" name="name" class="form-control" id="member_no" required autofocus>
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
            <button class="btn btn-primary d-inline-flex align-items-center gap-1" onclick="saveData()">
              	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-save2" viewBox="0 0 16 16">
				  <path d="M2 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H9.5a1 1 0 0 0-1 1v4.5h2a.5.5 0 0 1 .354.854l-2.5 2.5a.5.5 0 0 1-.708 0l-2.5-2.5A.5.5 0 0 1 5.5 6.5h2V2a2 2 0 0 1 2-2H14a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h2.5a.5.5 0 0 1 0 1H2z"/>
				</svg>
              저장
            </button>
          </div>
        </div>
		<div class="table-responsive">
           <table class="table table-item"></table>
         </div>
	</div>
</div>

<!-- Modal 코드 넣을 위치 -->

<!-- 물품검색 -->
        <div class="modal fade" id="addUserModal" tabindex="-1">
          <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
              <div class="modal-header border-0">
                <h5 class="modal-title">물품검색</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <div class="modal-footer border-0">
					<form style="margin:auto;text-align:center;" onsubmit="return false;">
						<div class="d-flex gap-1 me-auto flex-wrap">
							<select id="searchWhatColumn" class="form-select" style="width: 140px;"><option value="" selected="">검색 선택</option><option value="dep">부서</option><option value="rank">직급</option><option value="name">이름</option></select>
			              	<input type="text" id="searchKeyword" class="form-control" placeholder="입력" style="width: 200px; height: 38px;">
							<button type="submit" class="btn btn-light" id="searchBtn"> 검색 </button>
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
					<ul class="pagination pagination-borderless justify-content-end" id="clientPageNation">
						<!-- 페이지내이션이 javascript 코드에 의해 그려지는 위치 -->
					</ul>
				</nav>
              </div>
            </div>
          </div>
        </div>
        
<!-- 창고검색 -->
        <div class="modal fade" id="searchInvenModal" tabindex="-1">
          <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
              <div class="modal-header border-0">
                <h5 class="modal-title">창고검색</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
              	<div class="mb-3">
                    <label for="warehouse" class="form-label">창고</label>
                    <input type="text" name="warehouse" class="form-control" id="warehouse" readonly required>
                    <div class="invalid-feedback">User full name is required.</div>
                  </div>
                  <div class="mb-3">
                    <label for="area" class="form-label">구역</label>
                    <input type="text" name="area" class="form-control" id="area" readonly>
                    <div class="invalid-feedback">User id is required.</div>
                  </div>
                  <div class="mb-3">
                    <label for="rack" class="form-label">렉</label>
                    <input type="text" name="rack" class="form-control" id="rack" readonly>
                    <div class="invalid-feedback">User password is required.</div>
                  </div>
                  <div class="mb-3">
                    <label for="cell" class="form-label">셀</label>
                    <input type="text" name="cell" class="form-control" id="cell" readonly>
                    <div class="invalid-feedback">User password is required.</div>
                  </div>
	             	<div class="table-responsive">
		              <table class="table warehouse-table">
		                <thead class="table">
		                  <tr>
		                    <th scope="col" class="text-center">번호</th>
		                    <th scope="col" class="text-center">코드</th>
		                    <th scope="col" class="text-center">이름</th>
		                    <th scope="col" class="text-center">선택</th>
		                  </tr>
		                </thead>
		                <tbody class="modal-tbody"></tbody>
		              </table>
		            </div>
	            	<!-- 페이지내이션 -->
					<nav aria-label="Page navigation borderless example">
						<ul class="pagination pagination-borderless justify-content-end" id="clientPageNation">
							<!-- 페이지내이션이 javascript 코드에 의해 그려지는 위치 -->
						</ul>
					</nav>
              </div>
              <div class="modal-footer border-0">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
                <button type="button" form="warehouseForm" data-bs-dismiss="modal" class="btn btn-primary px-5 saveWareHouse" >저장</button>
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
		},
		wt = document.querySelector('.warehouse-table tbody'),
		warehouse = document.querySelector('#warehouse'),
		area = document.querySelector('#area'),
		rack = document.querySelector('#rack'),
		cell = document.querySelector('#cell'),
		saveWareHouse = document.querySelector('.saveWareHouse'),
		arr = [warehouse, area, rack, cell];
		
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
				if(column == '창고') addWareHouseEventListener(input);
			});
			let delRow = makeElement('td');
			delRow.innerHTML =  '<button class="btn btn-light d-flex text-danger delete" onclick=item.itemDelete(this) >'
							+ '<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">'
					        + '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" /></svg>'
							+ '</button>';
			tr.append(delRow);
			body.append(tr);
		}
		Plguin.prototype.itemDelete = function(t) {
			t.closest('tr').remove();
		}
		Plguin.prototype.length = function() {
			return this.columns.length;
		}
		Plguin.prototype.getColumns = function() {
			return this.columns;
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
		
		function addItemEventListener(elem) {
			elem.addEventListener('click', (event) => {
				target = event.target;
				drawItem();
			})
		}
		
		function getItemList(paging, callback) {
			const	
				target = event.target,
				attr = {method: 'GET'};	
			let
				url = location.origin + '/basicinfo/item/pages/'+paging.pageNum + '/' + paging.amount;
				
			url += paging.whatColumn ? '' : '/' + paging.whatColumn;
			url += paging.keyword ? '' : '/' + paging.keyword;
			
			// fetch를 이용해 품목리스트 가져옴
			getJsonData(url, attr, (data) => {
				callback(data);
			});		
		}
		
		function drawItem(paging) {
			let defaultPaging = {
					pageNum : 1,
					amount : 10,
					whatColumn : null,
					keyword : null,
			},
			body = document.querySelector('.item-table tbody');
			
			const newPaging = {...defaultPaging, ...paging};
			
			getItemList(newPaging, data => {
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
					td4.innerHTML = '<button type="button" class="btn btn-primary btn-sm">선택</button>';
					td4.setAttribute('data-bs-dismiss', 'modal');
					td4.classList.add('text-center');
					tr.append(td4);
					
					td4.addEventListener('click', event => {
						target.value = name;
						target.setAttribute('data-value', no);
					});
					
					body.append(tr);
				});
				/* 페이지네이션 */
				paintPageNation(data.totalCount, data.cri);
			});
		}
		
		let elemEventTarget;
		function addWareHouseEventListener(elem) {
			elem.addEventListener('click', elemEvent => {
				// 클로저 땜시 분리했음
				elemEventTarget = elemEvent.target;
			})
		}
		saveWareHouse.addEventListener('click', btnEvent => {
			const tr = elemEventTarget.closest('tr');
			const tds = Array.from(tr.children).slice(2, 6);
			btnEvent.target.setAttribute('data-bs-dismiss', 'modal');
			tds.forEach((value, index) => {
				value.querySelector('input').value = arr[index].value;
				value.querySelector('input').setAttribute('data-value', arr[index].dataset.no);
			});			
		});
		warehouse.addEventListener('click', event => {
			addItemToTable(event);
		});
		area.addEventListener('click', event => {
			addItemToTable(event, warehouse);
		});
		rack.addEventListener('click', event => {
			addItemToTable(event, area);
		});
		
		cell.addEventListener('click', event => {
			addItemToTable(event, rack);
		});
		function addItemToTable(event, prev) {
			wt.innerHTML = '';
			const target = event.target,
				no = prev && prev.dataset.no || '';
				name = target.name,
				url = 'http://localhost:8080/warehouse/init/' + name + '/get/' + no,
				attr = {headers: {'Content-Type' : 'application/json; charset=utf-8'}};
				
			getJsonData(url, attr, (data) => {
				data.forEach( data => {
					const tr = makeElement('tr');
					
					const no = makeElement('td');
					no.textContent = data.no;
					no.classList.add('text-center');
					tr.append(no);
					
					const code = makeElement('td');
					code.textContent = data.code;
					code.classList.add('text-center');
					tr.append(code);
					
					const name = makeElement('td');
					name.textContent = data.name;
					name .classList.add('text-center');
					tr.append(name);
					
					const btntd = makeElement('td');
					btntd.classList.add('text-center');
					const btn = makeElement('button', {class: 'btn btn-primary btn-sm'});
					btn.textContent = '선택';
					btntd.append(btn);
					tr.append(btntd);
					wt.append(tr);
					
					btn.addEventListener('click', event => {
						const ttr = event.target.closest('tr');
						target.value = ttr.children[2].textContent;
						target.setAttribute('data-no', ttr.children[0].textContent);
					});
				});
			});
		}
		async function getJsonData(url, attr, callback) {
			const data = await fetch(url, attr);
			const json = await data.json();
			callback(json);
		};
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
		
		/* 거래처 선택 모달의 페이지네이션을 그리는 함수 */
		function paintPageNation(totalCount, cri){
			
			var str = ""; 
			
			var pageCount = 5; // 한번에 보여줄 페이지번호 개수 
			
			//pageNum에 따른 cri.amount 단위의 시작페이지, 끝페이지를 구함
			var endPageNum = Math.ceil(pageNum / pageCount) * pageCount;// javascript 에서 pageNum / cri.amount 결과는 그냥 0.1 
			var startPageNum = endPageNum - (pageCount-1);
			var lastPageNum = Math.ceil(totalCount / cri.amount	);
			
			var isNeedFirst = pageNum > 5;
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
				var active = (pageNum == i ? "active" : "");
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
			
			$("#clientPageNation").html(str);
		}
		
		/* 거래처 선택 모달의 페이지네이션에서 번호 클릭시 다시 그리는 함수 */
		$("#clientPageNation").on("click", "li a", function(e){
			e.preventDefault(); // 번호를 눌러도 페이지가 이동하지 않도록 a태그 기능 무력화
			pageNum = $(this).attr("href");
			
			drawItem({pageNum : pageNum});
		});
		
		return Plguin;
		
	})();
	const item = new Item('table', [
		{column: '품목', name: 'item_no', class:'form-control insert', 'data-bs-toggle':"modal", 'data-bs-target':"#addUserModal", autocomplete:"off", readonly: "readonly"},
		{column: '수량', name: 'qty', class:'form-control'},
		{column: '창고', name: 'ware_code', class:'form-control', 'data-bs-toggle':"modal", 'data-bs-target':"#searchInvenModal", readonly: "readonly"},
		{column: '구역', name: 'area_code', class:'form-control', readonly: "readonly"},
		{column: '렉', name: 'rack_code', class:'form-control', readonly: "readonly"},
		{column: '셀', name: 'cell_code', class:'form-control', readonly: "readonly"},
	]);
	// 저장
	function saveData() {
		const trs = Array.from(document.querySelectorAll('.table-item tr')).slice(1),
		columns = item.getColumns(),
		member_no = document.querySelector('#member_no').value;
		lists = [];
		trs.forEach((value, index) => {
			let obj = {};
			Array.from(value.querySelectorAll('.form-control')).forEach((value, index) => {
				obj[columns[index].name] = value.name === 'qty'? value.value : value.dataset.value;
			});
			lists.push(obj);
		});
		fetch('http://localhost:8080/warehouse/init/save', {method: 'post', headers: {'Content-Type': 'application/json'}, body: JSON.stringify({member_no: member_no, detail: lists})});
		window.location.reload();
	}
</script>
