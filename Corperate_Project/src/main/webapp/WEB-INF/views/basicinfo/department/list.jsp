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
				<button class="btn btn-light d-inline-flex align-items-center gap-1" onclick="selectDelete()"><i class="fa-regular fa-trash-can fa-1.5x"></i></button>
			</div>
			<div class="search">
			<form name="search" action="/basicinfo/department/list" id="search">
			<table>
			<tr>
				<td>
					<select id="whatColumn" name="whatColumn" class="form-select" style="width: 200px;">
	                  <%
	                  String[] search = {"code", "name"};
	                  String[] cate = {"부서코드", "부서명"};
	                  %>
	                  <c:set value="<%=search %>" var="s"></c:set>
	                  <c:set value="<%=cate %>" var="c"></c:set>
	                  <option value="">검색 선택</option>
	                  	<c:forEach begin="0" end="${fn:length(s)-1 }" var="i">
	                  		<option value="${s[i] }"<c:if test="${searchvo.whatColumn== s[i] }">selected</c:if>>${c[i] }</option>
	                  	</c:forEach>
	              </select>
				</td>
				<td>
					<input type="text"  name="keyword" id="keyword" class="form-control" value=<c:if test="${searchvo.keyword=='null' }">""</c:if><c:if test="${searchvo.keyword!='null' }">"${searchvo.keyword }"</c:if>  placeholder="입력" style="width: 200px; height: 38px;">
				</td>
				<td>
					<i class="fa-solid fa-magnifying-glass btn_search" id="searchIcon" onclick="searchForm()"></i>
				</td>
			</tr>	
			</table>
			</form>
			</div>
		</div>
		<div class="table-responsive my-1">
		   <form name="f" action="/basicinfo/department/selectDelete" method="post">
			<table class="table align-middle">
				<thead>
					<tr>
						<th scope="col">
							<div>
								<input class="form-check-input" type="checkbox" id="allselect" name="allselect" onclick="allSelect()">
							</div>
						</th>
						<th scope="col">번호</th>
						<th scope="col">부서코드</th>
						<th scope="col">부서명</th>
						<th scope="col">기능</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${voList}">
						<tr class="dept-${vo.no }">
							<td><input class="form-check-input" type="checkbox" id="rowcheck" name="rowcheck" value="${vo.no }"></td>
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
		  </form>
		</div>
            <div align="center">
				${pageInfo.pagingHtml}
			</div>
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
   
	/* 체크박스 */
	function allSelect(){
		var ac = document.f.allselect;
		var rc = document.f.rowcheck;

		if (ac.checked) {
				for (var i = 0; i < rc.length; i++) {
					rc[i].checked = true;
				}
			}
		else {
				for (var i = 0; i < rc.length; i++) {
					rc[i].checked = false;
				}
			}
		}
	function selectDelete(){
		
		x=false;
		var rc = document.f.rowcheck;
		
		for(var i=0;i<rc.length;i++){
			if(rc[i].checked==true){
				x=true;
			}
		}
		if(!x){
			alert("체크박스를 선택하세요");
			return;
		}
		if(confirm("삭제하시겠습니까?")){
			f.submit();
		}

	}
</script>