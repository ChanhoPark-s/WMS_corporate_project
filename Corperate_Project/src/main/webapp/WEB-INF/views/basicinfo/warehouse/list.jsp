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
          <li class="nav-item">
           <a href="#default-collapse" class="nav-link px-0 dropdown-toggle d-flex align-items-center gap-3" data-bs-toggle="collapse" role="button" aria-expanded="true" aria-controls="default-collapse"
            	id="mydefault" data-value="0" onclick="clickFunction(this.id)">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z" />
              </svg>
              창고목록
           </a>
           
           <!-- 창고 -->
           <div class="ms-5 collapse show" id="default-collapse">
           <!-- 상단부터 창고목록위해 추가된것으로 삭제시 좌측테이블 초기상태 -->
            <ul class="nav flex-column">
              <c:forEach items="${warehouseLists }" var="warehouseLists" varStatus="warehousestatus">
              <li class="nav-item">
                <a href="#warehouse-collapse${warehouseLists.no }" class="nav-link px-0 dropdown-toggle d-flex align-items-center gap-3" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="warehouse-collapse${warehouseLists.no }"
                	id="mywarehouseno${warehouseLists.no }" data-value="${warehouseLists.no }" onclick="clickFunction(this.id)">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z" />
                  </svg>
                  ${warehouseLists.name }
                </a>
                
                <!-- 구역 -->
                <div class="ms-5 collapse" id="warehouse-collapse${warehouseLists.no }">
                  <ul class="nav flex-column">
                  
                  <c:forEach items="${areaLists }" var="areaLists" varStatus="areastatus">
                  <c:if test="${warehouseLists.no eq areaLists.ware_no }">
                    <li class="nav-item">
                      <a href="#area-collapse${areaLists.no }" class="nav-link px-0 dropdown-toggle d-flex align-items-center gap-3" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="area-collapse${areaLists.no }"
                      	id="myareano${areaLists.no }" data-value="${areaLists.no }" onclick="clickFunction(this.id)">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z" />
                        </svg>
                        ${areaLists.name }
                      </a>
                      
                      <!-- 랙 -->
                      <div class="ms-5 collapse" id="area-collapse${areaLists.no }">
                        <ul class="nav flex-column">
                          
                          <c:forEach items="${rackLists }" var="rackLists" varStatus="rackstatus">
                          <c:if test="${areaLists.no eq rackLists.area_no }">
                          <li class="nav-item">
		                      <a href="#rack-collapse${rackLists.no }" class="nav-link px-0 dropdown-toggle d-flex align-items-center gap-3" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="rack-collapse${rackLists.no }"
		                      	id="myrackno${rackLists.no }" data-value="${rackLists.no }" onclick="clickFunction(this.id)">
		                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
		                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z" />
		                        </svg>
		                        ${rackLists.name }
		                      </a>
                            
                            <!-- 셀 -->
                            <div class="ms-5 collapse" id="rack-collapse${rackLists.no }">
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
            <!-- 상단 창고담는 폴더 추가할때 하단추가함 -->
            </div>
            </li>
           </ul>
            <!-- 상단 창고담는 폴더 추가할때 상단추가함 -->
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
				<button class="btn btn-primary d-inline-flex align-items-center gap-1"  onclick="warehouseinsert()"
					data-bs-toggle="modal" data-bs-target="#MyModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd" />
                  </svg>
					창고 등록
				</button>
				<button class="btn btn-primary d-inline-flex align-items-center gap-1"  onclick="areainsert()"
					data-bs-toggle="modal" data-bs-target="#MyModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd" />
                  </svg>
					구역 등록
				</button>
				<button class="btn btn-primary d-inline-flex align-items-center gap-1"  onclick="rackinsert()"
					data-bs-toggle="modal" data-bs-target="#MyModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd" />
                  </svg>
					랙 등록
				</button>
				<button class="btn btn-primary d-inline-flex align-items-center gap-1"  onclick="cellinsert()"
					data-bs-toggle="modal" data-bs-target="#MyModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd" />
                  </svg>
					셀 등록
				</button>
			</div>
