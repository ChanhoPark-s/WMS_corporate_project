<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!-- top.jsp -->
<%@include file="/WEB-INF/views/common/top.jsp" %>

        <div class="card">
          <div class="card-body">
            <div class="d-flex gap-1 mb-4 flex-wrap">
              <div class="d-flex gap-1 me-auto flex-wrap">
                <button class="btn btn-primary d-inline-flex align-items-center gap-1 insert" data-bs-toggle="modal" data-bs-target="#addUserModal">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd" />
                  </svg>
                  사원등록
                </button>
              </div>
              <form>
                <input type="text" class="form-control" placeholder="Search user">
              </form>
            </div>
            <div class="table-responsive my-1">
              <table class="table align-middle">
                <thead>
                  <tr>
                    <th scope="col">번호</th>
                    <th scope="col">프로필사진</th>
                    <th scope="col">이름</th>
                    <th scope="col">아이디</th>
                    <th scope="col">이메일</th>
                    <th scope="col">부서</th>
                    <th scope="col">직급</th>
                    <th scope="col">최초등록일</th>
                    <th scope="col">수정/삭제</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.lists }" var="member">
                	<tr>
                    <td>
                      <div class="d-flex align-items-center gap-3">
                        ${member.no }
                      </div>
                    </td>
                    <td>
                      <div class="d-flex align-items-center gap-3">
                        <img width="70px" height="100px" src="${pageContext.request.contextPath }/assets/files/member/${member.fileName }" >
                      </div>
                    </td>
                    <td>
                      <div class="d-flex align-items-center gap-3">
                        ${member.name }
                      </div>
                    </td>
                    <td>
                      <div class="d-flex align-items-center gap-3">
                        ${member.id }
                      </div>
                    </td>
                    <td>
                      <div class="d-flex align-items-center gap-3">
                        ${member.email }
                      </div>
                    </td>
                    <td>
                      <div class="d-flex align-items-center gap-3">
                        ${member.dep_name }
                      </div>
                    </td>
                    <td>
                      <div class="d-flex align-items-center gap-3">
                        ${member.rank_name }
                      </div>
                    </td>
                    <td>
                      <div class="d-flex align-items-center gap-3">
                        등록일
                      </div>
                    </td>
                    <td>
                      <div class="d-flex align-items-center gap-3">
                        <span class="update" data-bs-toggle="modal" data-bs-target="#addUserModal" data-no="${member.no }">수정</span>
                        /
                        <span class="delete" data-bs-toggle="modal" data-bs-target="#deleteUserModal" data-no="${member.no }">삭제</span>
                      </div>
                    </td>
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

        <!-- Add user modal -->
        <div class="modal fade" id="addUserModal" tabindex="-1">
          <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
              <div class="modal-header border-0">
                <h5 class="modal-title">Add user</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form class="needs-validation" novalidate id="taskForm" enctype="multipart/form-data" method="post" action="">
                  <div class="mb-3">
                    <label for="userFullname" class="form-label">이름</label>
                    <input type="text" name="name" class="form-control" id="userFullname" required autofocus>
                    <div class="invalid-feedback">User full name is required.</div>
                  </div>
                  <div class="mb-3">
                    <label for="userEmail" class="form-label">아이디</label>
                    <input type="text" name="id" class="form-control" id="userEmail" required>
                    <div class="invalid-feedback">User id is required.</div>
                  </div>
                  <div class="mb-3">
                    <label for="userEmail" class="form-label">비밀번호</label>
                    <input type="password" name="pw" class="form-control" id="userEmail" required>
                    <div class="invalid-feedback">User password is required.</div>
                  </div>
                  <div class="mb-3">
                    <label for="userEmail" class="form-label">이메일</label>
                    <input type="email" name="email" class="form-control" id="userEmail" required>
                    <div class="invalid-feedback">User email is required.</div>
                  </div>
                  <div class="mb-3">
                    <label for="userEmail" class="form-label">부서</label>
					<select class="form-select" id="inputGroupSelect01" name="dep_no">
	                  <option selected="">선택</option>
						<c:forEach items="${deptList }" var="dept">
							<option value="${dept.no }">${dept.name }</option>
						</c:forEach>
	                </select>
                  </div>
                  <div class="mb-3">
                    <label for="userEmail" class="form-label">직급</label>
					<select class="form-select" id="inputGroupSelect01" name="rank_no">
	                  <option selected="">선택</option>
						<c:forEach items="${rankList }" var="rank">
	                  		<option value="${rank.no }">${rank.name }</option>
						</c:forEach>
	                </select>
                  </div>
                  <div class="mb-3">
                    <label for="userAvatar" class="form-label">프로필사진</label>
                    <input class="form-control" type="file" name="image" id="userAvatar" required style="max-width:250px">
                    <div class="invalid-feedback">User avatar is required.</div>
                  </div>
                </form>
              </div>
              <div class="modal-footer border-0">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" form="taskForm" class="btn btn-primary px-5">Save</button>
              </div>
            </div>
          </div>
        </div>
        
        <!-- 삭제모달 -->
        <div class="modal fade" id="deleteUserModal" tabindex="-1">
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
	              <form method="get" action="" name="delete_from">
	              	<button type="submit" class="btn btn-primary px-5">삭제</button>
	              </form>
              </div>
            </div>
          </div>
        </div>
        <!-- 삭제모달 끝 -->
  <script>
    // Enable dropdown-select on all '.dselect'

    $(function(){
		/* 왼쪽 카테고리창이 해당화면에 맞게 펼쳐지게 하는 코드 */
		document.getElementById('basicinfo').click();
	});
    
    (function() {
   		
    	const title = document.querySelector('.modal-title');
    	
    	// 사원등록
    	document.querySelector('.insert').addEventListener('click', event => {
    		title.innerHTML = '사원등록';
    		
    		const form_control = document.querySelectorAll('.form-control');
    		Array.from(form_control, elem => {
    			elem.value = '';
    		});
    		
    		const form_select = document.querySelectorAll('.form-select');
			Array.from(form_select, elem => {
				elem.options[0].selected = true;  
			});
			
			taskForm.action = 'insert';
    	});
    	
    	// 사원 업데이트
    	const update = document.querySelectorAll('.update');
    	
    	update.forEach((elem)=> {
    		elem.addEventListener('click', async (event) => {
        		title.innerHTML = '사원수정';
        		
        		const no = event.target.dataset.no;
        		const member = await getMemberInfo(no);
        		
        		taskForm.name.value = member.name;
        		taskForm.id.value = member.id;
        		taskForm.pw.value = member.pw;
        		taskForm.email.value = member.email;
        		
        		Array.from(taskForm.dep_no.options, option => {
        			if(option.value == member.dep_no) option.selected = true;
        		});
        		
        		Array.from(taskForm.rank_no.options, option => {
        			if(option.value == member.rank_no) option.selected = true;
        		});
        		
        		const input = document.createElement('input');
        		input.type = 'hidden';
        		input.name = 'no';
        		input.value = no;
        		taskForm.append(input);
        		
        		taskForm.action = 'update';
        	});
    	})
    	
    	async function getMemberInfo(no) {
    		const data = await fetch('http://localhost:8080/basicinfo/member/get/' + no);
    		const json = await data.json();
    		return json;
    	}
    	
    	// 사원 삭제 (delete_from에 hidden으로 삭제할 사원의 번호를 넣어줌)
    	const del = document.querySelectorAll('.delete');
    	
    	del.forEach((elem)=> {
    		elem.addEventListener('click', event => {
    			
    			const no = event.target.dataset.no;		
        		delete_from.action = 'delete/' + no;
    		});
    	});
    })();
    
    for (const el of document.querySelectorAll('.dselect')) {
      dselect(el)
    }

    // Example starter JavaScript for disabling form submissions if there are invalid fields
    void(function() {
      document.querySelectorAll('.needs-validation').forEach(form => {
        form.addEventListener('submit', event => {
          if (!form.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
          }

          form.classList.add('was-validated')
        })
      })
    })()
  </script>
  
<!-- bottom.jsp -->
<%@include file="/WEB-INF/views/common/bottom.jsp" %>