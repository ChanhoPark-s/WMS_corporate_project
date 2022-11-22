<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- top.jsp -->
<%@include file="../../common/top.jsp"%>

<!-- Main body -->
      <div id="main-body">

        <div class="row g-4">
          <div class="col-md-4 col-lg-4 d-none d-md-block">
            <div class="card h-100">
              <div class="card-body navbar-light">
                <!-- 좌측영역에넣을테이블 -->
<div class="col-md-12">
            <h3 class="fw-black">창고정보 관리</h3>
            <p>창고, 구역, 랙, 셀 목록을 클릭하여 정보확인</p>
            
         <ul class="nav flex-column" style=" height: 600px; overflow: auto">
          <li class="nav-item">
           <a href="#default-collapse1" class="nav-link px-0 dropdown-toggle d-flex align-items-center gap-3" data-bs-toggle="collapse" role="button" aria-expanded="true" aria-controls="default-collapse"
            	id="mydefault" data-value="0" onclick="clickFunction(this.id)">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z" />
              </svg>
              창고목록
           </a>
           
           <!-- 창고 -->
           <div class="ms-5 collapse show" id="default-collapse1">
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
                            <div class="ms-4 collapse" id="rack-collapse${rackLists.no }">
		                        <ul class="nav flex-column">
		                          
		                          <c:forEach items="${cellLists }" var="cellLists" varStatus="cellstatus">
		                          <c:if test="${rackLists.no eq cellLists.rack_no }">
		                          <li class="nav-item m-2">
		                             ●&nbsp;&nbsp;&nbsp;${cellLists.name }
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
          <div class="col-md-8 col-lg-8">
            <div class="card h-100">
              <div class="card-body tab-content">
                <!-- 우측영역에넣을테이블 -->
<div class="card">
	<div class="card-body">
	
		<!-- 우측테이블상단의 버튼/검색 -->
		<div class="d-flex gap-1 mb-4 flex-wrap">
			<div class="d-flex gap-1 me-auto flex-wrap">
				<button class="btn btn-primary d-inline-flex align-items-center gap-1"  onclick="insertfunction('default')"
					data-bs-toggle="modal" data-bs-target="#MyModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd" />
                  </svg>
					창고 등록
				</button>
				<button class="btn btn-primary d-inline-flex align-items-center gap-1"  onclick="insertfunction('ware')"
					data-bs-toggle="modal" data-bs-target="#MyModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd" />
                  </svg>
					구역 등록
				</button>
				<button class="btn btn-primary d-inline-flex align-items-center gap-1"  onclick="insertfunction('area')"
					data-bs-toggle="modal" data-bs-target="#MyModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd" />
                  </svg>
					랙 등록
				</button>
				<button class="btn btn-primary d-inline-flex align-items-center gap-1"  onclick="insertfunction('rack')"
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
		</div>
		<div class="d-flex gap-1 mb-1 flex-wrap">
			<h3 id="clicked_location">
				<c:choose>
					<c:when test="${current_location eq null}">창고목록</c:when>
					<c:when test="${current_location eq 'undefined'}">창고목록</c:when>
					<c:otherwise>${current_location }</c:otherwise>
				</c:choose>
			</h3>
		</div>
		<div class="table-responsive my-1">
		<form name="form">
			<table class="table align-middle">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">코드</th>
						<th scope="col">위치명</th>
						<th scope="col">기능</th>
					</tr>
				</thead>
				<tbody id="tddata">
					<c:forEach items="${lists }" var="lists" varStatus="status">
					<tr>
						<td style="width:15%;">
							${status.count}
						</td>
						<td style="width:25%;">${lists.code }</td>
						<td style="width:45%;">${lists.name }</td>
						<td style="width:15%;">
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex" id="updatewarehouse" onclick="updatefunction(${lists.no},
								<c:choose>
									<c:when test="${param.id eq null}">'mydefault'</c:when>
									<c:otherwise>'${param.id }'</c:otherwise>
								</c:choose>
								)">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                          </svg>
								</button>
								<button type="button" class="btn btn-light d-flex text-danger" onclick="deletefunction(${lists.no},
								<c:choose>
									<c:when test="${param.id eq null}">'mydefault'</c:when>
									<c:otherwise>'${param.id }'</c:otherwise>
								</c:choose>
								)">
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
				<form class="needs-validation" id="taskForm" action="" method="post">
				<input type="hidden" name="sendno" id="sendno">
				<input type="hidden" name="sendid" id="sendid">
				<input type="hidden" name="showid" id="showid">
				<input type="hidden" name="current_location" id="current_location">
				
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
							required>
						<div class="invalid-feedback">이미 사용중인 창고코드입니다</div>
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
						<div class="invalid-feedback">이미 사용중인 구역코드입니다</div>
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
						<div class="invalid-feedback">이미 사용중인 랙코드입니다</div>
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
						<div class="invalid-feedback">이미 사용중인 셀코드입니다</div>
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
				<button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
				<button type="submit" form="taskForm" class="btn btn-primary px-5" id="submit_btn">등록</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달끝 -->