<!-- 			<form>
				<input type="text" class="form-control" placeholder="Search user">
			</form> -->
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
						<th scope="col">코드</th>
						<th scope="col">위치명</th>
						<th scope="col">Actions</th>
					</tr>
				</thead>
				<tbody id="tddata">
					<c:forEach items="${lists }" var="lists" varStatus="status">
					<tr>
						<td>
							<div>
								<input class="form-check-input" type="checkbox" value="">
							</div>
						</td>
						<td>
							${status.count}
						</td>
						<td>${lists.code }</td>
						<td>${lists.name }</td>
						<td>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex" id="updatewarehouse" onclick="updatefunction(${lists.no},'${param.id }')">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                          </svg>
								</button>
								<button type="button" class="btn btn-light d-flex text-danger" onclick="deletefunction(${lists.no},'${param.id }')">
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


<!-- Modal 코드 넣을 위치 -->
<!-- Add user modal -->
<div class="modal fade" id="MyModal" tabindex="-1">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 class="modal-title" id="modaltitle">창고 등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form class="needs-validation" novalidate id="taskForm" action="" method="post">
				<input type="hidden" name="sendno" id="sendno">
				<input type="hidden" name="sendid" id="sendid">
				<input type="hidden" name="showid" id="showid">
				
					<div class="mb-3" id="warehouselocationtitle">
						<label for="warehouselocation" class="form-label">상위창고위치</label>
						<select class="dselect form-select" name="warehouselocation" id="warehouselocation" required onchange="change1()">
							<option value="">창고위치를 선택하세요</option>
				            <c:forEach items="${warehouseLists}" var="warehouseLists">
				              <option value="${warehouseLists.no}">${warehouseLists.name}</option>
				            </c:forEach>
			            </select>
						<div class="invalid-feedback">User full name is required.</div>
					</div>
					<div class="mb-3" id="arealocationtitle">
						<label for="arealocation" class="form-label">상위구역위치</label>
						<select class="dselect form-select" name="arealocation" id="arealocation" required onchange="change2()">
							<option value="">구역위치를 선택하세요</option>
				            <c:forEach items="${areaLists}" var="areaLists">
				              <option value="${areaLists.no}">${areaLists.name}</option>
				            </c:forEach>
			            </select>
						<div class="invalid-feedback">User email is required.</div>
					</div>
					<div class="mb-3" id="racklocationtitle">
						<label for="racklocation" class="form-label">상위랙위치</label>
						<select class="dselect form-select" name="racklocation" id="racklocation" required>
							<option value="">랙위치를 선택하세요</option>
				            <c:forEach items="${rackLists}" var="rackLists">
				              <option value="${rackLists.no}">${rackLists.name}</option>
				            </c:forEach>
			            </select>
						<div class="invalid-feedback">User email is required.</div>
					</div>
					
					
					<div class="mb-3" id="warehousecodetitle">
						<label for="warehousecode" class="form-label" >창고코드</label> <input
							type="text" name="warehousecode" class="form-control" id="warehousecode"
							required autofocus>
						<div class="invalid-feedback">User full name is required.</div>
					</div>
					<div class="mb-3" id="warehousenametitle">
						<label for="warehousename" class="form-label">창고명</label> <input
							type="text" name="warehousename" class="form-control" id="warehousename"
							required >
						<div class="invalid-feedback">User email is required.</div>
					</div>
					<div class="mb-3" id="areacodetitle">
						<label for="areacode" class="form-label">구역코드</label> <input
							type="text" name="areacode" class="form-control" id="areacode"
							required >
						<div class="invalid-feedback">User email is required.</div>
					</div>
					<div class="mb-3" id="areanametitle">
						<label for="areaname" class="form-label">구역명</label> <input
							type="text" name="areaname" class="form-control" id="areaname"
							required >
						<div class="invalid-feedback">User email is required.</div>
					</div>
					<div class="mb-3" id="rackcodetitle">
						<label for="rackcode" class="form-label">랙코드</label> <input
							type="text" name="rackcode" class="form-control" id="rackcode"
							required >
						<div class="invalid-feedback">User email is required.</div>
					</div>
					<div class="mb-3" id="racknametitle">
						<label for="rackname" class="form-label">랙명</label> <input
							type="text" name="rackname" class="form-control" id="rackname"
							required >
						<div class="invalid-feedback">User email is required.</div>
					</div>
					<div class="mb-3" id="cellcodetitle">
						<label for="cellcode" class="form-label">셀코드</label> <input
							type="text" name="cellcode" class="form-control" id="cellcode"
							required >
						<div class="invalid-feedback">User email is required.</div>
					</div>
					<div class="mb-3" id="cellnametitle">
						<label for="cellname" class="form-label">셀명</label> <input
							type="text" name="cellname" class="form-control" id="cellname"
							required >
						<div class="invalid-feedback">User email is required.</div>
					</div>
				</form>
			</div>
			<div class="modal-footer border-0">
				<button type="submit" form="taskForm" class="btn btn-primary px-5" id="submit_btn">등록</button>
				<button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달끝 -->



