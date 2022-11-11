<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- top.jsp -->
<%@include file="../../common/top.jsp"%>

<div class="card">
	<div class="card-body">
		<div class="d-flex gap-1 mb-4 flex-wrap">
		
			<div class="d-flex gap-1 me-auto flex-wrap">
				<button id="addDepartmentBtn" class="btn btn-primary d-inline-flex align-items-center gap-1 insert" data-bs-toggle="modal" data-bs-target="#addDeptModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd" />
                  </svg>
					부서추가
				</button>
				<button class="btn btn-light d-inline-flex align-items-center gap-1">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M3 17a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM6.293 6.707a1 1 0 010-1.414l3-3a1 1 0 011.414 0l3 3a1 1 0 01-1.414 1.414L11 5.414V13a1 1 0 11-2 0V5.414L7.707 6.707a1 1 0 01-1.414 0z"
							clip-rule="evenodd" />
                  </svg>
					Export
				</button>
				<div class="dropdown">
					<button
						class="btn btn-light d-inline-flex align-items-center gap-1 dropdown-toggle no-caret"
						type="button" data-bs-toggle="dropdown"
						data-bs-auto-close="outside" aria-expanded="false">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
							fill="currentColor" aria-hidden="true">
                      <path fill-rule="evenodd"
								d="M3 3a1 1 0 011-1h12a1 1 0 011 1v3a1 1 0 01-.293.707L12 11.414V15a1 1 0 01-.293.707l-2 2A1 1 0 018 17v-5.586L3.293 6.707A1 1 0 013 6V3z"
								clip-rule="evenodd" />
                    </svg>
						Filter
					</button>
					<form class="dropdown-menu p-3" style="min-width: 250px">
						<h6 class="dropdown-header p-0">Filter options</h6>
						<hr>
						<div class="vstack gap-3">
							<div>
								<label class="form-label">Role:</label> <select
									class="dselect form-select" data-dselect-clearable="true">
									<option value="">Choose role</option>
									<option value="administrator">Administrator</option>
									<option value="analyst">Analyst</option>
									<option value="developer">Developer</option>
									<option value="support">Support</option>
									<option value="trial">Trial</option>
								</select>
							</div>
							<div>
								<label class="form-label">Two Step Verification:</label> <select
									class="dselect form-select" data-dselect-clearable="true">
									<option value="">Select option</option>
									<option value="enabled">Enabled</option>
									<option value="disabled">Disabled</option>
								</select>
							</div>
							<button class="btn btn-primary" type="button">Apply</button>
						</div>
					</form>
				</div>
			</div>
			
			<form>
				<input type="text" class="form-control" placeholder="Search user">
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
						<th scope="col">번호</th>
						<th scope="col">부서코드</th>
						<th scope="col">부서명</th>
						<th scope="col">Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${voList}">
						<tr class="dept-${vo.no }">
							<td>
								<div>
									<input class="form-check-input" type="checkbox" value="">
								</div>
							</td>
							<td>${vo.no}	
							<td>${vo.code}</td>
							<td>${vo.name}</td>
							<td>
								<div class="btn-group btn-group-sm" role="group">
									<button type="button" class="btn btn-light d-flex editDepartmentBtn update" data-bs-toggle="modal" data-bs-target="#addDeptModal" data-no=${vo.no }>
										<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
											fill="none" viewBox="0 0 24 24" stroke="currentColor"
											aria-hidden="true">
	                            <path stroke-linecap="round"
												stroke-linejoin="round" stroke-width="2"
												d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
	                          </svg>
									</button>
									<button type="button" class="btn btn-light d-flex text-danger delete" data-bs-toggle="modal" data-bs-target="#deleteDeptModal" data-no=${vo.no }>
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

