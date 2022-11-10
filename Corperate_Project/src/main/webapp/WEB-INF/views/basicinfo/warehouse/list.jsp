<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- top.jsp -->
<%@include file="../../common/top.jsp"%>

<!-- Main body -->
      <div id="main-body">

        <div class="row g-4">
          <div class="col-md-4 col-lg-3 d-none d-md-block">
            <div class="card h-100">
              <div class="card-body navbar-light">
                <!-- 좌측영역에넣을테이블 -->
<div class="col-md-6">
            <h3 class="fw-black">창고정보 관리</h3>
            <p>창고, 구역, 랙, 셀 목록</p>
            <ul class="nav flex-column">
              
              <c:forEach items="${warehouseLists }" var="warehouseLists" varStatus="warehousestatus">
              <li class="nav-item">
                <a href="#warehouse-collapse${warehousestatus.count}-${warehouseLists.no }" class="nav-link px-0 dropdown-toggle d-flex align-items-center gap-3" data-bs-toggle="collapse" role="button" aria-expanded="true" aria-controls="warehouse-collapse${warehousestatus.count}-${warehouseLists.no }">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z" />
                  </svg>
                  ${warehouseLists.name }
                </a>
                <div class="ms-5 collapse show" id="warehouse-collapse${warehousestatus.count}-${warehouseLists.no }">
                  <ul class="nav flex-column">
                  
                  <c:forEach items="${areaLists }" var="areaLists" varStatus="areastatus">
                  <c:if test="${warehouseLists.no eq areaLists.ware_no }">
                    <li class="nav-item">
                      <a href="#area-collapse${areastatus.count}-${areaLists.ware_no }" class="nav-link px-0 dropdown-toggle d-flex align-items-center gap-3" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="area-collapse${areastatus.count}-${areaLists.ware_no }">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z" />
                        </svg>
                        ${areaLists.name }
                      </a>
                      <div class="ms-5 collapse" id="area-collapse${areastatus.count}-${areaLists.ware_no }">
                        <ul class="nav flex-column">
                          
                          <c:forEach items="${rackLists }" var="rackLists" varStatus="rackstatus">
                          <c:if test="${areaLists.no eq rackLists.area_no }">
                          <li class="nav-item">
		                      <a href="#rack-collapse${rackstatus.count}-${rackLists.area_no }" class="nav-link px-0 dropdown-toggle d-flex align-items-center gap-3" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="rack-collapse${rackstatus.count}-${rackLists.area_no }">
		                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
		                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z" />
		                        </svg>
		                        ${rackLists.name }
		                      </a>
                            
                            <!-- 셀 -->
                            <div class="ms-5 collapse" id="rack-collapse${rackstatus.count}-${rackLists.area_no }">
		                        <ul class="nav flex-column">
		                          
		                          <c:forEach items="${cellLists }" var="cellLists" varStatus="cellstatus">
		                          <c:if test="${rackLists.no eq cellLists.rack_no }">
		                          <li class="nav-item">
		                            <a href="javascript:void(0)" class="nav-link px-0 d-flex align-items-center gap-3">
		                              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
		                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z" />
		                              </svg>
		                              ${cellLists.name }
		                            </a>
		                          </li>
		                          </c:if>
		                          </c:forEach> <!-- cell -->
		                          
		                          
		                        </ul>
		                      </div>
		                      <!-- 셀 -->
                          </li>
                          </c:if>
                          </c:forEach> <!-- rack -->
                          
                          
                        </ul>
                      </div>
                    </li>
                    </c:if>
                    </c:forEach> <!-- area -->
                    
                  </ul>
                </div>
              </li>
              </c:forEach> <!-- warehouse -->
              
            </ul>
          </div>
<!-- 좌측영역에넣을테이블 -->
              </div>
            </div>
          </div>
          <div class="col-md-8 col-lg-9">
            <div class="card h-100">
              <div class="card-body tab-content">
                <!-- 우측영역에넣을테이블 -->