<!-- bottom.jsp -->
<%@include file="../../common/bottom.jsp"%>
<script type="text/javascript">
// document.addEventListener("DOMContentLoaded", function(){
// 	var getid = "${id}";
// 	var getshowid = "${showid}";
// 	var getno = "${no}";

// 	document.getElementById(getshowid).setAttribute("aria-expanded", "true");
// 	document.getElementById(getshowid).classList.remove('collapsed');
// 	document.getElementById(getshowid).classList.add("show");
	
	
// 	document.getElementById("rack-collapse1").setAttribute("aria-expanded", "true");
// 	document.getElementById('rack-collapse1').classList.remove('collapsed');
// 	document.getElementById("rack-collapse1").classList.add("show");

// 	document.getElementById("area-collapse1").setAttribute("aria-expanded", "true");
// 	document.getElementById('area-collapse1').classList.remove('collapsed');
// 	document.getElementById("area-collapse1").classList.add("show");

// 	document.getElementById("warehouse-collapse1").setAttribute("aria-expanded", "true");
// 	document.getElementById('warehouse-collapse1').classList.remove('collapsed');
// 	document.getElementById("warehouse-collapse1").classList.add("show");
// });
var id;
var no;
var showid;
$(function(){
	/* 왼쪽 카테고리창이 해당화면에 맞게 펼쳐지게 하는 코드 */
	document.getElementById('basicinfo').click();
	console.log("/basicinfo/warehouse/list.jsp");
	
	
	/* 왼쪽 창고-셀창이 등록/수정/삭제이후 보던 목차가펼쳐지게 하는 코드 */
	var myshowid = "${param.showid}";
	//등록/수정/삭제후 컨트롤러를 거친showid를 다시 입력
// 	document.elementgetById('showid').value="${param.showid}";
	
// 	console.log(myshowid);
// 	$('#area-collapse1').closest('div').addClass('show');
// 	$('#warehouse-collapse1').closest('div').addClass('show');
//	$('#'+myshowid).addClass('show');
//	console.log('dd'+$('#'+myshowid).closest('div').prop('id'));

	var selected = document.querySelector('#' + myshowid); // 최하위시작시 rack(셀보여줌)
	selected.classList.add('show');
	
	var parent1 = selected.parentElement.closest('div'); // area(랙보여줌)
	parent1.classList.add('show');
	
	var parent2 = parent1.parentElement.closest('div'); // ware(구역보여줌)
	parent2.classList.add('show');
	
	var parent3 = parent2.parentElement.closest('div'); // default(창고보여줌)
	parent3.classList.add('show');
	
	//보던 데이터를 불러와서 볼때 해당 수정/삭제 가능하게 id,no재입력해준다
	id = "${param.id}";
	no =  "${param.no}";
	showid =  "${param.showid}";
	console.log("화면에서의id"+id);
	console.log("화면에서의no"+no);
	console.log("화면에서의showid"+showid);
// 	$('#'+myshowid).closest('div').addClass('show');
// 	$('#warehouse-collapse1').addClass('show');
});



