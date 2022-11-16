<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JS -->
<script type="text/javascript">
$(document).ready(function(){
	// id(#) = input 
	// class(.) = label
	
	//초기화
	$(".btn-light").on("click",function(){
		$(".modal2").val('');
	});
	
	
	$(".insertLot").on("click",function(){
		
	});
	
	//거래처 변경시 거래처 나머지 null
	$('select[name="client2"]').change(function(){
		
	});
	//품목코드, 품목명을 변경시 거래처,품목코드,품목명,입고단가,출고단가 변경
	$('select[name="item_name"],select[name="code"]').change(function(){
		$.ajax({
	        url: "item",
	        type: "post",
	        data: {
	        	no : $('option:selected',this).val()
	        },
	        success: function(data){
	        	//$('.modal2').val('');
	        	var mydata = JSON.parse(data); // <> parse()
	        	console.log(mydata); 
	        	//mydata.client_no
	        	$('select[name="client2"]').val(mydata.client_no).attr('selected','selected');
	        	$('select[name="code"]').val(mydata.no).attr('selected','selected');
	        	$('select[name="item_name"]').val(mydata.no).attr('selected','selected');
	        	$('input[name="in_price"]').val(mydata.in_price);
	        	$('input[name="out_price"]').val(mydata.out_price);
	        },
	        error: function(jqxhr, textStatus, errorThrown){
	            alert("err");
	            console.log(jqxhr);
	            console.log(textStatus);
	            console.log(errorThrown);
	        }
	  	}); 
	});
	
	//발주디테일추가
	$("#psDetail").on("click",function(){
		$.ajax({
	        url: "psDetail",
	        type: "post",
	        data: {
	        	form : $('#psDetailForm').serialize()
	        	},
	        success: function(data){
	        	console.log(data); 
	        	
	        	
	        	
	        },
	        error: function(jqxhr, textStatus, errorThrown){
	            alert("err");
	            console.log(jqxhr);
	            console.log(textStatus);
	            console.log(errorThrown);
	        }
	  	}); 
	});
});


</script>
<!--  모달 2-->
<div class="modal fade" id="choiceClientModal" tabindex="-2">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 id="modal-title">거래처 입력</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body" style="padding-bottom:0px">
						<div class="modal-footer border-0">
							<form style="margin:auto;text-align:center;" onsubmit="return false;">
								<div class="d-flex gap-1 me-auto flex-wrap">
									<!-- <input type="text" class="form-control" placeholder="Search Client"> -->
									<%
						                String[] search = {"code","name","owner"};
						                String[] cate = {"거래처코드","거래처명","대표자명"};
					                %>
		                  			<c:set value="<%=search %>" var="s"></c:set>
		                  			<c:set value="<%=cate %>" var="c"></c:set>
									
										<select id="clientWhatColumn" class="form-select" style="width: 140px;">
							                <option value="" selected>검색 선택</option>
							                <c:forEach begin="0" end="2" var="i">
							                <option value="${s[i] }"<c:if test="${searchvo.whatColumn== s[i] }">selected</c:if>>${c[i] }</option>
							                </c:forEach>
						              	</select>
						              	<input type="text" id="clientKeyword" class="form-control" value=<c:if test="${searchvo.keyword=='null' }"></c:if><c:if test="${searchvo.keyword!='null' }">"${searchvo.keyword }"</c:if>  placeholder="입력" style="width: 200px; height: 38px;">
										<button type="submit" class="btn btn-light" id="searchClientBtn"> 검색 </button>
								</div>			
							</form>	
						</div>
						<div class="table-responsive my-1">
							<table class="table align-middle">
								<thead>
									<tr>
										<th scope="col"></th>
										<th scope="col">거래처코드</th>
										<th scope="col">거래처명</th>
										<th scope="col">대표자명</th>
									</tr>
								</thead>
								<tbody id="clientSelectTbody">
									<!-- 클라이언트 레코드들이 javascript 코드에 의해 그려지는 위치 -->
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
				
			<div class="modal-footer border-0">
				<button type="button" class="btn btn-light" data-bs-target="#addPurchaseSheetModal" data-bs-toggle="modal" data-bs-dismiss="modal">돌아가기</button>
				<button class="btn btn-primary" data-bs-target="#addPurchaseSheetModal" data-bs-toggle="modal" data-bs-dismiss="modal" id="delivery_data">확인</button>
			</div>
		</div>
	</div>
</div>
        