<!-- 부서등록/수정 Modal 코드-->
<!-- <form action="/basicinfo/department/new" method="post"> -->
<div class="modal fade" id="addDeptModal" tabindex="-1">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 class="modal-title">부서등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<!-- form start -->
				<form class="needs-validation" novalidate id="modalForm" action="" method="post">
					<div class="mb-3">
						<label for="userFullname" class="form-label">부서코드</label> 
						<input type="text" name="code" id="code" class="form-control" required autofocus>
						<div class="invalid-feedback">User full name is required.</div>
					</div>
					<div class="mb-3">
						<label for="userEmail" class="form-label">부서명</label> 
						<input type="text" name="name" id="name" class="form-control" required>
						<div class="invalid-feedback">User email is required.</div>
					</div>
				</form>
				<!-- form end -->
			</div>
			<div class="modal-footer border-0">
				<button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
				<button type="submit" form="modalForm" class="btn btn-primary px-5">저장</button>
			</div>
		</div>
	</div>
</div>
        <!-- 삭제모달 -->
        <div class="modal fade" id="deleteDeptModal" tabindex="-1">
          <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
              <div class="modal-header border-0">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
		        <div class="col-md-7">
		            <h3 class="fw-black">정말 삭제하시겠습니까?</h3>
		            <div class="modal fade" id="exampleModalLg" tabindex="-1" aria-labelledby="exampleModalLgLabel" aria-hidden="true">
		              <div class="modal-dialog modal-lg">
		                <div class="modal-content">
		                  <div class="modal-header">
		                    <h5 class="modal-title h4" id="exampleModalLgLabel">Large modal</h5>
		                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		                  </div>
		                  <div class="modal-body">
		                    ...
		                  </div>
		                </div>
		              </div>
		            </div>
		          </div>
          		</div>
              <div class="modal-footer border-0">
	              <button type="button" class="btn btn-light delete" data-bs-dismiss="modal">취소</button>
	              <form name="delete_dept">
	              	<button type="submit" class="btn btn-primary px-5">삭제</button>
	              </form>
              </div>
            </div>
          </div>
        </div>
        <!-- 삭제모달 끝 -->
<!-- bottom.jsp -->
<%@include file="../../common/bottom.jsp"%>

<script type="text/javascript">

	$(function(){
		/* 왼쪽 카테고리창이 해당화면에 맞게 펼쳐지게 하는 코드 */
		document.getElementById('basicinfo').click();
	});



	(function() {
		
		const title = document.querySelector('.modal-title');
		const body = document.querySelector('body');
		
		// 부서 등록
		document.querySelector('.insert').addEventListener('click', event => {
			title.innerHTML = '부서등록';
			
			const form_control = document.querySelectorAll('.form-control');
			Array.from(form_control, elem => {
				elem.value = '';
			});
			
			modalForm.action = 'insert';
		});
		
		// 부서 수정
		document.querySelectorAll('.update').forEach(elem => {
			elem.addEventListener('click', event => {
				title.innerHTML = '부서수정';
				
				let target = event.target;
				target = target.nodeName == 'BUTTON' ? target : target.nodeName == 'svg' ? target.parentElement : target.parentElement.parentElement;
				const no = target.dataset.no;
				
				const rankInfo = Array.from(document.querySelector('.dept-' + no).children);
				const [code, name] = rankInfo.slice(2, 4);
				
				modalForm.code.value = code.innerHTML;
				modalForm.name.value = name.innerHTML;
				
				if(!modalForm.no) {
					const input = document.createElement('input');
					input.type = 'hidden';
					input.name = 'no';
					modalForm.append(input);
				}
				modalForm.no.value = no;
				
				modalForm.action = 'update';
			});
		})
		
		// 부서 삭제
		document.querySelectorAll('.delete').forEach(elem => {
			elem.addEventListener('click', (event) => {
				
					let target = event.target;
					target = target.nodeName == 'BUTTON' ? target : target.nodeName == 'svg' ? target.parentElement : target.parentElement.parentElement;
					const dataset = target.dataset;
					const no = dataset.no;
					
					delete_dept.action = 'delete/' + no;
			});
		});
		
	})();
</script>