function clickFunction(clicked_id){
// 	id = clicked_id;
// 	no = document.getElementById(clicked_id).getAttribute('data-value');
// 	alert(id+"+"+"+"+showid+"+"+no);
// 	location.href="/basicinfo/warehouse/list?id="+id+"&showid="+showid+"&no="+no;
	id = clicked_id;
	showid = document.getElementById(clicked_id).getAttribute('href').substring(1); //등록수정삭제시 창고-셀 사이드바 보던 화면으로 가기 위한 변수
	no = document.getElementById(clicked_id).getAttribute('data-value');
	alert(showid);
	alert(id);
	
	document.getElementById('showid').value = showid;

	$.ajax({
		url : "/basicinfo/warehouse/get-data",
		type : "get",
// 		datatype : "json",
// 		contentType : 'application/json; charset=UTF-8',
		data : ({
			"id" : id,
			"no" : no
		}),
		success : function(data){
			var mydata = JSON.parse(data);
			console.log(mydata);
// 			var rowcount = Object.keys(mydata).length;
// 			alert(JSON.stringify(data));
// 			var mydata1 = JSON.stringify(data);
// 			alert(data);
// 			alert(rowcount);
			$('#tddata *').remove();
			var tabledata = '<tr>';
			$.each(mydata,function(i){
				/*ajax로 each 돌려서 우측 테이블td생성*/
				tabledata +=	
									'<td>'+
									'<div>'+
											'<input class="form-check-input" type="checkbox" value="">'+
										'</div>'+
									'</td>'+
									'<td>'+(i+1)+'</td>'+
									'<td>'+mydata[i].code+'</td>'+
									'<td>'+mydata[i].name+'</td>'+
									'<td>'+
										'<div class="btn-group btn-group-sm" role="group">'+
											'<button type="button" class="btn btn-light d-flex" id=update'+id+' onclick="updatefunction('+mydata[i].no+',\'' +id+ '\')">'+
												'<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"'+
													'fill="none" viewBox="0 0 24 24" stroke="currentColor"'+
													'aria-hidden="true">'+
					                    '<path stroke-linecap="round"'+
														'stroke-linejoin="round" stroke-width="2"'+
														'd="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />'+
					                  '</svg>'+
											'</button>'+
											'<button type="button" class="btn btn-light d-flex text-danger" id=delete'+id+' onclick="deletefunction('+mydata[i].no+',\'' +id+ '\')">'+
												'<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"'+
													'fill="none" viewBox="0 0 24 24" stroke="currentColor"'+
													'aria-hidden="true">'+
					                    '<path stroke-linecap="round"'+
														'stroke-linejoin="round" stroke-width="2"'+
														'd="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />'+
					                  '</svg>'+
											'</button>'+
										'</div>'+
									'</td>'+									
								'</tr>';
// 				rowcount = rowcount-1;
				});
			$("#tddata").append(tabledata);
				/*ajax로 each 돌려서 우측 테이블td생성 끝*/
				
		},
		error: function (request, status, error) {
	        console.log("code: " + request.status);
	        console.log("message: " + request.responseText);
	        console.log("error: " + error);
	    }

	});//ajax
	

};//clickFunction

$(function(){
	console.log("클릭함수지난화면에서의id"+id);
	console.log("클릭함수지난화면에서의no"+no);
	console.log("클릭함수지난화면에서의showid"+showid);
	});



