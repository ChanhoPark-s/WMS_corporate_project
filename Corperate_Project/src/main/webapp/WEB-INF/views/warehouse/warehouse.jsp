<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- top.jsp -->
<%@include file="../common/top.jsp" %>

        <div class="card">
          <div class="card-body">
            <div class="d-flex gap-1 mb-4 flex-wrap">
              <div class="d-flex gap-1 me-auto flex-wrap">
                
              </div>
              <form>
                <input type="text" class="form-control" placeholder="Search user">
              </form>
            </div>
            <div class="table-responsive my-1">
              <table class="table align-middle">
                <thead>
                  <tr>
                    <th scope="col">입력번호</th>
                    <th scope="col">로트번호</th>
                    <th scope="col">창고번호</th>
                    <th scope="col">구역번호</th>
                    <th scope="col">렉번호</th>
                    <th scope="col">셀번호</th>
                    <th scope="col">품목번호</th>
                    <th scope="col">재고수량</th>
                    <th scope="col">판매예정수량</th>
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
                        <img width="100px" height="100px" src="${pageContext.request.contextPath }/resources/assets/img/user/${member.fileName }" >
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
                      	<span class="badge bg-light text-muted">${member.dep_name }</span>
                      </div>
                    </td>
                    <td>
                      <div class="d-flex align-items-center gap-3">
                        <span class="badge bg-dark">${member.rank_name }</span>
                      </div>
                    </td>
                    <td>
                      <div class="d-flex align-items-center gap-3">
                        ${member.reg_date }
                      </div>
                    </td>
					<td>
						<div class="btn-group btn-group-sm" role="group">
							<button type="button" class="btn btn-light d-flex editDepartmentBtn update" data-bs-toggle="modal" data-bs-target="#addUserModal" data-no="${member.no }">
								<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
									fill="none" viewBox="0 0 24 24" stroke="currentColor"
									aria-hidden="true">
                           <path stroke-linecap="round"
										stroke-linejoin="round" stroke-width="2"
										d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                         </svg>
							</button>
							<button type="button" class="btn btn-light d-flex text-danger delete" data-bs-toggle="modal" data-bs-target="#deleteUserModal" data-no="${member.no }">
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

<!-- Modal 코드 넣을 위치 -->



<!-- bottom.jsp -->
<%@include file="../common/bottom.jsp" %>
