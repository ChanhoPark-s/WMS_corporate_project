<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<script src="https://kit.fontawesome.com/4d5e8e1a50.js" crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<style>
table th {
	text-align: center;	
	font-size: 14px;
}

table td {
	text-align: center;
	font-size: 14px;
}

/* 한줄 색 칠하는 기능 */
#table1 tbody tr:hover {
	background-color: #EAEAEA;
}

/* 검색바 */
.btn_search {
	cursor: pointer;
	position: absolute;
	right: 7px;
	top: 50%;
	transform: translatey(-50%);
}

#search {
	position: relative;
}
</style>


<!-- 상단 -->

<%@include file="/WEB-INF/views/common/top.jsp" %>
        <div class="card">
          <div class="card-body">
          <!-- 상단바 start -->
            <div class="d-flex gap-1 mb-4 flex-wrap">
			<div class="d-flex gap-1 me-auto flex-wrap" style="height: 20px;">
				<button class="btn btn-primary d-inline-flex align-items-center gap-1"
					data-bs-toggle="modal" data-bs-target="#addOrderSheetModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd" />
                  </svg>
					발주 등록
				</button>
			</div>
			
			<div class="search">
			<form name="search" action="/list.ps" id="search">
			<table>
			<tr>
				<td>
					<select id="whatColumn" name="whatColumn" class="form-select" style="width: 200px;">
	                  <%
	                  String[] search = {"client_name","member_name","item_name"};
	                  String[] cate = {"거래처","담당자","품목명"};
	                  %>
	                  <c:set value="<%=search %>" var="s"></c:set>
	                  <c:set value="<%=cate %>" var="c"></c:set>
	                  <option>검색 선택</option>
	                  	<c:forEach begin="0" end="2" var="i">
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
		<!-- 상단바 end -->
            <div class="table-responsive my-1">
              <table class="table align-middle" id="table1">
                <thead>
                  <tr>
                    <th scope="col" style="display:none">발주번호</th>
                    <th scope="col">작성일자</th>
                    <th scope="col">담당자</th>
                    <th scope="col">발주처</th>
                    <th scope="col" nowrap>품목명</th>
                    <th scope="col">납기일자</th>
                    <th scope="col">총 구매단가</th>
                    <th scope="col" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="접수완료 - (발주중) - 판매완료">진행상태</th>
                    <th scope="col">기능</th>
                  </tr>
                </thead>
                <tbody>
                <!-- lists -->
                <c:forEach var="list" items="${lists}">
                  <tr class="tr" data-no=" ${list.no }">
                    <td style="display:none">
                          ${list.no }
                    </td>
                    <td>
                    <fmt:parseDate value="${list.day}" var="day" pattern="yyyy-MM-dd" />
					<fmt:formatDate value="${day}" pattern="yyyy-MM-dd" />
                    </td>
                    <td>${list.member_name}</td>
                    <td>${list.client_name }</td>
                    <td>
                    <span>
                    <c:set var="item_name" value="${fn:split(list.item_name,',')}" />
                    ${item_name[0] }
					<c:if test="${fn:length(item_name) > 1}">외 ${fn:length(item_name) - 1}개</c:if>
                    </span>
                    </td>
                    <td>
                    <fmt:parseDate value="${list.delivery_date}" var="delivery_date" pattern="yyyy-MM-dd" />
					<fmt:formatDate value="${delivery_date}" pattern="yyyy-MM-dd" />
                    </td>
                    <td>
                    <fmt:formatNumber value="${list.totalPrice}" pattern="#,###"/>원
                    </td>
                    <td>
                    <c:choose>
                    <c:when test="${list.status eq 0 }" >
                    <span class="badge bg-success" style="background-color: #FFBB00 !important">발주중</span>
                    </c:when>
                    <c:when test="${list.status eq 1 }">
                    <span class="badge bg-light text-muted">발주완료</span>
                    </c:when>
                    <c:when test="${list.status eq 2 }">
                    <span class="badge bg-light text-muted">취소됨</span>
                    </c:when>
                    <c:otherwise>오류</c:otherwise>
                    </c:choose>
                    </td>
                    <td>
                      <div class="btn-group btn-group-sm" role="group">
                          <!-- 삭제버튼 -->
                        <button type="button" class="btn btn-light d-flex text-danger delete" data-no="${list.no }"><svg width="17" height="17" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                          </svg></button>
                      </div>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
            <!-- paging -->
            <div align="center">
				${pageInfo.pagingHtml}
			</div>
          </div>
        </div>
        
        <br>
        
        <div class="card">
          <div class="card-body">
            <div class="table-responsive my-1">
              <table class="table align-middle">
                <thead>
                  <tr>
                    <th scope="col"></th>
                    <th scope="col">품목코드</th>
                    <th scope="col">품목명</th>
                    <th scope="col">발주수량</th>
                    <th scope="col">입고단가</th>
                    <th scope="col">합계</th>
                    <th scope="col">입고예정창고</th>
                    <th scope="col">진행상태</th>
                  </tr>
                </thead>
                <tbody id="detailList">
                <!-- lists -->
                  
                </tbody>
              </table>
            </div>
            
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
$(function(){
	document.getElementById('purchase_info').click();
})

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

/* 발주상세 조회 */
$('.tr').find('td').not('td:last-child').on('click',function(){
	$('#detailList *').remove();
	$.ajax({
        url: "detailList",
        type: "get",
        data: {
        	purchase_sheet_no : $(this).parent('.tr').data("no")
        },
        success: function(data){
        	console.log(data); 
        	str = "";
        	if(data.length == 0){
    			str += '<tr height="400px">'
    			+ '<td colspan="7" align="center"><br><br><i class="fa-regular fa-circle-xmark fa-4x"></i><br><br>검색된 결과가 없습니다</td>'
    			+ '</tr>'
    		}else{
    			
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
	        		+ "<td><i class='fa-solid fa-gift'></i></td>"
	        		+ '<td>'
	        		+ data[i].ITEM_Code
	                + '</td>'
	                + '<td>'
	                + data[i].ITEM_Name
	                + '</td>'
	                + '<td>'
	                + data[i].AMOUNT
	                + '개</td>'
	                + '<td>'
	                + numberWithCommas(data[i].IN_PRICE)
	                + '원</td>'
	                + '<td>'
	                + numberWithCommas(data[i].IN_PRICE*data[i].AMOUNT)
	                + '원</td>'
	                + '<td>'
	                + data[i].WARE_Name
	                + '</td>'
	                + '<td>'
	                + status(data[i].STATUS)
	                + '</td>'
	           	    + '</tr>'
        		
        		
        		});//each
    		}
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

/* 검색 */
function searchForm(){
	search.submit();
}

/* 삭제 */
$('.delete').click(function(){
	location.href='delete.ps?no='+$(this).data('no');
	
})
</script> 