function deletefunction(no,id){
	alert(no+' del '+id);
	var deletecheck;
	console.log('삭제클릭한아이디'+id);
	console.log('삭제클릭한아이디의번호'+no);
	if(id.indexOf('ware')>0){
		deletecheck = confirm('해당 구역을 정말로 삭제하시겠습니까?');
		if(deletecheck){
			location.href="/basicinfo/warehouse/delete?area_no="+no+"&showid="+showid;
		}
	}
	if(id.indexOf('area')>0){
		deletecheck = confirm('해당 랙을 정말로 삭제하시겠습니까?');
		if(deletecheck){
			location.href="/basicinfo/warehouse/delete?rack_no="+no+"&showid="+showid;
		}
	}		
	if(id.indexOf('rack')>0){
		deletecheck = confirm('해당 셀을 정말로 삭제하시겠습니까?');
		if(deletecheck){
			location.href="/basicinfo/warehouse/delete?cell_no="+no+"&showid="+showid;
		}
	}		
	if(id.indexOf('default')>0){
		deletecheck = confirm('해당 창고를 정말로 삭제하시겠습니까?');
		if(deletecheck){
			location.href="/basicinfo/warehouse/delete?ware_no="+no+"&showid="+showid;
		}
	}		
}

//보여지는 목록에서 수정버튼 클릭시
function updatefunction(no,id){
	alert(no+' upd '+id);
	console.log("수정버튼클릭시id"+id);
	console.log("수정버튼클릭시no"+no);
	
	$('#submit_btn').html('수정');
	$('#sendid').val(id);
	$('#sendno').val(no);
	$('#taskForm').attr("action", "/basicinfo/warehouse/update");
	
	if(id.indexOf('default')>0){
		//창고수정
		$('#modaltitle').html('창고수정');
		$('#warehouselocationtitle').hide();
		$('#arealocationtitle').hide();
		$('#racklocationtitle').hide();
		$('#warehousecodetitle').show();
		$('#warehousenametitle').show();
		$('#areacodetitle').hide();
		$('#areanametitle').hide();
		$('#rackcodetitle').hide();
		$('#racknametitle').hide();
		$('#cellcodetitle').hide();
		$('#cellnametitle').hide();
		$('#MyModal').modal('show');
	}
	if(id.indexOf('ware')>0){
		//구역수정
		$('#modaltitle').html('구역수정');
		$('#warehouselocationtitle').show();
		$('#arealocationtitle').hide();
		$('#racklocationtitle').hide();
		$('#warehousecodetitle').hide();
		$('#warehousenametitle').hide();
		$('#areacodetitle').show();
		$('#areanametitle').show();
		$('#rackcodetitle').hide();
		$('#racknametitle').hide();
		$('#cellcodetitle').hide();
		$('#cellnametitle').hide();
		$('#MyModal').modal('show');
	}
	if(id.indexOf('area')>0){
		//랙수정
		$('#modaltitle').html('랙수정');
		$('#warehouselocationtitle').show();
		$('#arealocationtitle').show();
		$('#racklocationtitle').hide();
		$('#warehousecodetitle').hide();
		$('#warehousenametitle').hide();
		$('#areacodetitle').hide();
		$('#areanametitle').hide();
		$('#rackcodetitle').show();
		$('#racknametitle').show();
		$('#cellcodetitle').hide();
		$('#cellnametitle').hide();
		$('#MyModal').modal('show');
	}
	if(id.indexOf('rack')>0){
		//셀수정
		$('#modaltitle').html('셀수정');
		$('#warehouselocationtitle').show();
		$('#arealocationtitle').show();
		$('#racklocationtitle').show();
		$('#warehousecodetitle').hide();
		$('#warehousenametitle').hide();
		$('#areacodetitle').hide();
		$('#areanametitle').hide();
		$('#rackcodetitle').hide();
		$('#racknametitle').hide();
		$('#cellcodetitle').show();
		$('#cellnametitle').show();
		$('#MyModal').modal('show');
	}

	//수정할때 입력했던 데이터 가져오기위해 하단코드작성중
	var warehouselocation;
	var arealocation;
	var racklocation;
	var warehousecode;
	var warehousename;
	var areacode;
	var areaname;
	var rackcode;
	var rackname;
	var cellcode;
	var cellname;

	$.ajax({
		url : "/basicinfo/warehouse/selectByNo",
		type : "post",
		data : ({
			"id" : id,
			"no" : no
		}),
		success : function(data){
			var mydata = JSON.parse(data);
			console.log(mydata);
			
			warehouselocation = mydata.warehouselocation;
			arealocation = mydata.arealocation;
			racklocation = mydata.racklocation;
			warehousecode = mydata.warehousecode;
			warehousename = mydata.warehousename;
			areacode = mydata.areacode;
			areaname = mydata.areaname;
			rackcode = mydata.rackcode;
			rackname = mydata.rackname;
			cellcode = mydata.cellcode;
			cellname = mydata.cellname;
			
			document.getElementById('warehouselocation').value = warehouselocation;
			document.getElementById('arealocation').value= arealocation;
			document.getElementById('racklocation').value= racklocation;
			document.getElementById('warehousecode').value= warehousecode;
			document.getElementById('warehousename').value= warehousename;
			document.getElementById('areacode').value= areacode;
			document.getElementById('areaname').value= areaname;
			document.getElementById('rackcode').value= rackcode;
			document.getElementById('rackname').value= rackname;
			document.getElementById('cellcode').value= cellcode;
			document.getElementById('cellname').value= cellname;
		},
		error: function (request, status, error) {
	        console.log("code: " + request.status);
	        console.log("message: " + request.responseText);
	        console.log("error: " + error);
	    }

	});//ajax
	
	//셀렉트박스 상위위치는 disabled
	document.getElementById('warehouselocation').disabled = true;
	document.getElementById('arealocation').disabled = true;
	document.getElementById('racklocation').disabled = true;
}//창고-셀 수정하기

