<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JS --> 
<script type="text/javascript">
$(document).ready(function(){
	$(".insert,.update").on("click",function(){
		$(".form-control,.form-select,.cancel").val('');
	});
	
	$(".insert").on("click",function(){
		$(".modal-title").text("발주서등록");
	});
	
	$(".update").on("click",function(){
		$(".modal-title").text("발주서수정");
	});
	
	$(".insertLot").on("click",function(){
		str = '<tr>'
    		+ '<td>'
    		+ 1
            + '</td>'
            + '<td>'
            + 2
            + '</td>'
            + '<td>'
            + 3
            + '</td>'
            + '<td>'
            + 4
            + '</td>'
            + '<td>'
            + 5
            + '</td>'
            + '<td>'
            + 6
            + '</td>'
            + '<td>'
            + 7
            + '</td>'
            + '<td>'
            + 8
            + '</td>'
       	    + '</tr>';
		
       	$('#addItem').append(str);
	});
});
</script>
<script type="text/javascript">
	/* 왼쪽 카테고리창이 해당화면에 맞게 펼쳐지게 하는 코드 */
	$(function(){ 
		document.getElementById('basicinfo').click();
	});
</script>


<!-- 거래처를 선택하는 두번째 모달처리 -->
<script type="text/javascript">
	var subject = ""; // member or client 이 값은 두번째 모달로 넘어가는 버튼에 의해 변경된다. 
	var pageNum = 1;
	var amount = 10;
	var clientWhatColumn = "";
	var clientKeyword = "";

	/* 두번째 모달에서 첫번째 모달로 데이터를 옮기는 코드 */
	$("#delivery_data").on("click", function(e){
		var clientNo = $('input[name=clientRadio]:checked').parent().next().text();
		var clientCode = $('input[name=clientRadio]:checked').parent().next().next().text();
		var clientName = $('input[name=clientRadio]:checked').parent().next().next().next().text();
		
		$("input[name='client_no']").val(clientNo);
		$("#client_code").val(clientCode);
		$("#client_name").val(clientName);
	});
	
	
	/* 첫번째 모달에서 거래처 선택이 눌렸을 때 이동한 두번째 모달창에서 데이터를 요청하고 관련 화면을 그리는 부분 */
	$("#choiceClientBtn").on("click", function(e){
		/*** 여기서 선택박스 초기화 하는거 해줘야함 ***/
		$("#clientKeyword").val("");
		clientWhatColumn = "";
		clientKeyword = "";
		
		requestClientRecord();
	});
	
	/* ajax로 거래처정보를 요청하는 부분 + 화면전환없이 레코드들을 그리는 부분 + 화면전환없이 페이지네이션을 그리는 부분 */
	function requestClientRecord(){
		console.log("요청url" + "/basicinfo/client/pages/"+ pageNum +"/" + amount + "/" + clientWhatColumn + "/" + clientKeyword)
		$.getJSON("/basicinfo/client/pages/"+ pageNum +"/" + amount + "/" + clientWhatColumn + "/" + clientKeyword,  
 			function(resdata){
				console.log("list: " + resdata.list); 	  			// 1페이지 레코드들이 담긴 객체
 				console.log("totalCount: " + resdata.totalCount); 	// 검색조건으로 뽑힌 총 레코드 수
 				console.log("cri: " + resdata.cri); 	  			// 검색에 사용된 기준정보가 담긴 객체
 				
 				paintClientRecord(resdata.list); 			// 레코드들을 그리는 함수
 				paintClientPageNation(resdata.totalCount, resdata.cri); 	// 페이지네이션을 그리는 함수
 				
 			}).fail(function(xhr, status, err){
 					alert("거래처 조회실패");
 			});	
	}
	
	/* 거래처 선택 모달의 거래처 레코드들을 그리는 함수 */
	function paintClientRecord(list){

			var str = "";
			
			for(var i = 0, len = list.length || 0; i < len; i++){
				str += "<tr>";
				str += "<td><input class='form-check-input' type='radio' name='clientRadio' value=" + list[i].name + "></td>";
				str += "<td style='display:none'>" + list[i].no +"</td>";
				str += "<td>" + list[i].code +"</td>";
				str += "<td>" + list[i].name +"</td>";
				str += "<td>" + list[i].owner +"</td>";
				str += "</tr>";
			}
			
			if(list.length == 0){
				str = "<tr><td colspan='5' style='text-align:center'>검색결과가 없습니다</td></tr>";
			}
			
			$("#clientSelectTbody").html(str);
	}
	
	/* 거래처 선택 모달의 페이지네이션을 그리는 함수 */
	function paintClientPageNation(totalCount, cri){
		
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
		
		$("#clientPageNation").html(str);
	}
	
	/* 거래처 선택 모달의 페이지네이션에서 번호 클릭시 다시 그리는 함수 */
	$("#clientPageNation").on("click", "li a", function(e){
		e.preventDefault(); // 번호를 눌러도 페이지가 이동하지 않도록 a태그 기능 무력화
		pageNum = $(this).attr("href");
		
		requestClientRecord();
	});
	
	/* 거래처 선택 모달에서 사용자가 검색을 시도할 때 이를 처리하는 부분*/
	$("#searchClientBtn").on("click", function(e){
		clientWhatColumn = $("#clientWhatColumn").val();
		clientKeyword = $("#clientKeyword").val();
		console.log("clientWhatColumn: " + clientWhatColumn);
		console.log("clientKeyword: " + clientKeyword);
		
		if(clientWhatColumn == ""){
			alert("검색 조건을 선택하세요");
			return;
		}
	
		requestClientRecord();
	});
