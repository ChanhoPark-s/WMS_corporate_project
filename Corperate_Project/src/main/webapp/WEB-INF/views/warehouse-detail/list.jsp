<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- top.jsp -->
<%@include file="../common/top.jsp"%>

<!-- Main body -->
      <div id="main-body">

        <div class="row g-4">
          <div class="col-md-4 col-lg-4 d-none d-md-block">
            <div class="card h-100">
              <div class="card-body navbar-light">
                <!-- 좌측영역에넣을테이블 -->
<div class="col-md-10">
            <h3 class="fw-black">창고별 재고현황</h3>
            <p>재고현황을 확인하고 싶은 구역을 클릭하여 재고확인</p>
            
         <ul class="nav flex-column">
          <li class="nav-item">
           <a href="#default-collapse1" class="nav-link px-0 dropdown-toggle d-flex align-items-center gap-3" data-bs-toggle="collapse" role="button" aria-expanded="true" aria-controls="default-collapse"
            	id="mydefault" data-value="0" >
            	<!-- onclick="clickFunction(this.id)" -->
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z" />
              </svg>
              창고목록
           </a>
           
           <!-- 창고 -->
           <div class="ms-5 collapse show" id="default-collapse">
            <ul class="nav flex-column">
              <c:forEach items="${warehouseLists }" var="warehouseLists" varStatus="warehousestatus">
              <li class="nav-item">
                <a href="#warehouse-collapse${warehouseLists.no }" class="nav-link px-0 dropdown-toggle d-flex align-items-center gap-3" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="warehouse-collapse${warehouseLists.no }"
                	id="mywarehouseno${warehouseLists.no }" data-value="${warehouseLists.no }" onclick="clickFunction(this.id,${warehouseLists.no },0,0,0)">
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
                      	id="myareano${areaLists.no }" data-value="${areaLists.no }" onclick="clickFunction(this.id,${warehouseLists.no },${areaLists.no },0,0)">
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
		                      	id="myrackno${rackLists.no }" data-value="${rackLists.no }" onclick="clickFunction(this.id,${warehouseLists.no },${areaLists.no },${rackLists.no },0)">
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
		                          <li class="nav-item">
		                            <a href="javascript:void(0)" class="nav-link px-0 d-flex align-items-center gap-3"
		                            id="mycellno${cellLists.no }" data-value="${cellLists.no }" onclick="clickFunction(this.id,${warehouseLists.no },${areaLists.no },${rackLists.no },${cellLists.no })">
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
          <div class="col-md-8 col-lg-8">
            <div class="card h-100">
              <div class="card-body tab-content">
                <!-- 우측영역에넣을테이블 -->
<div class="card">
	<div class="card-body">

		<div class="table-responsive my-1">
		<form name="form">
			<table class="table align-middle">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">로트코드</th>
						<th scope="col">품목사진</th>
						<th scope="col">품목명</th>
						<th scope="col">재고수량</th>
					</tr>
				</thead>
				<tbody id="tddata">
					<tr>
						<td colspan="5">
							좌측 메뉴 바에서 재고현황을 확인하고 싶은 영역을 선택하세요
						</td>
					</tr>
					
					
				</tbody>
			</table>
			</form>
			
			<!-- 페이지 -->
			<nav aria-label="Page navigation borderless example">
				<ul class="pagination pagination-borderless justify-content-end" id="PageNation">
					<!-- 페이지내이션이 javascript 코드에 의해 그려지는 위치 -->
				</ul>
			</nav>
			
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
				<button type="submit" form="taskForm" class="btn btn-primary px-5" id="submit_btn">등록</button>
				<button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달끝 -->



<!-- bottom.jsp -->
<%@include file="../common/bottom.jsp"%>
<script type="text/javascript">
var id;
var no;

//페이지 번호 클릭시 좌측사이드서 선택한 현재 위치정보를 갖고있기 위한 전역변수
var ware_no;
var area_no;
var rack_no;
var cell_no;

//페이징을 위한 전역변수
var pageNum = 1;
var amount = 10;
var searchWhatColumn = "";
var searchKeyword = "";

$(function(){
	
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
});


