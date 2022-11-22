<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- top.jsp -->
<%@include file="../../common/top.jsp"%>

<div class="card">
	<div class="card-body">
            <div class="d-flex gap-1 mb-4 flex-wrap">
              <div class="d-flex gap-1 me-auto flex-wrap">
                <button class="btn btn-primary d-inline-flex align-items-center gap-1 insert" data-bs-toggle="modal" data-bs-target="#addUserModal">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd" />
                  </svg>
                  직급등록
                </button>
                <button class="btn btn-light d-inline-flex align-items-center gap-1" onclick="selectDelete()"><i class="fa-regular fa-trash-can"></i></button>
              </div>
			<div class="search">
			<form name="search" action="/basicinfo/rank/list" id="search">
			<table>
			<tr>
				<td>
					<select id="whatColumn" name="whatColumn" class="form-select" style="width: 200px;">
	                  <%
	                  String[] search = {"code", "name"};
	                  String[] cate = {"직급코드", "직급명"};
	                  %>
	                  <c:set value="<%=search %>" var="s"></c:set>
	                  <c:set value="<%=cate %>" var="c"></c:set>
	                  <option>검색 선택</option>
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
		 <form name="f" action="/basicinfo/rank/selectDelete" method="post">
			<table class="table align-middle">
				<thead>
					<tr>
						<th scope="col">
							<div>
								<input class="form-check-input" type="checkbox" id="allselect" name="allselect" onclick="allSelect()">
							</div>
						</th>
						<th scope="col">번호</th>
						<th scope="col">직급코드</th>
						<th scope="col">직급명</th>
						<th scope="col">기능</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${ranks}">
						<tr class="rank-${vo.no }">
							<td>
								<div>
									<input class="form-check-input" type="checkbox"  id="rowcheck" name="rowcheck" value="${vo.no }">
								</div>
							</td>
							<td>${vo.no}</td>
							<td>${vo.code}</td>
							<td>${vo.name}</td>
							<td>
								<div class="btn-group btn-group-sm" role="group">
									<button type="button" class="btn btn-light d-flex update" data-bs-toggle="modal" data-bs-target="#addUserModal" data-no="${vo.no }">
										<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
											fill="none" viewBox="0 0 24 24" stroke="currentColor"
											aria-hidden="true">
	                            				<path stroke-linecap="round"
												stroke-linejoin="round" stroke-width="2"
												d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
			                          </svg>
									</button>
									<button type="button" class="btn btn-light d-flex text-danger delete" data-bs-toggle="modal" data-bs-target="#deleteRankModal" data-no="${vo.no }">
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

        <!-- Add user modal -->
        <div class="modal fade" id="addUserModal" tabindex="-1">
          <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
              <div class="modal-header border-0">
                <h5 class="modal-title">Add user</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form class="needs-validation" novalidate id="rankForm" method="post" action="">
                  <div class="mb-3">
                    <label for="userFullname" class="form-label">직급코드</label>
                    <input type="text" name="code" class="form-control" id="userFullname" required autofocus>
                    <div class="invalid-feedback">직급코드를 입력하세요.</div>
                  </div>
                  <div class="mb-3">
                    <label for="userEmail" class="form-label">직급이름</label>
                    <input type="text" name="name" class="form-control" id="userEmail" required>
                    <div class="invalid-feedback">직급이름을 입력하세요.</div>
                  </div>
                  	<input type="hidden" name="pageNumber" id="pageNumber" value="${pageInfo.pageNumber }">
					<!-- 수정했을때도 가게 만들기위해 -->
					<input type="hidden" name="keyword" id="keyword2" value="${searchvo.keyword }">
					<input type="hidden" name="whatColumn" id="whatColumn" value="${searchvo.whatColumn }">
                </form>
              </div>
              <div class="modal-footer border-0">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
                <button type="submit" form="rankForm" class="btn btn-primary px-5">저장</button>
              </div>
            </div>
          </div>
        </div>
        
                <!-- 삭제모달 -->
        <div class="modal fade" id="deleteRankModal" tabindex="-1">
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
	              <form name="delete_rank">
	              	<button type="submit" class="btn btn-primary px-5">삭제</button>
	              </form>
              </div>
            </div>
          </div>
        </div>
        <!-- 삭제모달 끝 -->
<script type="text/javascript">

	$(function(){
		/* 왼쪽 카테고리창이 해당화면에 맞게 펼쳐지게 하는 코드 */
		document.getElementById('basicinfo').click();
	});

	(function() {
		
		const title = document.querySelector('.modal-title');
		const body = document.querySelector('body');
		const form_control = document.querySelectorAll('.form-control');
		
		// 직급 등록
		document.querySelector('.insert').addEventListener('click', event => {
			title.innerHTML = '직급등록';
			rankForm.classList.remove('was-validated');
			
			Array.from(form_control, elem => {
				elem.value = '';
				elem.classList.remove('is-invalid');
			});
			
			rankForm.action = 'insert';
		});
		
		// 직급 수정
		document.querySelectorAll('.update').forEach(elem => {
			elem.addEventListener('click', event => {
				rankForm.classList.remove('was-validated');
				
				Array.from(form_control, elem => {
					elem.value = '';
					elem.classList.remove('is-invalid');
				});
				
				let target = event.target;
				target = target.nodeName == 'BUTTON' ? target : target.nodeName == 'svg' ? target.parentElement : target.parentElement.parentElement;
				const no = target.dataset.no;
				
				const rankInfo = Array.from(document.querySelector('.rank-' + no).children);
				const [code, name] = rankInfo.slice(2, 4);
				
				rankForm.code.value = code.innerHTML;
				rankForm.name.value = name.innerHTML;
				
				if(!rankForm.no) {
					const input = document.createElement('input');
					input.type = 'hidden';
					input.name = 'no';
					rankForm.append(input);
				}
				rankForm.no.value = no;
				
				rankForm.action = 'update';
			});
		})
		
		// 직급 삭제
		document.querySelectorAll('.delete').forEach(elem => {
			elem.addEventListener('click', (event) => {
				
					let target = event.target;
					target = target.nodeName == 'BUTTON' ? target : target.nodeName == 'svg' ? target.parentElement : target.parentElement.parentElement;
					const dataset = target.dataset;
					const no = dataset.no;
					
					delete_rank.action = 'delete/' + no;
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
	
    // 유효성 검사
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
<%@include file="../../common/bottom.jsp"%>