</script>

<!--모달1-->
<div class="modal fade" id="addUserModal" tabindex="-1">
   <div class="modal-dialog modal-dialog-scrollable">
     <div class="modal-content">
       <div class="modal-header border-0">
         <h5 class="modal-title">발주서등록</h5>
         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
       </div>
       <div class="modal-body">
           <div class="mb-3">
             <label for="delivery_date">납기일자</label>
             <div class="input-group datepicker-wrap">
	             <input type="date" class="form-control" autocomplete="off" name="delivery_date" >
	             <div class="invalid-feedback">1</div>
             </div>
           </div>
           <div class="row">		
				<div class="col-sm-3">		
					<label for="userFullname" class="form-label">코드</label>
					<input type="text" id="member_code" class="form-control" readonly>
				</div>
				<div class="col-sm-5">		
					<label for="userFullname" class="form-label">담당자명</label>
					<input type="text" id="member_name" class="form-control" readonly>
					<input type="hidden" name="member_no" class="form-control" readonly>
				</div>
				<div class="col-sm-4">	
					<label for="userFullname" class="form-label">&nbsp;&nbsp;</label>
					<button type="button" class="btn btn-primary" style="display:block" data-bs-target="#choiceClientModal" data-bs-toggle="modal" data-bs-dismiss="modal" id="choiceMembertBtn">담당자 선택</button>	
				</div>
			</div>
			
			<div class="row">		
				<div class="col-sm-3">		
					<label for="userFullname" class="form-label">코드</label>
					<input type="text" id="client_code" class="form-control" readonly>
				</div>
				<div class="col-sm-5">		
					<label for="userFullname" class="form-label">거래처명</label>
					<input type="text" id="client_name" class="form-control" readonly>
					<input type="hidden" name="client_no" class="form-control" readonly>
				</div>
				<div class="col-sm-4">	
					<label for="userFullname" class="form-label">&nbsp;&nbsp;</label>
					<button type="button" class="btn btn-primary" style="display:block" data-bs-target="#choiceClientModal" data-bs-toggle="modal" data-bs-dismiss="modal" id="choiceClientBtn">거래처 선택</button>	
				</div>
			</div>		
           
           <!-- 새로운페이지  -->
      <div class="card">
      <div class="card-body">
        <div class="d-flex gap-1 mb-4 flex-wrap">
          <div class="d-flex gap-1 me-auto flex-wrap ">
          </div>
          <button type="button" class="btn btn-primary d-inline-flex align-items-center gap-1 insertLot">
              품목추가
            </button>
        </div>
        <div class="table-responsive my-1">
          <table class="table align-middle table1">
            <thead>
              <tr>
                <th scope="col">거래처</th>
                <th scope="col">품목코드</th>
                <th scope="col">품목명</th>
                <th scope="col">입고단가</th>
                <th scope="col">출고단가</th>
                <th scope="col">발주수량</th>
                <th scope="col">입고예정창고</th>
                <th scope="col">기능</th>
              </tr>
            </thead>
            <tbody id="addItem">
              
            </tbody>
          </table>
        </div>
        </div>
        </div>
        <div class="modal-footer border-0">
	      <button type="button" class="btn btn-light cancel" data-bs-dismiss="modal">취소</button>
	      <button type="submit" form="taskForm" class="btn btn-primary px-5">등록</button>
    	</div>
       </div>
    
  </div>
</div>
</div>