<div class="card">
	<div class="card-body">
	
		<!-- 우측테이블상단의 버튼/검색 -->
		<div class="d-flex gap-1 mb-4 flex-wrap">
			<div class="d-flex gap-1 me-auto flex-wrap">
				<button
					class="btn btn-primary d-inline-flex align-items-center gap-1"
					data-bs-toggle="modal" data-bs-target="#addUserModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd" />
                  </svg>
					창고 등록
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
		<!-- 우측테이블상단의 버튼/검색끝 -->
		
		
		<div class="table-responsive my-1">
		<form name="form">
			<table class="table align-middle">
				<thead>
					<tr>
						<th scope="col">
							<div>
								<input class="form-check-input" type="checkbox" value="">
							</div>
						</th>
						<th scope="col">일련번호</th>
						<th scope="col">창고코드</th>
						<th scope="col">창고명</th>
						<th scope="col">Actions</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach items="${warehouseLists }" var="warehouseLists">
					<tr>
						<td>
							<div>
								<input class="form-check-input" type="checkbox" value="">
							</div>
						</td>
						<td>
							${warehouseLists.no }
						</td>
						<td>${warehouseLists.code }</td>
						<td>${warehouseLists.name }</td>
						<td>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                          </svg>
								</button>
								<button type="button" class="btn btn-light d-flex text-danger">
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
<!-- 우측영역에넣을테이블 -->
                
                
                
                
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- /Main body -->

<!-- 테스트중메인바디 -->
<%-- <div id="main-body">
        

        <div class="row g-4">
          <div class="col-md-4 col-lg-3 d-none d-md-block">
            <div class="card h-100">
              <div class="card-body navbar-light">
                <div class="navbar-nav nav">
                  <a data-bs-toggle="pill" class="nav-link d-flex align-items-center gap-3 active" href="#profile" role="tab" aria-selected="true">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                    </svg>
                    Profile
                  </a>
                  <a data-bs-toggle="pill" class="nav-link d-flex align-items-center gap-3" href="#account" role="tab" aria-selected="false">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                    </svg>
                    Account
                  </a>
                  
                  <!-- 좌측의 토글시작 -->
            <!-- 좌측의 토글시작 -->
            <ul class="nav flex-column">
              <li class="nav-item">
                <a href="#projects-collapse" class="nav-link px-0 dropdown-toggle d-flex align-items-center gap-3" data-bs-toggle="collapse" role="button" aria-expanded="true" aria-controls="projects-collapse" aria-selected="false" data-bs-toggle="pill">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z" />
                  </svg>
                  Projects
                </a>
              
                <div class="ms-5 collapse show" id="projects-collapse">
                  <ul class="nav flex-column">

                    <li class="nav-item">
                      <a href="#personal-collapse" class="nav-link px-0 dropdown-toggle d-flex align-items-center gap-3" data-bs-toggle="collapse" role="button" aria-expanded="true" aria-controls="personal-collapse">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z" />
                        </svg>
                        Personal
                      </a>
                      <div class="ms-5 collapse" id="personal-collapse">
                        <ul class="nav flex-column">
                          <li class="nav-item">
                            <a href="javascript:void(0)" class="nav-link px-0 d-flex align-items-center gap-3">
                              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z" />
                              </svg>
                              Angular
                            </a>
                          </li>
                          <li class="nav-item">
                            <a href="javascript:void(0)" class="nav-link px-0 d-flex align-items-center gap-3">
                              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z" />
                              </svg>
                              React
                            </a>
                          </li>
                          <li class="nav-item">
                            <a href="javascript:void(0)" class="nav-link px-0 d-flex align-items-center gap-3">
                              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z" />
                              </svg>
                              Vue
                            </a>
                          </li>
                          <li class="nav-item">
                            <a href="javascript:void(0)" class="nav-link px-0 d-flex align-items-center gap-3">
                              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z" />
                              </svg>
                              Svelte
                            </a>
                          </li>
                        </ul>
                      </div>
                    </li>
                  </ul>
                </div>
              </li>
            </ul>
            <!-- 좌측의 토글끝 -->
            <!-- 좌측의 토글끝 -->
            
                </div>
                
              </div>
              
            </div>
            
            
          </div>
          
          <!-- 상단이좌측 -->
          <!-- 하단이우측 -->
          
          <div class="col-md-8 col-lg-9">
            <div class="card h-100">
              
              <div class="card-body tab-content">
              
              <!-- 하단이1번내용물 -->
              <!-- 하단이1번내용물 -->
              <!-- 하단이1번내용물 -->
              <!-- 하단이1번내용물 -->
              <!-- 하단이1번내용물 -->
              <!-- 하단이1번내용물 -->
              <!-- 하단이1번내용물 -->
                <div class="tab-pane fade show active" id="profile" role="tabpanel">
                
                
                  <div class="card">
	<div class="card-body">
	
		<!-- 우측테이블상단의 버튼/검색 -->
		<div class="d-flex gap-1 mb-4 flex-wrap">
			<div class="d-flex gap-1 me-auto flex-wrap">
				<button
					class="btn btn-primary d-inline-flex align-items-center gap-1"
					data-bs-toggle="modal" data-bs-target="#addUserModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd" />
                  </svg>
					창고 등록
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
		<!-- 우측테이블상단의 버튼/검색끝 -->
		
		
		<div class="table-responsive my-1">
		<form name="form">
			<table class="table align-middle">
				<thead>
					<tr>
						<th scope="col">
							<div>
								<input class="form-check-input" type="checkbox" value="">
							</div>
						</th>
						<th scope="col">일련번호</th>
						<th scope="col">창고코드</th>
						<th scope="col">창고명</th>
						<th scope="col">Actions</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach items="${warehouseLists }" var="warehouseLists">
					<tr>
						<td>
							<div>
								<input class="form-check-input" type="checkbox" value="">
							</div>
						</td>
						<td>
							${warehouseLists.no }
						</td>
						<td>${warehouseLists.code }</td>
						<td>${warehouseLists.name }</td>
						<td>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                          </svg>
								</button>
								<button type="button" class="btn btn-light d-flex text-danger">
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
                  
                  
                </div>
                <!-- 상단이1번내용물 -->
                <!-- 상단이1번내용물 -->
                <!-- 상단이1번내용물 -->
                <!-- 상단이1번내용물 -->
                <!-- 상단이1번내용물 -->
                <!-- 상단이1번내용물 -->
                
                
                <!-- 하단이2번내용물 -->
                <!-- 하단이2번내용물 -->
                <!-- 하단이2번내용물 -->
                <!-- 하단이2번내용물 -->
                <!-- 하단이2번내용물 -->
                <!-- 하단이2번내용물 -->
                <div class="tab-pane fade" id="account" role="tabpanel">
                
                <!-- 하단이테이블내용물 -->
                  <div class="card">
	<div class="card-body">
		<div class="d-flex gap-1 mb-4 flex-wrap">
			<div class="d-flex gap-1 me-auto flex-wrap">
				<button
					class="btn btn-primary d-inline-flex align-items-center gap-1"
					data-bs-toggle="modal" data-bs-target="#addUserModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd" />
                  </svg>
					창고 등록
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
		<form name="form">
			<table class="table align-middle">
				<thead>
					<tr>
						<th scope="col">
							<div>
								<input class="form-check-input" type="checkbox" value="">
							</div>
						</th>
						<th scope="col">일련번호</th>
						<th scope="col">창고코드</th>
						<th scope="col">창고명</th>
						<th scope="col">Actions</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div>
								<input class="form-check-input" type="checkbox" value="">
							</div>
						</td>
						<td>
							1
						</td>
						<td>Administrator</td>
						<td>창고명이올예정</td>
						<td>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                          </svg>
								</button>
								<button type="button" class="btn btn-light d-flex text-danger">
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
					
					<tr>
						<td>
							<div>
								<input class="form-check-input" type="checkbox" value="">
							</div>
						</td>
						<td>
							2
						</td>
						<td>Developer</td>
						<td>창고명이올예정</td>
						<td>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                          </svg>
								</button>
								<button type="button" class="btn btn-light d-flex text-danger">
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
				</tbody>
			</table>
			</form>
			
			
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
<!-- 테이블내용물 -->
                </div>
                <!-- 상단이2번내용물 -->
                
                
              </div>
            </div>
          </div>
          <!-- 상단이우측끝측 -->
          
        </div>
      </div> --%>
      <!-- 테스트중메인바디 -->








