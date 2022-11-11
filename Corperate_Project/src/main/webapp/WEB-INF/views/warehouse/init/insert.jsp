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
		<div class="table-responsive">
           <table class="table">
             <thead>
               <tr>
                 <th scope="col">품목코드</th>
                 <th scope="col">품목</th>
                 <th scope="col">수량</th>
                 <th scope="col">창고</th>
                 <th scope="col">구역</th>
                 <th scope="col">렉</th>
                 <th scope="col">셀</th>
               </tr>
             </thead>
             <tbody>
               <tr>
                 <td>
                 	<div class="mb-3">
			          <input type="text" name="item_code" class="form-control" id="userFullname">
			        </div>
                 </td>
                 <td>
                 	<div class="mb-3">
			          <input type="text" name="item_name" class="form-control insert" id="userFullname" data-bs-toggle="modal" data-bs-target="#addUserModal">
			        </div>
                 </td>
                 <td>
                 	<input type="text" name="qty" class="form-control" id="userFullname">
                 </td>
                 <td>
                 	<input type="text" name="ware_code" class="form-control" id="userFullname">
                 </td>
                 <td></td>
                 <td></td>
                 <td></td>
               </tr>
             </tbody>
           </table>
         </div>
	</div>
</div>

<!-- Modal 코드 넣을 위치 -->

<!-- 창고검색 -->
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

<!-- bottom.jsp -->
<%@include file="/WEB-INF/views/common/bottom.jsp" %>

<script>

	async function getItemList() {
		const data = await fetch('http://localhost:8080/warehouse/init/get', {method: 'post'});
		const json = await data.json();
		return json;
	};

	(function() {
		Array.from(document.querySelectorAll('.insert')).forEach(elem => {
			elem.addEventListener('click', async (event) => {
				
				const target = event.target;
				
				const body = document.querySelector('.item-table tbody');
				body.innerHTML = "";
				const items = await getItemList();
				
				items.forEach((value, index) => {
					let {no, code, name} = value;
					
					let tr = document.createElement('tr');
					
					let td1 = document.createElement('td');
					td1.innerHTML = no;
					tr.append(td1);
					let td2 = document.createElement('td');
					td2.innerHTML = code;
					tr.append(td2);
					let td3 = document.createElement('td');
					td3.innerHTML = name;
					tr.append(td3);
					
					body.append(tr);
					tr.classList.add('data-bs-dismiss="modal"');
					
					tr.addEventListener('click', event => {
						const modal_target = event.target.parentElement;
						target.value = modal_target.children['2'].innerHTML;
						target.previousSibling.value = modal_target.children['1'].innerHTML;
					});
				});
			})
		})
	})();
</script>