<!-- bottom.jsp -->
<%@include file="../../common/bottom.jsp"%>
<script type="text/javascript">
var id;
var no;
var showid;
var current_location;
$(function(){
	
	/* 왼쪽 카테고리창이 해당화면에 맞게 펼쳐지게 하는 코드 */
	document.getElementById('basicinfo').click();
	
	/* 왼쪽 창고-셀 사이드바가 등록/수정/삭제이후 보던 목차가펼쳐지게 하는 코드 */
	var myshowid = "${param.showid}";

	var selected = document.querySelector('#' + myshowid); // 최하위시작시 rack(셀보여줌)
	selected.classList.add('show');
	
	var parent1 = selected.parentElement.closest('div'); // area(랙보여줌)
	parent1.classList.add('show');
	
	var parent2 = parent1.parentElement.closest('div'); // ware(구역보여줌)
	parent2.classList.add('show');
	
	var parent3 = parent2.parentElement.closest('div'); // default(창고보여줌)
	parent3.classList.add('show');
	
	//등록/수정/삭제후 컨트롤러를 거친showid를 다시 입력, 보던 데이터를 불러와서 볼때 해당 수정/삭제 가능하게 id,no재입력해준다
	id = "${param.id}";
	no =  "${param.no}";
	showid =  "${param.showid}";
	current_location =  "${param.current_location}";
});