<!-- Modal 코드 넣을 위치 -->
<!-- Add user modal -->
<div class="modal fade" id="addUserModal" tabindex="-1">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 class="modal-title">창고 등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form class="needs-validation" novalidate id="taskForm">
					<div class="mb-3">
						<label for="userFullname" class="form-label">창고코드</label> <input
							type="text" name="userFullname" class="form-control" id="code"
							required autofocus>
						<div class="invalid-feedback">User full name is required.</div>
					</div>
					<div class="mb-3">
						<label for="userEmail" class="form-label">창고명</label> <input
							type="email" name="userEmail" class="form-control" id="name"
							required>
						<div class="invalid-feedback">User email is required.</div>
					</div>
				</form>
			</div>
			<div class="modal-footer border-0">
				<button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
				<button type="submit" form="taskForm" class="btn btn-primary px-5">등록</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달끝 -->

<!-- bottom.jsp -->
<%@include file="../../common/bottom.jsp"%>

<script type="text/javascript">
$(function(){
<<<<<<< HEAD
	alert("/basicinfo/warehouse/list.jsp");
	document.getElementById('member').click();
=======
	console.log("/basicinfo/warehouse/list.jsp");
>>>>>>> branch 'main' of https://github.com/ChanhoPark-s/WMS_corporate_project.git
});
</script>