//사이드바메뉴 클릭시만 선택한 사이드바메뉴에 따른 하위구역 우측에 띄워준다
function clickFunction(clicked_id,w_no,a_no,r_no,c_no){
	pageNum = 1;
	id = clicked_id;
	showid = document.getElementById(clicked_id).getAttribute('href').substring(1); //등록수정삭제시 창고-셀 사이드바 보던 화면으로 가기 위한 변수
	no = document.getElementById(clicked_id).getAttribute('data-value');
	
	//클릭시 showid설정
	document.getElementById('showid').value = showid;
// console.log(id);
// console.log(showid);
// console.log(no);
	
	//만든 영역의 위치정보를 전역변수에 저장
	ware_no = w_no;
	area_no = a_no;
	rack_no = r_no;
	cell_no = c_no;
	
	//하단페이지번호도만들고 레코드도만듬
	requestRecord();
	
	/*ajax로 each 돌려서 우측 테이블td생성*/
// 	$.ajax({
// 		url : "/warehouse-detail/get-data-stock",
// 		type : "get",
// 		data : ({
// 			"id" : id,
// 			"no" : no,
// 			"ware_no" : w_no,
// 			"area_no" : a_no,
// 			"rack_no" : r_no,
// 			"cell_no" : c_no
// 		}),
// 		success : function(data){
			
// 			var mydata = JSON.parse(data);
// // console.log(mydata);
// 			$('#tddata *').remove();
// 			var tabledata = "";
// 			var mydatalen = mydata.length;

			

// console.log(mydatalen);
// console.log(pageNum);
// console.log(amount);
// 			if(mydatalen==0){
// 				tabledata +=	'<tr>'+
// 									'<td colspan="5">'+'현재 선택한 영역은 재고 물품이 없습니다.'+'</td>'+
// 								'</tr>';
// 			}else{
// 				$.each(mydata,function(i){
// 						tabledata +=	'<tr>'+
// 											'<td>'+(i+1)+'</td>'+
// 											'<td>'+mydata[i].lot_code+'</td>'+
// 											'<td><img width="100px" height="100px" src="${pageContext.request.contextPath }/resources/assets/img/item/'+mydata[i].image+'" ></td>'+
// 											'<td>'+mydata[i].name+'</td>'+
// 											'<td>'+mydata[i].amount+'</td>'+
// 										'</tr>';
// 				});
// 			}//else
// 			$("#tddata").append(tabledata);
// 		},//success
// 		error: function (request, status, error) {
// 	        console.log("code: " + request.status);
// 	        console.log("message: " + request.responseText);
// 	        console.log("error: " + error);
// 	    }
// 	});//ajax
};//clickFunction

/* 두번째 모달의 페이지네이션에서 번호 클릭시 다시 그리는 함수 */
$("#PageNation").on("click", "li a", function(e){
	e.preventDefault(); // 번호를 눌러도 페이지가 이동하지 않도록 a태그 기능 무력화
	pageNum = $(this).attr("href");
	
	requestRecord();
});





/* ajax로 레코드정보를 요청하는 부분 + 화면전환없이 레코드들을 그리는 부분 + 화면전환없이 페이지네이션을 그리는 부분 */
function requestRecord(){
	console.log("requestRecord의 mount"+amount)
	$.getJSON("/warehouse-detail/pages/"+ pageNum +"/" + amount+ "/" + ware_no + "/" + area_no + "/" + rack_no + "/" + cell_no
			+ "/" + searchWhatColumn + "/" + searchKeyword,  
			function(resdata){
		console.log("requestRecord서확인한resdata.list.length는"+resdata.list.length);
			console.log("list: " + resdata.list); 	  						// 페이지 하나의 레코드들이 담긴 객체
			console.log("getJSON밑의 totalCount: " + resdata.totalCount); 	// 검색조건으로 뽑힌 총 레코드 수
			console.log("getJSON밑의 cri: " + resdata.cri); 	  				// 검색에 사용된 기준정보가 담긴 객체
				
				makeRecord(resdata.list); 							// 레코드들을 그리는 함수
				paintPageNation(resdata.totalCount, resdata.cri); 	// 페이지네이션을 그리는 함수
				
			}).fail(function(xhr, status, err){
					alert("데이터 조회실패");
			});	
}





/* 받아온 레코드들 만든다 */
function makeRecord(list){
	$('#tddata *').remove();
		var retabledata = "";
		console.log("list.length는"+list.length);
		if(list.length==0){
			retabledata +=	'<tr>'+
								'<td colspan="5">'+'현재 선택한 영역은 재고 물품이 없습니다.'+'</td>'+
							'</tr>';
		}
		else{
			for(var i = 0, len = list.length || 0; i < len; i++){
				retabledata +=	'<tr>'+
									'<td>'+list[i].no+'</td>'+
									'<td>'+list[i].lot_code+'</td>'+
									'<td><img width="80px" height="80px" src="${pageContext.request.contextPath }/resources/assets/img/item/'+list[i].image+'" ></td>'+
									'<td>'+list[i].name+'</td>'+
									'<td>'+list[i].amount+'</td>'+
								'</tr>';
			}
		}
		$("#tddata").append(retabledata);
}





