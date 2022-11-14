<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../common/top.jsp"/>

<head>
  <title>발주서</title>
</head>
	
      	<!-- 
        <nav aria-label="breadcrumb" id="main-breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">User</a></li>
            <li class="breadcrumb-item active" aria-current="page">User list</li>
          </ol>
        </nav>
 		-->
        <div class="card">
          <div class="card-body">
            <div class="d-flex gap-1 mb-4 flex-wrap">
              <div class="d-flex gap-1 me-auto flex-wrap ">
                <form>
                <input type="text" class="form-control" placeholder="발주서 검색">
                
              	</form>
              </div>
              <button class="btn btn-primary d-inline-flex align-items-center gap-1 insert" data-bs-toggle="modal" data-bs-target="#addUserModal" >
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd" />
                  </svg>
                  발주추가
                </button>
                <button class="btn btn-light d-inline-flex align-items-center gap-1">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd" d="M3 17a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM6.293 6.707a1 1 0 010-1.414l3-3a1 1 0 011.414 0l3 3a1 1 0 01-1.414 1.414L11 5.414V13a1 1 0 11-2 0V5.414L7.707 6.707a1 1 0 01-1.414 0z" clip-rule="evenodd" />
                  </svg>
                  인쇄
                </button>
                <div class="dropdown">
                  <button class="btn btn-light d-inline-flex align-items-center gap-1 dropdown-toggle no-caret" type="button" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                      <path fill-rule="evenodd" d="M3 3a1 1 0 011-1h12a1 1 0 011 1v3a1 1 0 01-.293.707L12 11.414V15a1 1 0 01-.293.707l-2 2A1 1 0 018 17v-5.586L3.293 6.707A1 1 0 013 6V3z" clip-rule="evenodd" />
                    </svg>
                    삭제
                  </button>
                  <form class="dropdown-menu p-3" style="min-width: 250px">
                    <h6 class="dropdown-header p-0">Filter options</h6>
                    <hr>
                    <div class="vstack gap-3">
                      <div>
                        <label class="form-label">Role:</label>
                        <select class="dselect form-select" data-dselect-clearable="true">
                          <option value="">Choose role</option>
                          <option value="administrator">Administrator</option>
                          <option value="analyst">Analyst</option>
                          <option value="developer">Developer</option>
                          <option value="support">Support</option>
                          <option value="trial">Trial</option>
                        </select>
                      </div>
                      <div>
                        <label class="form-label">Two Step Verification:</label>
                        <select class="dselect form-select" data-dselect-clearable="true">
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
            <div class="table-responsive my-1">
              <table class="table align-middle">
                <thead>
                  <tr>
                    <th scope="col">
                      <div>
                        <input class="form-check-input" type="checkbox" value="">
                      </div>
                    </th>
                    <th scope="col">발주번호</th>
                    <th scope="col">담당자</th>
                    <th scope="col">품목</th>
                    <th scope="col" nowrap>등록일자</th>
                    <th scope="col" nowrap>납기일자</th>
                    <th scope="col">상태</th>
                    <th scope="col">기능</th>
                  </tr>
                </thead>
                <tbody>
                <!-- lists -->
                <c:forEach var="list" items="${lists}">
                  <tr>
                    <td>
                      <div>
                        <input class="form-check-input" type="checkbox" value="">
                      </div>
                    </td>
                    <td>
                      <div class="d-flex align-items-center gap-3">
                        <div class="d-flex flex-column">
                          ${list.no }
                        </div>
                      </div>
                    </td>
                    <td>${list.client_no }</td>
                    <td><span class="badge bg-light text-muted">${list.order_no }</span></td>
                    <td>${list.day }</td>
                    <td>${list.delivery_date }</td>
                    <td nowrap>
                    <c:choose>
                    <c:when test="${list.status eq 0 }">발주중</c:when>
                    <c:when test="${list.status eq 1 }">발주완료</c:when>
                    <c:when test="${list.status eq 2 }">취소</c:when>
                    <c:otherwise>오류</c:otherwise>
                    </c:choose>
                    </td>
                    <td>
                      <div class="btn-group btn-group-sm" role="group">
                        <button type="button" class="btn btn-light d-flex update" data-bs-toggle="modal" data-bs-target="#addUserModal"><svg width="17" height="17" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                          </svg></button>
                          <a href="delete.ps?no=${list.no }">
                        <button type="button" class="btn btn-light d-flex text-danger"><svg width="17" height="17" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                          </svg></button>
                          </a>
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
        <jsp:include page="./modal.jsp"/>
        <jsp:include page="./modal2.jsp"/>
        <!-- end modal -->
        

	<!-- Main footer -->
   	<jsp:include page="../common/bottom.jsp"/>
    <!-- /Main footer -->


