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
                <a href="#warehouse-collapse${warehouseLists.no }" class="nav-link px-0 dropdown-toggle d-flex align-items-center gap-3" data-bs-toggle="collapse" role="button" aria-expanded="true" aria-controls="warehouse-collapse${warehouseLists.no }"
                	id="mywarehouseno${warehouseLists.no }" data-value="${warehouseLists.no }" onclick="clickFunction(this.id)">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z" />
                  </svg>
                  ${warehouseLists.name }
                </a>
                <div class="ms-5 collapse show" id="warehouse-collapse${warehouseLists.no }">
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
				<button class="btn btn-primary d-inline-flex align-items-center gap-1"
					data-bs-toggle="modal" data-bs-target="#addUserModal" onclick="">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd" />
                  </svg>
					창고 등록
				</button>
				<button class="btn btn-primary d-inline-flex align-items-center gap-1"
					data-bs-toggle="modal" data-bs-target="#addUserModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd" />
                  </svg>
					구역 등록
				</button>
				<button class="btn btn-primary d-inline-flex align-items-center gap-1"
					data-bs-toggle="modal" data-bs-target="#addUserModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd" />
                  </svg>
					랙 등록
				</button>
				<button class="btn btn-primary d-inline-flex align-items-center gap-1"
					data-bs-toggle="modal" data-bs-target="#addUserModal">
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
					<c:forEach items="${lists }" var="lists">
					<tr>
						<td>
							<div>
								<input class="form-check-input" type="checkbox" value="">
							</div>
						</td>
						<td>
							${lists.no }
						</td>
						<td>${lists.code }</td>
						<td>${lists.name }</td>
						<td>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex" id="updatewarehouse">
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
					<div class="mb-3" id="warehouselocationtitle">
						<label for="userFullname" class="form-label">상위창고위치</label> <input
							type="text" name="userFullname" class="form-control" id="warehouselocation"
							required autofocus>
						<div class="invalid-feedback">User full name is required.</div>
					</div>
					<div class="mb-3" id="arealocationtitle">
						<label for="userEmail" class="form-label">상위구역위치</label> <input
							type="email" name="userEmail" class="form-control" id="arealocation"
							required >
						<div class="invalid-feedback">User email is required.</div>
					</div>
					<div class="mb-3" id="racklocationtitle">
						<label for="userEmail" class="form-label">상위랙위치</label> <input
							type="email" name="userEmail" class="form-control" id="racklocation"
							required >
						<div class="invalid-feedback">User email is required.</div>
					</div>
					
					
					<div class="mb-3" id="warehousecodetitle">
						<label for="userFullname" class="form-label" >창고코드</label> <input
							type="text" name="userFullname" class="form-control" id="warehousecode"
							required autofocus>
						<div class="invalid-feedback">User full name is required.</div>
					</div>
					<div class="mb-3" id="warehousenametitle">
						<label for="userEmail" class="form-label">창고명</label> <input
							type="email" name="userEmail" class="form-control" id="warehousename"
							required >
						<div class="invalid-feedback">User email is required.</div>
					</div>
					<div class="mb-3" id="areacodetitle">
						<label for="userEmail" class="form-label">구역코드</label> <input
							type="email" name="userEmail" class="form-control" id="areacode"
							required >
						<div class="invalid-feedback">User email is required.</div>
					</div>
					<div class="mb-3" id="areanametitle">
						<label for="userEmail" class="form-label">구역명</label> <input
							type="email" name="userEmail" class="form-control" id="areaname"
							required >
						<div class="invalid-feedback">User email is required.</div>
					</div>
					<div class="mb-3" id="rackcodetitle">
						<label for="userEmail" class="form-label">랙코드</label> <input
							type="email" name="userEmail" class="form-control" id="rackcode"
							required >
						<div class="invalid-feedback">User email is required.</div>
					</div>
					<div class="mb-3" id="racknametitle">
						<label for="userEmail" class="form-label">랙명</label> <input
							type="email" name="userEmail" class="form-control" id="rackname"
							required >
						<div class="invalid-feedback">User email is required.</div>
					</div>
					<div class="mb-3" id="cellcodetitle">
						<label for="userEmail" class="form-label">셀코드</label> <input
							type="email" name="userEmail" class="form-control" id="cellcode"
							required >
						<div class="invalid-feedback">User email is required.</div>
					</div>
					<div class="mb-3" id="cellnametitle">
						<label for="userEmail" class="form-label">셀명</label> <input
							type="email" name="userEmail" class="form-control" id="cellname"
							required >
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
$(function(){
	console.log("/basicinfo/warehouse/list.jsp");
});

var id;
var no;
var showid;
function clickFunction(clicked_id){
// 	id = clicked_id;
// 	showid = document.getElementById(clicked_id).getAttribute('href').substring(1)
// 	no = document.getElementById(clicked_id).getAttribute('data-value');
// 	alert(id+"+"+"+"+showid+"+"+no);
// 	location.href="/basicinfo/warehouse/list?id="+id+"&showid="+showid+"&no="+no;
	id = clicked_id;
	no = document.getElementById(clicked_id).getAttribute('data-value');
// 	alert(id);

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
				/*ajax로 each 돌려서 우측 테이블td생성*/
				
		},
		error: function (request, status, error) {
	        console.log("code: " + request.status);
	        console.log("message: " + request.responseText);
	        console.log("error: " + error);
	    }

	});//ajax
	
	

};//clickFunction
function deletefunction(no,id){
	alert(no+' del '+id);
}

//보여지는 목록에서 수정버튼 클릭시
function updatefunction(no,id){
	alert(no+' upd '+id);
	console.log(id);
	console.log(id.indexOf('ware'));
	if(id.indexOf('ware')>0){
		//창고수정
		$('#warehouselocationtitle').show();
		$('#arealocationtitle').hide();
		$('#racklocationtitle').hide();
		$('#warehousecodetitle').hide();
		$('#warehousenametitle').hide();
		$('#warehousenametitle').hide();
		$('#areacodetitle').show();
		$('#areanametitle').show();
		$('#rackcodetitle').hide();
		$('#racknametitle').hide();
		$('#cellcodetitle').hide();
		$('#cellnametitle').hide();
		$('#addUserModal').modal('show');
	}
	if(id.indexOf('area')>0){
		//구역수정
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
		$('#addUserModal').modal('show');
	}
	if(id.indexOf('rack')>0){
		//랙수정
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
		$('#addUserModal').modal('show');
	}
	
}

//	'<c:forEach items="${lists }" var="lists">'
//	'</c:forEach>'
/* $(document).ready(function(){
	
	$('#title_check').click(function() {
		//alert(3);
		isCheck = true;
		
		$.ajax({
			url : "title_check_proc.mv",
			data : ({
				inputtitle : $("input[name=title]").val()
			}),
			success : function(data){
				alert('data:' + data);
				if ($('input[name="title"]').val() == "") {
					$('#titleMessage').html("<font color=red>title입력 누락</font>");
					$('#titleMessage').show();
				}

				else if(data=='YES'){
					$('#titleMessage').html("<font color=red>사용 가능합니다.</font>");
					$('#titleMessage').show();
					use = "possible";
					isChange = false;
				}
				else{
					$('#titleMessage').html("<font color=red>이미 등록한 제목입니다.</font>");
					$('#titleMessage').show();
					use = "impossible";
				}
			}//success
		}); // ajax
	}); // click */
	
	
</script>