//선택한 사이드바메뉴에 따른 하위구역 우측에 띄워준다
function clickFunction(clicked_id){
	id = clicked_id;
	showid = document.getElementById(clicked_id).getAttribute('href').substring(1); //등록수정삭제시 창고-셀 사이드바 보던 화면으로 가기 위한 변수
	no = document.getElementById(clicked_id).getAttribute('data-value');
	
	//클릭시 showid설정
	document.getElementById('showid').value = showid;

	/*ajax로 each 돌려서 우측 테이블td생성*/
	$.ajax({
		url : "/basicinfo/warehouse/get-data",
		type : "get",
		data : ({
			"id" : id,
			"no" : no
		}),
		success : function(data){
			var mydata = JSON.parse(data);
			$('#tddata *').remove();
			var tabledata = "";
			if(mydata.length==0){
				if(id.indexOf('ware')>=0){
					tabledata +=	'<tr>'+
										'<td colspan="4">'+'현재 선택한 창고는 하위 구역이 등록되어 있지 않습니다.'+'</td>'+
									'</tr>';
				}else if(id.indexOf('area')>=0){
					tabledata +=	'<tr>'+
										'<td colspan="4">'+'현재 선택한 구역은 하위 랙이 등록되어 있지 않습니다.'+'</td>'+
									'</tr>';
				}else{
					tabledata +=	'<tr>'+
										'<td colspan="4">'+'현재 선택한 랙은 하위 셀이 등록되어 있지 않습니다.'+'</td>'+
									'</tr>';
				}
			}
			else{
				$.each(mydata,function(i){
						tabledata +=	'<tr>'+
											'<td style="width:15%;">'+(i+1)+'</td>'+
											'<td style="width:25%;">'+mydata[i].code+'</td>'+
											'<td style="width:45%;">'+mydata[i].name+'</td>'+
											'<td style="width:15%;">'+
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
					});//each
				}//else
			$("#tddata").append(tabledata);	
		},
		error: function (request, status, error) {
	        console.log("code: " + request.status);
	        console.log("message: " + request.responseText);
	        console.log("error: " + error);
	    }

	});//ajax
	
	
	//클릭한 값 이름 가지고와서 우측테이블위의 현재보고있는영역을 표시
	$.ajax({
		url : "/basicinfo/warehouse/get-location",
		type : "get",
		data : ({
			"id" : id,
			"no" : no
		}),
		success : function(data){
			var mydata = JSON.parse(data);
			
// 			console.log("id는"+id);
// 			console.log("id.indexOf는"+id.indexOf(id));
// 			console.log("no는"+no);
			
			
			if(id.indexOf("default")>0){
				current_location = "창고목록";				
			}
			else if(id.indexOf("warehouse")>0){
				current_location = mydata.warehousename;		
			}
			else if(id.indexOf("area")>0){
				current_location = mydata.warehousename+ " "+mydata.areaname;
			}
			else{
				current_location = mydata.warehousename+ " "+mydata.areaname+ " "+mydata.rackname;
			}
			
			//등록/수정/삭제시 보고있던 우측테이블 위 현재영역을 유지시키기위해 form hidden을 통해 넘긴다
			document.getElementById('current_location').value = current_location;

// 			console.log("current_location는"+current_location);
			$("#clicked_location").html(current_location);
				
		},
		error: function (request, status, error) {
	        console.log("code: " + request.status);
	        console.log("message: " + request.responseText);
	        console.log("error: " + error);
	    }

	});//ajax
};//clickFunction



//우측에서 삭제아이콘 클릭시 해당 위치를 삭제한다
function deletefunction(no,id){
	
	//등록/수정/삭제시 보고있던 우측테이블 위 현재영역을 유지시키기위해 form hidden을 통해 넘긴다
	document.getElementById('current_location').value = current_location;
	
	//기본화면(창고리스트)서 등록했을시 id를 불러오지 못할시 id를 mydefault설정하여 수정함
	if(id==''){
		id = 'mydefault';
	}
	
	var deletecheck;
	$('#sendid').val(id);
	$('#sendno').val(no);
	$('#showid').val(showid);
	if(id.indexOf('ware')>0){
		deletecheck = confirm('해당 구역을 정말로 삭제하시겠습니까?');
		if(deletecheck){
			location.href="/basicinfo/warehouse/delete?area_no="+no+"&showid="+showid+"&id="+id+"&no="+no+"&current_location="+current_location;
		}
	}
	if(id.indexOf('area')>0){
		deletecheck = confirm('해당 랙을 정말로 삭제하시겠습니까?');
		if(deletecheck){
			location.href="/basicinfo/warehouse/delete?rack_no="+no+"&showid="+showid+"&id="+id+"&no="+no+"&current_location="+current_location;
		}
	}		
	if(id.indexOf('rack')>0){
		deletecheck = confirm('해당 셀을 정말로 삭제하시겠습니까?');
		if(deletecheck){
			location.href="/basicinfo/warehouse/delete?cell_no="+no+"&showid="+showid+"&id="+id+"&no="+no+"&current_location="+current_location;
		}
	}		
	if(id.indexOf('default')>0){
		deletecheck = confirm('해당 창고를 정말로 삭제하시겠습니까?');
		if(deletecheck){
			location.href="/basicinfo/warehouse/delete?ware_no="+no+"&showid="+showid+"&current_location="+current_location;
		}
	}		
}

//수정할때 입력했던 데이터 가져오기위한 하단의 코드
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