/* 페이지네이션을 그리는 함수 */
function paintPageNation(totalCount, cri){
	
	var str = ""; 
	
	var pageCount = 5; // 한번에 보여줄 페이지번호 개수 
	
	//pageNum에 따른 cri.amount 단위의 시작페이지, 끝페이지를 구함
	var endPageNum = Math.ceil(pageNum / pageCount) * pageCount;// javascript 에서 pageNum / cri.amount 결과는 그냥 0.1 
	var startPageNum = endPageNum - (pageCount-1);
	var lastPageNum = Math.ceil(totalCount / cri.amount	);
	
	var isNeedFirst = pageNum > 5;
	var isNeedPrev = (startPageNum != 1);
	var isNeedNext = false;
	var isNeedEnd = true; 
	
	//5단위의 endPageNum을 그대로 사용하면 안되는 경우 endPageNum을 다시구함 
	if(lastPageNum <= endPageNum){
		endPageNum = lastPageNum;
		isNeedEnd = false;
	}
	
	
	if(endPageNum < lastPageNum){
		isNeedNext = true;
	}
	
	// str을 만듬.
	str += "<ul class='pagination pull-right'>";
	
	if(isNeedFirst){
		str += "<li class='page-item'><a class='page-link d-flex align-items-center px-2' href='" + 1 +"'>";
		str += "<svg width='20' height='20' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20' fill='currentColor'>";
		str += "<path xmlns='http://www.w3.org/2000/svg' id='svg_1' clip-rule='evenodd' d='m9.49241,5.293a1,1 0 0 1 0,1.414l-3.293,3.293l3.293,3.293a1,1 0 0 1 -1.414,1.414l-4,-4a1,1 0 0 1 0,-1.414l4,-4a1,1 0 0 1 1.414,0z' fill-rule='evenodd'/>";
		str += "<path xmlns='http://www.w3.org/2000/svg' id='svg_2' clip-rule='evenodd' d='m15.48719,5.37988a1,1 0 0 1 0,1.414l-3.293,3.293l3.293,3.293a1,1 0 0 1 -1.414,1.414l-4,-4a1,1 0 0 1 0,-1.414l4,-4a1,1 0 0 1 1.414,0z' fill-rule='evenodd'/>";
		str += "</svg>";
		str += "</a></li>";
	}
	
	//이전 버튼 출력여부에 따라 버튼 표시
	if(isNeedPrev){
		str += "<li class='page-item'><a class='page-link d-flex align-items-center px-2' href='" + (startPageNum-1) +"'>";
		str += "<svg width='20' height='20' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20' fill='currentColor'>";
		str += "<path fill-rule='evenodd' d='M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z' clip-rule='evenodd'></path>";
		str += "</svg>";
		str += "</a></li>"; 
	}
	
	//가운데 숫자 출력
	for(var i = startPageNum; i <= endPageNum; i++){
		var active = (pageNum == i ? "active" : "");
		str += "<li class='page-item " + active +"'>" + "<a class='page-link' href='"+ i +"'>" + i + "</a></li>";
	}
	
	//다음 버튼 출력여부에 따라 버튼 표시
	if(isNeedNext){
		str += "<li class='page-item'><a class='page-link d-flex align-items-center px-2' href='" + (endPageNum + 1) +"'>";
		str += "<svg width='20' height='20' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20' fill='currentColor'>";
		str += "<path fill-rule='evenodd' d='M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z' clip-rule='evenodd'></path>";
		str += "</svg>";
		str += "</a></li>";
	}
	
	if(isNeedEnd){
		str += "<li class='page-item'><a class='page-link d-flex align-items-center px-2' href='" + lastPageNum +"'>";
		str += "<svg width='20' height='20' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20' fill='currentColor'>";
		str += "<path id='svg_1' clip-rule='evenodd' d='m4.29467,14.707a1,1 0 0 1 0,-1.414l3.293,-3.293l-3.293,-3.293a1,1 0 0 1 1.414,-1.414l4,4a1,1 0 0 1 0,1.414l-4,4a1,1 0 0 1 -1.414,0z' fill-rule='evenodd'/>";
		str += "<path id='svg_2' clip-rule='evenodd' d='m10.68001,14.87357a1,1 0 0 1 0,-1.414l3.293,-3.293l-3.293,-3.293a1,1 0 0 1 1.414,-1.414l4,4a1,1 0 0 1 0,1.414l-4,4a1,1 0 0 1 -1.414,0z' fill-rule='evenodd'/>";
		str += "</svg>";
		str += "</a></li>";
	}
	
	str += "</ul></div>";
	
	$("#PageNation").html(str);
}



</script>