<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/common/top.jsp" %>
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
                <a href="modal2.ps"></a>
              	</form>
              </div>
              <button class="btn btn-primary d-inline-flex align-items-center gap-1 insert" data-bs-toggle="modal" data-bs-target="#addOrderSheetModal" >
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd" />
                  </svg>
                  발주추가
                </button>
                <div class="dropdown">
                  <button class="btn btn-light d-inline-flex align-items-center gap-1 dropdown-toggle no-caret" type="button" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                      <path fill-rule="evenodd" d="M3 3a1 1 0 011-1h12a1 1 0 011 1v3a1 1 0 01-.293.707L12 11.414V15a1 1 0 01-.293.707l-2 2A1 1 0 018 17v-5.586L3.293 6.707A1 1 0 013 6V3z" clip-rule="evenodd" />
                    </svg>
                    발주취소
                  </button>
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
                    <th scope="col">거래처</th>
                    <th scope="col">담당자</th>
                    <th scope="col">품목명</th>
                    <th scope="col" nowrap>등록일자</th>
                    <th scope="col" nowrap>납기일자</th>
                    <th scope="col">상태</th>
                    <th scope="col">기능</th>
                  </tr>
                </thead>
                <tbody>
                <!-- lists -->
                <c:forEach var="list" items="${lists}">
                  <tr class="tr" data-no=" ${list.no }">
                    <td>
                      <div>
                        <input class="form-check-input" type="checkbox" value="">
                      </div>
                    </td>
                    <td>
                          ${list.no }
                    </td>
                    <td>${list.client_name }</td>
                    <td>${list.member_name}</td>
                    <td>
                    <span class="badge bg-light text-muted">
                    <c:set var="item_name" value="${fn:split(list.item_name,',')}" />
                    ${item_name[0] }
					<c:if test="${fn:length(item_name) > 1}">외 ${fn:length(item_name) - 1}개</c:if>
                    </span>
                    </td>
                    <td>
                    <fmt:parseDate value="${list.day}" var="day" pattern="yyyy-MM-dd" />
					<fmt:formatDate value="${day}" pattern="yyyy-MM-dd" />
                    </td>
                    <td>
                    <fmt:parseDate value="${list.delivery_date}" var="delivery_date" pattern="yyyy-MM-dd" />
					<fmt:formatDate value="${delivery_date}" pattern="yyyy-MM-dd" />
                    </td>
                    <td>
                    <c:choose>
                    <c:when test="${list.status eq 0 }">발주중</c:when>
                    <c:when test="${list.status eq 1 }">발주완료</c:when>
                    <c:when test="${list.status eq 2 }">취소</c:when>
                    <c:otherwise>오류</c:otherwise>
                    </c:choose>
                    </td>
                    <td>
                      <div class="btn-group btn-group-sm" role="group">
                        <!-- 수정버튼 -->
                        <button type="button" class="btn btn-light d-flex update" data-bs-toggle="modal" data-bs-target="#addUserModal" data-no="${list.no }">
                        <svg width="17" height="17" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                          </svg></button>
                          <!-- 삭제버튼 -->
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
        
        <br>
        
        <div class="card">
          <div class="card-body">
            <div class="table-responsive my-1">
              <table class="table align-middle">
                <thead>
                  <tr>
                    <th scope="col">
                      <div>
                        <input class="form-check-input" type="checkbox" value="">
                      </div>
                    </th>
                    <th scope="col">품목코드</th>
                    <th scope="col">품목명</th>
                    <th scope="col">입고단가</th>
                    <th scope="col">발주수량</th>
                    <th scope="col">입고예정창고</th>
                    <th scope="col">상태</th>
                  </tr>
                </thead>
                <tbody id="detailList">
                <!-- lists -->
                  
                </tbody>
              </table>
            </div>
            <!-- 페이지내이션 -->
			<nav aria-label="Page navigation borderless example">
				<ul class="pagination pagination-borderless justify-content-end" id="clientPageNation">
					<!-- 페이지내이션이 javascript 코드에 의해 그려지는 위치 -->
				</ul>
			</nav>
          </div>
        </div>

        <!-- 모달1 modal1 -->
		<%@include file="/WEB-INF/views/purchase_sheet/modal.jsp" %>

		<%@include file="/WEB-INF/views/purchase_sheet/modal2.jsp" %>
        <!-- end modal -->
        

	<!-- Main footer -->
	<%@include file="/WEB-INF/views/common/bottom.jsp" %>
    <!-- /Main footer -->
<script type="text/javascript">
/* 1,000 숫자표기 함수 */
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

/* 발주상세 조회 */
$('.tr').on('click',function(){
	$('#detailList *').remove();
	$.ajax({
        url: "detailList",
        type: "get",
        data: {
        	purchase_sheet_no : $(this).data("no")
        },
        success: function(data){
        	console.log(data); 
        	str = "";
        	$.each(data,function(i){
        		function status(status){
        			if(status == 0){
        				return "입고예정";
        			}else if(status == 1){
        				return "입고완료";
        			}else{
        				return "취소";
        			}
        		}
        		
        		str += '<tr>'
        		+ '<td>'
        		+ 	'<div>'
        		+ 		'<input class="form-check-input" type="checkbox" value="">'
        		+ 	'</div>'
        		+ '</td>'
        		+ '<td>'
        		+ data[i].ITEM_Code
                + '</td>'
                + '<td>'
                + data[i].ITEM_Name
                + '</td>'
                + '<td>'
                + numberWithCommas(data[i].IN_PRICE)
                + '원</td>'
                + '<td>'
                + data[i].AMOUNT
                + '개</td>'
                + '<td>'
                + data[i].WARE_Name
                + '</td>'
                + '<td>'
                + status(data[i].STATUS)
                + '</td>'
           	    + '</tr>'
        		
        	});
        	$('#detailList').append(str);
        },
        error: function(jqxhr, textStatus, errorThrown){
            alert("err");
            console.log(jqxhr);
            console.log(textStatus);
            console.log(errorThrown);
        } 
  	});
});
</script> 