//우측에서 수정아이콘 클릭시 해당 위치를 수정한다
function updatefunction(no,id){
	
	//등록/수정/삭제시 보고있던 우측테이블 위 현재영역을 유지시키기위해 form hidden을 통해 넘긴다
	document.getElementById('current_location').value = current_location;
	
	//기본화면(창고리스트)서 등록했을시 id를 불러오지 못할시 id를 mydefault설정하여 수정함
	if(id==''){
		id = 'mydefault';
	}
	resetrequired();
	
	$('#submit_btn').html('수정');
	$('#sendid').val(id);
	$('#sendno').val(no);
	$('#showid').val(showid);
	$('#taskForm').attr("action", "/basicinfo/warehouse/update");
	$('#warehouselocationtitle').hide();
	$('#arealocationtitle').hide();
	$('#racklocationtitle').hide();
	$('#warehousecodetitle').hide();
	$('#warehousenametitle').hide();
	$('#areacodetitle').hide();
	$('#areanametitle').hide();
	$('#rackcodetitle').hide();
	$('#racknametitle').hide();
	$('#cellcodetitle').hide();
	$('#cellnametitle').hide();
	
	if(id.indexOf('default')>0){
		//창고수정
		$('#modaltitle').html('창고수정');
		$('#warehousecodetitle').show();
		$('#warehousenametitle').show();
		$('#warehousecode').attr("autofocus","autofocus");
		$('#MyModal').modal('show');
		
		//유효성
		$('#warehousecode').attr('required','');
		$('#warehousename').attr('required','');
	}
	if(id.indexOf('ware')>0){
		//구역수정
		$('#modaltitle').html('구역수정');
		$('#warehouselocationtitle').show();
		$('#areacodetitle').show();
		$('#areanametitle').show();
		$('#areacode').attr("autofocus","autofocus");
		$('#MyModal').modal('show');
		
		//유효성
		$('#warehouselocation').attr('required','');
		$('#areacode').attr('required','');
		$('#areaname').attr('required','');
	}
	if(id.indexOf('area')>0){
		//랙수정
		$('#modaltitle').html('랙수정');
		$('#warehouselocationtitle').show();
		$('#arealocationtitle').show();
		$('#rackcodetitle').show();
		$('#racknametitle').show();
		$('#rackcode').attr("autofocus","autofocus");
		$('#MyModal').modal('show');
		
		//유효성
		$('#warehouselocation').attr('required','');
		$('#arealocation').attr('required','');
		$('#rackcode').attr('required','');
		$('#rackname').attr('required','');
	}
	if(id.indexOf('rack')>0){
		//셀수정
		$('#modaltitle').html('셀수정');
		$('#warehouselocationtitle').show();
		$('#arealocationtitle').show();
		$('#racklocationtitle').show();
		$('#cellcodetitle').show();
		$('#cellnametitle').show();
		$('#cellcode').attr("autofocus","autofocus");
		$('#MyModal').modal('show');
		
		//유효성
		$('#warehouselocation').attr('required','');
		$('#arealocation').attr('required','');
		$('#racklocation').attr('required','');
		$('#cellcode').attr('required','');
		$('#cellname').attr('required','');
	}

	
	$.ajax({
		url : "/basicinfo/warehouse/selectByNo",
		type : "post",
		data : ({
			"id" : id,
			"no" : no
		}),
		success : function(data){
			var mydata = JSON.parse(data);

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




//등록 클릭시 해당영역 등록
function insertfunction(getid){
	
	//등록/수정/삭제시 보고있던 우측테이블 위 현재영역을 유지시키기위해 form hidden을 통해 넘긴다
	document.getElementById('current_location').value = current_location;
	
	resetmodal();
	resetrequired();
	$('#submit_btn').html('등록');
	$('#sendid').val(id);
	$('#sendno').val(no);
	$('#showid').val(showid);
	$('#taskForm').attr("action", "/basicinfo/warehouse/insert");
	$('#warehouselocationtitle').hide();
	$('#arealocationtitle').hide();
	$('#racklocationtitle').hide();
	$('#warehousecodetitle').hide();
	$('#warehousenametitle').hide();
	$('#areacodetitle').hide();
	$('#areanametitle').hide();
	$('#rackcodetitle').hide();
	$('#racknametitle').hide();
	$('#cellcodetitle').hide();
	$('#cellnametitle').hide();
	
	
	if(getid.indexOf('default')>=0){
		//창고등록
		$('#modaltitle').html('창고등록');
		$('#warehousecodetitle').show();
		$('#warehousenametitle').show();
		$('#warehousecode').attr("autofocus","autofocus");
		$('#MyModal').modal('show');
		
		//유효성
		$('#warehousecode').attr('required','');
		$('#warehousename').attr('required','');
	}
	if(getid.indexOf('ware')>=0){
		//구역등록
		$('#modaltitle').html('구역등록');
		$('#warehouselocationtitle').show();
		$('#areacodetitle').show();
		$('#areanametitle').show();
		$('#warehouselocation').attr("autofocus","autofocus");
		$('#MyModal').modal('show');
		
		//유효성
		$('#warehouselocation').attr('required','');
		$('#areacode').attr('required','');
		$('#areaname').attr('required','');
	}
	if(getid.indexOf('area')>=0){
		//랙등록
		$('#modaltitle').html('랙등록');
		$('#warehouselocationtitle').show();
		$('#arealocationtitle').show();
		$('#rackcodetitle').show();
		$('#racknametitle').show();
		$('#warehouselocation').attr("autofocus","autofocus");
		$('#MyModal').modal('show');
		
		//유효성
		$('#warehouselocation').attr('required','');
		$('#arealocation').attr('required','');
		$('#rackcode').attr('required','');
		$('#rackname').attr('required','');
	}
	if(getid.indexOf('rack')>=0){
		//셀등록
		$('#modaltitle').html('셀등록');
		$('#warehouselocationtitle').show();
		$('#arealocationtitle').show();
		$('#racklocationtitle').show();
		$('#cellcodetitle').show();
		$('#cellnametitle').show();
		$('#warehouselocation').attr("autofocus","autofocus");
		$('#MyModal').modal('show');
		
		//유효성
		$('#warehouselocation').attr('required','');
		$('#arealocation').attr('required','');
		$('#racklocation').attr('required','');
		$('#cellcode').attr('required','');
		$('#cellname').attr('required','');
	}
}
	

//상위창고위치 셀렉트 선택에 따른 상위구역위치 옵션 설정
function change1(){
	$.ajax({
		url : "/basicinfo/warehouse/OptionsByLocationNo",
		type : "post",
		data : ({
			"no" : taskForm.warehouselocation.value
		}),
		success : function(data){
			var mydata = JSON.parse(data);
			
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
			"no" : taskForm.arealocation.value
		}),
		success : function(data){
			var mydata = JSON.parse(data);
			
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



//에러메세지/중복메세지 해제
function resetrequired(){
	document.getElementById('warehouselocation').removeAttribute('required');
	document.getElementById('arealocation').removeAttribute('required');
	document.getElementById('racklocation').removeAttribute('required');
	document.getElementById('warehousecode').removeAttribute('required');
	document.getElementById('warehousename').removeAttribute('required');
	document.getElementById('areacode').removeAttribute('required');
	document.getElementById('areaname').removeAttribute('required');
	document.getElementById('rackcode').removeAttribute('required');
	document.getElementById('rackname').removeAttribute('required');
	document.getElementById('cellcode').removeAttribute('required');
	document.getElementById('cellname').removeAttribute('required');
	document.getElementById('submit_btn').removeAttribute('disabled');
	document.getElementById('warehouselocation').classList.remove('is-invalid');
	document.getElementById('arealocation').classList.remove('is-invalid');
	document.getElementById('racklocation').classList.remove('is-invalid');
	document.getElementById('warehousecode').classList.remove('is-invalid');
	document.getElementById('warehousename').classList.remove('is-invalid');
	document.getElementById('areacode').classList.remove('is-invalid');
	document.getElementById('areaname').classList.remove('is-invalid');
	document.getElementById('rackcode').classList.remove('is-invalid');
	document.getElementById('rackname').classList.remove('is-invalid');
	document.getElementById('cellcode').classList.remove('is-invalid');
	document.getElementById('cellname').classList.remove('is-invalid');

};

//코드만 중복검사
function checkcodefunction(getcode,location){
	$.ajax({
		url : "/basicinfo/warehouse/checkCode",
		type : "post",
		data : ({
			"getcode" : getcode,
			"location" : location
		}),
		success : function(data){
			var code = JSON.parse(data);
			
			if(location=='ware'){
				if(code>0){
					document.getElementById('warehousecode').classList.add('is-invalid');
					$('#submit_btn').attr("disabled","disabled");
					checkcode = false;
					
					//입력한 코드가 기존의 코드와 동일할경우 중복검사 통과
					if(warehousecode == getcode){
						document.getElementById('warehousecode').classList.remove('is-invalid');
						document.getElementById('submit_btn').removeAttribute('disabled');
						checkcode = true;
					}
					
				} else{
					document.getElementById('warehousecode').classList.remove('is-invalid');
					document.getElementById('submit_btn').removeAttribute('disabled');
					checkcode = true;
				}
			}else if(location=='area'){
				if(code>0){
					document.getElementById('areacode').classList.add('is-invalid');
					$('#submit_btn').attr("disabled","disabled");
					checkcode = false;
					
					//입력한 코드가 기존의 코드와 동일할경우 중복검사 통과
					if(areacode == getcode){
						document.getElementById('areacode').classList.remove('is-invalid');
						document.getElementById('submit_btn').removeAttribute('disabled');
						checkcode = true;
					}
				} else{
					document.getElementById('areacode').classList.remove('is-invalid');
					document.getElementById('submit_btn').removeAttribute('disabled');
					checkcode = true;
				}
			}else if(location=='rack'){
				if(code>0){
					document.getElementById('rackcode').classList.add('is-invalid');
					$('#submit_btn').attr("disabled","disabled");
					checkcode = false;
					
					//입력한 코드가 기존의 코드와 동일할경우 중복검사 통과
					if(rackcode == getcode){
						document.getElementById('rackcode').classList.remove('is-invalid');
						document.getElementById('submit_btn').removeAttribute('disabled');
						checkcode = true;
					}
				} else{
					document.getElementById('rackcode').classList.remove('is-invalid');
					document.getElementById('submit_btn').removeAttribute('disabled');
					checkcode = true;
				}
			}else{
				if(code>0){
					document.getElementById('cellcode').classList.add('is-invalid');
					$('#submit_btn').attr("disabled","disabled");
					checkcode = false;
					
					//입력한 코드가 기존의 코드와 동일할경우 중복검사 통과
					if(cellcode == getcode){
						document.getElementById('cellcode').classList.remove('is-invalid');
						document.getElementById('submit_btn').removeAttribute('disabled');
						checkcode = true;
					}
					
				} else{
					document.getElementById('cellcode').classList.remove('is-invalid');
					document.getElementById('submit_btn').removeAttribute('disabled');
					checkcode = true;
				}
			}
		},
		error: function (request, status, error) {
	        console.log("code: " + request.status);
	        console.log("message: " + request.responseText);
	        console.log("error: " + error);
	    }
	});//ajax
}//중복검사

//중복검사
var checkcode;
$(function(){
	/* 중복검사 */
	//창고코드입력시
	$('#warehousecode').keyup(function(){
		var wcode = $('#warehousecode').val();
		checkcode = checkcodefunction(wcode,'ware');
	});
	//구역코드입력시
	$('#areacode').keyup(function(){
		var acode = $('#areacode').val();
		checkcodefunction(acode,'area');

	});
	//랙코드입력시
	$('#rackcode').keyup(function(){
		var rcode = $('#rackcode').val();
		checkcodefunction(rcode,'rack');
	});
	//셀코드입력시
	$('#cellcode').keyup(function(){
		var ccode = $('#cellcode').val();
		checkcodefunction(ccode,'cell');
	});
});
</script>