//창고등록모달
function warehouseinsert(){
	resetmodal();
	$('#submit_btn').html('등록');
	$('#modaltitle').html('창고등록');
	$('#warehouselocationtitle').hide();
	$('#arealocationtitle').hide();
	$('#racklocationtitle').hide();
	$('#warehousecodetitle').show();
	$('#warehousenametitle').show();
	$('#areacodetitle').hide();
	$('#areanametitle').hide();
	$('#rackcodetitle').hide();
	$('#racknametitle').hide();
	$('#cellcodetitle').hide();
	$('#cellnametitle').hide();
	document.getElementById('taskForm').setAttribute('action','/basicinfo/warehouse/insert');
}

//구역등록모달
function areainsert(){
	resetmodal();
	$('#submit_btn').html('등록');
	$('#modaltitle').html('구역등록');
	$('#warehouselocationtitle').show();
	$('#arealocationtitle').hide();
	$('#racklocationtitle').hide();
	$('#warehousecodetitle').hide();
	$('#warehousenametitle').hide();
	$('#areacodetitle').show();
	$('#areanametitle').show();
	$('#rackcodetitle').hide();
	$('#racknametitle').hide();
	$('#cellcodetitle').hide();
	$('#cellnametitle').hide();
	document.getElementById('taskForm').setAttribute('action','/basicinfo/warehouse/insert');
}

//랙등록모달
function rackinsert(){
	resetmodal();
	$('#arealocation *').remove();
	$('#arealocation').append('<option value="">구역위치를 선택하세요</option>');
	$('#submit_btn').html('등록');
	$('#modaltitle').html('랙등록');
	$('#warehouselocationtitle').show();
	$('#arealocationtitle').show();
	$('#racklocationtitle').hide();
	$('#warehousecodetitle').hide();
	$('#warehousenametitle').hide();
	$('#areacodetitle').hide();
	$('#areanametitle').hide();
	$('#rackcodetitle').show();
	$('#racknametitle').show();
	$('#cellcodetitle').hide();
	$('#cellnametitle').hide();
	document.getElementById('taskForm').setAttribute('action','/basicinfo/warehouse/insert');
}

//셀등록모달
function cellinsert(){
	resetmodal();
	$('#arealocation *').remove();
	$('#arealocation').append('<option value="">구역위치를 선택하세요</option>');
	$('#racklocation *').remove();
	$('#racklocation').append('<option value="">랙위치를 선택하세요</option>');
	$('#submit_btn').html('등록');
	$('#modaltitle').html('셀등록');
	$('#warehouselocationtitle').show();
	$('#arealocationtitle').show();
	$('#racklocationtitle').show();
	$('#warehousecodetitle').hide();
	$('#warehousenametitle').hide();
	$('#areacodetitle').hide();
	$('#areanametitle').hide();
	$('#rackcodetitle').hide();
	$('#racknametitle').hide();
	$('#cellcodetitle').show();
	$('#cellnametitle').show();
	document.getElementById('taskForm').setAttribute('action','/basicinfo/warehouse/insert');
}

//상위창고위치 셀렉트 선택에 따른 상위구역위치 옵션 설정
function change1(){
	$.ajax({
		url : "/basicinfo/warehouse/OptionsByLocationNo",
		type : "post",
		data : ({
			"no" : taskForm.warehouselocation.selectedIndex
		}),
		success : function(data){
			var mydata = JSON.parse(data);
			console.log(mydata);
			
			$('#arealocation *').remove();
			$('#arealocation').append('<option value="">구역위치를 선택하세요</option>');
			$('#racklocation *').remove();
			$('#racklocation').append('<option value="">랙위치를 선택하세요</option>');
			if(mydata !=null){
				$.each(mydata,function(i){
					option = '<option value="'+mydata[i].no+'">'+mydata[i].name+'</option>';
					$('#arealocation').append(option);
				});//each
			}//if
		},
		error: function (request, status, error) {
	        console.log("code: " + request.status);
	        console.log("message: " + request.responseText);
	        console.log("error: " + error);
	    }
	});//ajax
}

//상위구역위치 셀렉트 선택에 따른 상위랙위치 옵션 설정
function change2(){
	$.ajax({
		url : "/basicinfo/warehouse/OptionsByAreaLocationNo",
		type : "post",
		data : ({
			"no" : taskForm.arealocation.selectedIndex
		}),
		success : function(data){
			var mydata = JSON.parse(data);
			console.log(mydata);
			
			$('#racklocation *').remove();
			$('#racklocation').append('<option value="">랙위치를 선택하세요</option>');
			if(mydata !=null){
				$.each(mydata,function(i){
					option = '<option value="'+mydata[i].no+'">'+mydata[i].name+'</option>';
					$('#racklocation').append(option);
				});//each
			}//if
		},
		error: function (request, status, error) {
	        console.log("code: " + request.status);
	        console.log("message: " + request.responseText);
	        console.log("error: " + error);
	    }
	});//ajax
}



//모달리셋
function resetmodal(){
	//잠긴 셀렉트박스들 해제
	document.getElementById('warehouselocation').disabled = false;
	document.getElementById('arealocation').disabled = false;
	document.getElementById('racklocation').disabled = false;
	
	//input 데이터들 리셋
	document.getElementById('warehouselocation').value = '';
	document.getElementById('arealocation').value= '';
	document.getElementById('racklocation').value= '';
	document.getElementById('warehousecode').value= '';
	document.getElementById('warehousename').value= '';
	document.getElementById('areacode').value= '';
	document.getElementById('areaname').value= '';
	document.getElementById('rackcode').value= '';
	document.getElementById('rackname').value= '';
	document.getElementById('cellcode').value= '';
	document.getElementById('cellname').value= '';
};
</script>
