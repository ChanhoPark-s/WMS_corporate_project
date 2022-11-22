<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- top.jsp -->
<%@include file="../../common/top.jsp"%>
<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<style>
table th {
	text-align: center;	
	font-size: 14px;
}

table td {
	text-align: center;
	font-size: 14px;
}

#table1 tbody tr:hover {
	background-color: #EAEAEA;
}
</style>
<script type="text/javascript">
	var del_no;
	var update_no;
	var order_no;
	var member_no;
	var day;
	/* 전역변수 */
	var secondModalName = ""; 	// member or product 이 값은 두번째 모달로 넘어가는 버튼에 의해 변경된다. 
	var pageNum = 1;
	var amount = 10;
	var searchWhatColumn = "";
	var searchKeyword = "";
	var clickedLocation; 		// 두번째 모달에서 품목 선택 후 데이터를 옮겨올 곳을 기억하기 위한 변수 
	
	$(document)
			.ready(
					function() {
						$("button[id='update_Sold']").click(function() {
							$("h5[id='modal-title']").text("판매 수정");
							$("input[id='no']").attr('value', update_no)
							$("input[id='order_no']").attr('value', order_no)
							$("input[id='member_no']").attr('value', member_no)
							$("input[id='day']").attr('value', day)
							$("#Sold_Submit").hide();
							$("#Sold_Update_Submit").show();
						});
						$("button[id='insert_Sold']").click(function() {
							$("h5[id='modal-title']").text("판매 등록");
							
							$("input[name='order_no']").val("");
							$("input[name='member_name']").val("");
							$("input[name='member_no']").val("");
							$("input[name='day']").val("");
							$("input[name='item_code']").val("");
							$("input[name='amount']").val("");
							$("input[name='sell_price']").val("");
							$("input[name='lot_code']").val("");
							
							$("#Sold_Update_Submit").hide();
							$("#Sold_Submit").show();
							
						});
						$("button[id='Sold_Submit']").click(
								function() {
									$("#sell_Detail_Insert_Area").hide();
									$("form[id='taskForm_add']").attr('action',
											'/sell/origin/insert').submit();
								});
						$("button[id='Sold_Update_Submit']").click(
								function() {
									$("form[id='taskForm']").attr(
											'action',
											'/sell/origin/update?no='
													+ update_no).submit();
								});
						$("button[id='insert_Sold_Detail']").click(function() {
							$("h5[id='modal-title2']").text("판매 상세 등록");
							$("#Sold_Detail_Update_Submit").hide();
							$("#Sold_Detail_Submit").show();
							$("#sell_Detail_Insert_Area").show();
						});
						$("button[id='update_Sold_Detail']").click(function() {
							$("h5[id='modal-title']").text("판매 상세 수정");
							$("#Sold_Detail_Submit").hide();
							$("#Sold_Detail_Update_Submit").show();
						});
						$("button[id='Sold_Detail_Submit']").click(function() {
							$("#item_no").val($("#item_no2").val());
							$("#amount").val($("#amount2").val());
							$("#sell_price").val($("#sell_price2").val());
							$("#lot_code").val($("#lot_code2").val());
							//두번쨰 모달에 입력되어 있던 값 초기화
							$("item_no2").val("");
							$("amount2").val("");
							$("lot_code2").val("");
							$("sell_price2").val("");
						});
						$("button[id='insert_Sold_Detaill']")
								.click(
										function() {
											var str = "";
											str += "<div id='sell_Detail_Insert_Area'>";
											str += "<div id='detail_Insert_Area'>";
											str += "<div class='row'>";
											str += "<input type='hidden' name='item_no' class='form-control' readonly>";
											str += "<div class='mb-3' style='width: 300px;'>";
											str += "<label for='userFullname' class='form-label'>품목코드</label>";
											str += "<input type='text' class='form-control choiceItemBtn' data-bs-target='#secondModal' data-bs-toggle='modal' data-bs-dismiss='modal' readonly>";
											str += "</div>";
											str += "<div class='col-sm-4'>";
											str += "<label for='userFullname' class='form-label'>&nbsp;&nbsp;</label>";
											str += "<button type='button' class='btn btn-primary' style='display: block' data-bs-target='#secondModal' data-bs-toggle='modal' data-bs-dismiss='modal' id='choiceClientBtn'>품목 선택</button>";
											str += "</div></div>";
											str += "<div class='row'>";
											str += "<div class='col-sm-4' style='width: 227px;'>";
											str += "<label for='amount' class='form-label'>판매 수량</label>";
											str += "<input type='text' class='form-control' id='amount' name='amount' placeholder='판매수량'>";
											str += "</div>";
											str += "<div class='col-sm-4' style='width: 227px;'>";
											str += "<label for='sell_price' class='form-label'>판매 단가</label>";
											str += "<input type='text' class='form-control' id='sell_price' name='sell_price' placeholder='판매단가' readonly>";
											str += "</div></div>";
											str += "<div class='row'>";
											str += "<div class='col-12'>";
											str += "<label for='lot_code' class='form-label'>로트 번호</label>";
											str += "<input type='text' name='lot_code' class='form-control' id='lot_code' required>";
											str += "</div></div>";
											str += "<br>";
											str += "<div class='row'>";
											str += "<div class='mb-3'>";
											str += "<label for='userFullname' class='form-label'>&nbsp;&nbsp;</label>";
											str += "<button type='button' style='float:right;' form='taskForm' class='btn btn-primary delete_detail' id='delete_detail2'>삭제</button>";
											str += "</div></div></div><hr>";
											$("#sell_Detail_Insert_Area")
													.after(str);
										});
						$('#delete_detail').click(function() {
							$("#sell_Detail_Insert_Area").next().remove();
						});
						$("#detail_Insert_Area")
								.on(
										"click",
										"#delete_detail2",
										function(e) {
											$(this).parent().parent().remove();
										});
						/* $("#delete_detail2").click(function() {
							$(this).parent().parent().remove();
						}); */
						/* 첫번째 모달에서 담당자 선택이 눌렸을 때 이동한 두번째 모달창에서 데이터를 요청하고 관련 화면을 그리는 부분 */
						$("#choiceMemberBtn").on("click", function(e){
							
							pageNum = 1;
							
							// 두번째 모달에서 그려내야할 정보를 지정
							secondModalName = "member";
							console.log("secondModalName: " + secondModalName);
								
							// 두번째 모달의 제목을 지정
							$("#second-modal-title").text("담당자 입력");
							
							// 두번째 모달의 select의 option을 그려내는 코드
							var str = "";
							str += "<option value='' selected>검색 선택</option>";
							str += "<option value='dep'>부서</option>";
							str += "<option value='rank'>직급</option>";
							str += "<option value='name'>이름</option>";
							$("#searchWhatColumn").html(str);
							
							// 초기화 코드
							$("#searchKeyword").val("");
							searchWhatColumn = "";
							searchKeyword = "";
							
							// 두번째 모달의 테이블의 th를 그려내는 코드
							var str = "";
							str += "<tr>";
							str += "<th scope='col'></th>";
							str += "<th scope='col'>부서</th>";
							str += "<th scope='col'>직급</th>";
							str += "<th scope='col'>이름</th>";
							str += "</tr>";
							$("#secondModalThead").html(str);	
							
							// 두번째 모달의 테이블의 레코드를 그려내는 코드
							requestClientRecord();
						});
				
	
						 $("#detail_Insert_Area").on("click", "#choiceItemBtn",function(e){
							
						
							pageNum = 1;
							
							clickedLocation = $(this); // 품목입력을 위해 누른 input 의 위치 저장
							console.log("clickedLocation: " + clickedLocation);
							
							// 두번째 모달에서 그려내야할 정보를 지정
							secondModalName = "item";
							console.log("secondModalName: " + secondModalName);
								
							// 두번째 모달의 제목을 지정
							$("#second-modal-title").text("상품 입력");
							
							// 두번째 모달의 select의 option을 그려내는 코드
							var str = "";
							str += "<option value='' selected>검색 선택</option>";
							str += "<option value='code'>품목코드</option>";
							str += "<option value='name'>품목명</option>";
							str += "<option value='client_name'>취급처명</option>";
							$("#searchWhatColumn").html(str);
							
							// 초기화 코드
							$("#searchKeyword").val("");
							searchWhatColumn = "";
							searchKeyword = "";
							
							// 두번째 모달의 테이블의 th를 그려내는 코드
							var str = "";
							str += "<tr>";
							str += "<th scope='col'></th>";
							str += "<th scope='col'>품목코드</th>";
							str += "<th scope='col'>품목명</th>";
							str += "<th scope='col'>취급처명</th>"; // = 발주처
							str += "</tr>";
							$("#secondModalThead").html(str);	
							
							// 두번째 모달의 테이블의 레코드를 그려내는 코드
							requestClientRecord();
						});
							/* 두번째 모달의 페이지네이션에서 번호 클릭시 다시 그리는 함수 */
							$("#modalPageNation").on("click", "li a", function(e){
								e.preventDefault(); // 번호를 눌러도 페이지가 이동하지 않도록 a태그 기능 무력화
								pageNum = $(this).attr("href");
								
								requestClientRecord();
							});
							
							/* 두번째 모달에서 사용자가 검색을 시도할 때 이를 처리하는 부분*/
							$("#searchBtn").on("click", function(e){
								searchWhatColumn = $("#searchWhatColumn").val();
								searchKeyword = $("#searchKeyword").val();
								console.log("searchWhatColumn: " + searchWhatColumn);
								console.log("searchKeyword: " + searchKeyword);
								
								if(searchWhatColumn == ""){
									alert("검색 조건을 선택하세요");
									return;
								}
							
								requestClientRecord();
							});
							/* 두번째 모달에서 첫번째 모달로 데이터를 옮기는 코드 */
							$("#delivery_data").on("click", function(e){
							
								if(secondModalName == "member"){
									var memberNo = $('input[name=clientRadio]:checked').parent().next().text();
									var memberName = $('input[name=clientRadio]:checked').parent().next().next().next().next().text();
									
									console.log(memberNo);
									console.log(memberName);
									
									$("input[name='member_no']").val(memberNo);
									$("#choiceMemberBtn").val(memberName);
									
									
								}	
								
								else if(secondModalName == "item"){
									var itemNo = $('input[name=clientRadio]:checked').parent().next().text();
									var itemCode = $('input[name=clientRadio]:checked').parent().next().next().text();
									var itemName = $('input[name=clientRadio]:checked').parent().next().next().next().text();
									var itemClientName = $('input[name=clientRadio]:checked').parent().next().next().next().next().text();
										
									console.log(itemNo);
									console.log(itemCode);
									console.log(itemName);
									console.log(itemClientName);
									
									clickedLocation.parent().parent().find('input[name=item_no]').val(itemNo);
									$("input[name='item_code']").val(itemCode);
									
									
									var form = {'itemNo':itemNo};
									/* 상품을 선택했을 때, 자동으로 단가를 불러오는 코드 */
				        $.ajax({
							            url: "/basicinfo/item/getPrice",
							            type: "POST",
							            data: form,
							            dataType: 'text',
							            success: function(data){
							            	$("input[name='sell_price']").val(data);
							            },
							            error: function(){
							                alert("데이터 통신 실패");
							            }
							        });				        
				        			/* 상품을 선택했을 때, 자동으로 로트번호를 불러오는 코드
				        $.ajax({
							            url: "/basicinfo/lot/getLot",
							            type: "POST",
							            data: form,
							            dataType: 'json',
							            success: function(data){
							            	alert(data);
							            },
							            error: function(){
							                alert("로트 데이터 통신 실패");
							            }
							        });
				        */
				        
				        
				        
				        
				       				requestLotRecord(itemNo);
								}
								secondModalName = ""; 
							});
	
	});
	function goModal2(no, order, member, daay) {
		update_no = no;
		order_no = order;
		member_no = member;
		day = daay;
	}
	function goModal(no) {
		del_no = no;
	}
	function goDel() {
		location.href = "/sell/origin/delete?no=" + del_no;
	}
	function goUpdate() {
		location.href = "/sell/origin/update?no=" + update_no + "&order_no="
				+ order_no + "&member_no=" + member_no + "&day=" + day;
	}
	
	function paintRecord(list){
		var str = "";
		
		if(secondModalName == "member"){
			for(var i = 0, len = list.length || 0; i < len; i++){
				str += "<tr>";
				str += "<td><input class='form-check-input' type='radio' name='clientRadio' value=" + list[i].name + "></td>";
				str += "<td style='display:none'>" + list[i].no +"</td>";
				str += "<td>" + list[i].dep_name +"</td>";
				str += "<td>" + list[i].rank_name +"</td>";
				str += "<td>" + list[i].name +"</td>";
				str += "</tr>";
			}
		}
		
		
		else if(secondModalName == "item"){
			for(var i = 0, len = list.length || 0; i < len; i++){
				str += "<tr>";
				str += "<td><input class='form-check-input' type='radio' name='clientRadio' value=" + list[i].name + "></td>";
				str += "<td style='display:none'>" + list[i].no +"</td>";
				str += "<td>" + list[i].code +"</td>";
				str += "<td>" + list[i].name +"</td>";
				str += "<td>" + list[i].client_name +"</td>";
				str += "</tr>";
			}
		}
		
		if(list.length == 0){
			str = "<tr><td colspan='5' style='text-align:center'>검색결과가 없습니다</td></tr>";
		}
		
		$("#secondModalTbody").html(str);
}
	
	/* ajax로 두번째 모달에서 보여줄 레코드정보를 요청하는 부분 + 화면전환없이 레코드들을 그리는 부분 + 화면전환없이 페이지네이션을 그리는 부분 */
	function requestClientRecord(){
		console.log("요청url : " + "/basicinfo/" + secondModalName + "/pages/"+ pageNum +"/" + amount + "/" + searchWhatColumn + "/" + searchKeyword)
		$.getJSON("/basicinfo/" + secondModalName + "/pages/"+ pageNum +"/" + amount + "/" + searchWhatColumn + "/" + searchKeyword,  
 			function(resdata){
				console.log("list: " + resdata.list); 	  			// 1페이지 레코드들이 담긴 객체
 				console.log("totalCount: " + resdata.totalCount); 	// 검색조건으로 뽑힌 총 레코드 수
 				console.log("cri: " + resdata.cri); 	  			// 검색에 사용된 기준정보가 담긴 객체
 				
 				paintRecord(resdata.list); 							// 레코드들을 그리는 함수
 				paintPageNation(resdata.totalCount, resdata.cri); 	// 페이지네이션을 그리는 함수
 				
 			}).fail(function(xhr, status, err){
 					alert("데이터 조회실패");
 			});	
	}
	
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
		
		$("#modalPageNation").html(str);
	}
	
 	function requestLotRecord(itemNo){	
		console.log("요청url : " + "/basicinfo/lotRest/getLot/" + itemNo);
		$.getJSON("/basicinfo/lotRest/getLot/" + itemNo , 
 			function(list){
				console.log("list: " + list);
				paintLotRecord(list);
 			}).fail(function(xhr, status, err){
 					alert("데이터 조회실패");
 			}); 
	}
	
   	function paintLotRecord(list){

 	 	var str = "";
 		if(secondModalName == "item"){
    		for(var i = 0, len = list.length || 0; i < len; i++){
    			str += "<option value='" + list[i].code + "'>";
				str += list[i].code + "</option>";
			}
    	}
		 
		if(list.length == 0){
			str += "<option value=''>품목과 일치하는 로트번호가 없습니다.</option>";
		} 
		$("#getLotCode").html(str);
	}
	
</script>

<!-- 리스트 화면에서 클릭시 아래 Detail 레코드들을 가져와 뿌려주는 코드 -->
<script type="text/javascript">
	$(function(){
		
		/* 비동기로 하단의 상세품목을 불러와 출력해주는 부분 */
		$("#table1 tbody tr").on("click", function(){
			// 클릭된 수주서의 no 번호
			var clickedMainNo = $(this).children("td")[0].innerHTML;
			console.log("clickedMainNo: " + clickedMainNo);
			
			console.log("요청url : " + "/sell/origin/detail/more/" + clickedMainNo);
			$.getJSON("/sell/origin/detail/more/" + clickedMainNo,  
	 			function(list){
					console.log("list: " + list);
					
					$("#table2 tbody").empty();
					
					for(var i = 0, len = list.length || 0; i < len; i++){
						
						var str = "";
						 
						str += "<tr>";
						str += "<td style='display:none'>" + list[i].no + "</td>";
						str += "<td style='display:none'>" + list[i].item_no + "</td>";
						str += "<td style='text-align: center'>" + list[i].code + "</td>";
						str += "<td style='text-align: center'>" + list[i].name + "</td>";
						str += "<td style='text-align: center'>" + list[i].lot_code + "</td>";
						str += "<td style='text-align: center'>" + list[i].amount + "</td>";
						str += "<td style='text-align: center'>" + list[i].sell_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원</td>";
						str += "<td style='text-align: center'>" + (list[i].amount * list[i].sell_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원</td>";
						str += "</tr>";
						
						$("#table2 tbody").append(str);
					}
	 				
	 			}).fail(function(xhr, status, err){
	 					alert("데이터 조회실패");
	 			});
			
			
		});
		
		
	});
</script>

<style>
#button_sell {
	float: right;
}
</style>
<div class="main-body">
	<div class="card">
		<div class="card-body">
			<div class="d-flex gap-1 mb-4 flex-wrap" style="height:38px">
				<div class="d-flex gap-1 me-auto flex-wrap" style="height:38px">
					<button
						class="btn btn-primary d-inline-flex align-items-center gap-1"
						data-bs-toggle="modal" data-bs-target="#Sold_Product_Add_Modal"
						id="insert_Sold">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
							fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
								d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
								clip-rule="evenodd"></path>
                  </svg>
						출고 등록
					</button>
				</div>
				
				<div class="search" >
				<form name="search" action="/basicinfo/lot/list" id="search">
				<table>
				<tr>
					<td>
						<select id="whatColumn" name="whatColumn" class="form-select" style="width: 200px;" id="whatColumn" >
		                  <%
		                  String[] search = {"code","name"};
		                  String[] cate = {"로트번호","상품명"};
		                  %>
		                  		<c:set value="<%=search %>" var="s"></c:set>
		                  		<c:set value="<%=cate %>" var="c"></c:set>
		                  		<option value="">검색 선택</option>
		                  	<c:forEach begin="0" end="1" var="i">
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
			
			
		</div>
		<div class="table-responsive my-1">
			<table class="table align-middle" id="table1">
				<thead>
					<tr>
						<th scope="col" style="text-align: center">주문서 번호</th>
						<th scope="col" style="text-align: center">담당자 번호</th>
						<th scope="col" style="text-align: center">판매 날짜</th>
						<th scope="col" style="text-align: center">Actions</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="i" items="${lists}">
						<tr>
							<td style="display: none;">${i.no}</td>
							<td style="text-align: center">${i.order_no}</td>
							<td style="text-align: center">${i.name}</td>

							<fmt:parseDate var="inputDay" value="${i.day}"
								pattern="yyyy-MM-dd" />
							<fmt:formatDate value="${inputDay}" var="input"
								pattern="yyyy-MM-dd" />
							<td nowrap style="text-align: center">${input}</td>
							<td style="text-align: center">
								<!-- 수정 시작 -->
								<div class="btn-group btn-group-sm" role="group">
									<button type="button" class="btn btn-light d-flex"
										data-bs-toggle="modal" id="update_Sold"
										onclick="goModal2('${i.no}','${i.order_no}','${i.member_no}','${input}')"
										data-bs-target="#Sold_Product_Add_Modal">
										<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
											fill="none" viewBox="0 0 24 24" stroke="currentColor"
											aria-hidden="true">
                            <path stroke-linecap="round"
												stroke-linejoin="round" stroke-width="2"
												d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                          </svg>
									</button>
									<!-- 수정 끝 -->
									<!-- 삭제 시작 -->
									<button type="button" class="btn btn-light d-flex text-danger"
										data-bs-toggle="modal" id="delete_Sold"
										onclick="goModal('${i.no}')"
										data-bs-target="#delete_Sold_modal">
										<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
											fill="none" viewBox="0 0 24 24" stroke="currentColor"
											aria-hidden="true">
                            <path stroke-linecap="round"
												stroke-linejoin="round" stroke-width="2"
												d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                          </svg>
									</button>
									<!-- 삭제 끝 -->
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
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
	<br>
	<!-- sell-Detail 영역 -->
	<div class="card">
		<div class="card-body">
			<div class="card-body">
			</div>
			<div class="table-responsive my-1" id="table2">
				<table class="table align-middle">
					<thead>
						<tr>
							<!-- <th scope="col" style="text-align: center">판매 상세 번호</th>
							<th scope="col" style="text-align: center">판매 번호</th> -->
							<th scope="col" style="text-align: center">품목 코드</th>
							<th scope="col" style="text-align: center">상품명</th>
							<th scope="col" style="text-align: center">로트 번호</th>
							<th scope="col" style="text-align: center">판매 수량</th>
							<th scope="col" style="text-align: center">판매 단가</th>
							<th scope="col" style="text-align: center">합계</th>
						</tr>
					</thead>
					<tbody>


					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- Modal Begin (Sell)-->
	<div class="modal fade" id="Sold_Product_Add_Modal" tabindex="-1"
		style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header border-0">
					<h5 class="modal-title" id="modal-title"></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form class="needs-validation" id="taskForm_add" method="post"
						novalidate>
						<div class="row">
							<input type="hidden" name="member_no" class="form-control"
								readonly>
							<div class="mb-3">
								<label for="order_no" class="form-label">주문서번호</label> <input
									type="text" name="order_no" class="form-control" id="order_no"
									autofocus required>
							</div>
						</div>
						<div class="row">
							<div class="mb-3">
								<label for="member_no" class="form-label">담당자 이름</label> <input
									type="text" class="form-control choiceMemberBtn"
									data-bs-target="#secondModal" data-bs-toggle="modal"
									data-bs-dismiss="modal" name="member_name" id="choiceMemberBtn"
									required readonly>
							</div>
							<!-- <div class="col-sm-4">
								<label for="userFullname" class="form-label">&nbsp;&nbsp;</label>
								<button type="button" class="btn btn-primary"
									style="display: block" data-bs-target="#secondModal"
									data-bs-toggle="modal" data-bs-dismiss="modal"
									id="choiceMemberBtn">담당자 선택</button>
							</div> -->
						</div>
						<div class="row">
							<div class="mb-3">
								<label for="day" class="form-label">판매 일자</label> <input
									type="date" name="day" class="form-control" id="day" required
									max="<%=sf.format(nowTime)%>">
							</div>
						</div>
						<div class="mb-3">
							<hr>
							<!-- <button type="button" form="taskForm"
								class="btn btn-primary px-5" id="insert_Sold_Detaill">판매
								상세 추가</button>
							<button type="button" form="taskForm"
								class="btn btn-primary px-5" id="delete_detail">초기화</button> -->
						</div>
						<div id="sell_Detail_Insert_Area">
							<div id="detail_Insert_Area">
								<div class="row">
									<input type="hidden" name="item_no" class="form-control"
										readonly>

									<div class="mb-3" style="width: 300px;">
										<label for="userFullname" class="form-label">품목코드</label> <input
											type="text" class="form-control choiceItemBtn"
											 name='item_code' readonly>
									</div>
									<div class="col-sm-4">
										<label for="userFullname" class="form-label">&nbsp;&nbsp;</label>
										<button type="button" class="btn btn-primary"
											style="display: block" data-bs-target="#secondModal"
											data-bs-toggle="modal" data-bs-dismiss="modal"
											id="choiceItemBtn">품목 선택</button>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-4" style="width: 227px;">
										<label for="amount" class="form-label">판매 수량</label> <input
											type="text" class="form-control" id="amount" name="amount"
											placeholder="판매수량">
									</div>
									<div class="col-sm-4" style="width: 227px;">
										<label for="sell_price" class="form-label">판매 단가</label> <input
											type="text" class="form-control" id="sell_price"
											name="sell_price" placeholder="판매단가" readonly>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="mb-3">
										<label for="lot_code" class="form-label">로트 번호</label> <select
											name="lot_code" class="form-select" id="getLotCode">
										</select>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="mb-3">
										<label for="userFullname" class="form-label">&nbsp;&nbsp;</label>
										<button type="button" style="float: right;" form="taskForm"
											class="btn btn-primary delete_detail" id="delete_detail2">삭제</button>
									</div>
								</div>
							</div>
							<hr>
						</div>
					</form>
				</div>
				<div class="modal-footer border-0">
					<button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
					<button type="button" form="taskForm_add"
						class="btn btn-primary px-5" id="Sold_Submit">등록</button>
					<button type="button" form="taskForm" class="btn btn-primary px-5"
						id="Sold_Update_Submit" onclick="goUpdate()">수정</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="delete_Sold_modal" tabindex="-1"
		aria-labelledby="delete_Sold" style="display: none;"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="delete_Sold">경고</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">정말 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" onclick="goDel()">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal end (Sell)-->



	<!-- Modal Begin (Sell-Detail) -->
	<div class="modal fade" id="Sold_Detail_Product_Add_Modal"
		tabindex="-1" style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header border-0">
					<h5 class="modal-title2" id="modal-title2"></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						id="insert_Sold_Detail" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form class="needs-validation" id="taskForm" method="post"
						novalidate>
						<div class="col-12">
							<label for="item_no2" class="form-label">품목 번호</label> <input
								type="text" name="item_no2" class="form-control" id="item_no2"
								required>
							<div class="invalid-feedback">Member_No is required.</div>
						</div>
						<div class="col-sm-4" style="width: 220px;">
							<label for="amount2" class="form-label">판매 수량</label> <input
								type="text" name="amount2" class="form-control" id="amount2"
								required>
						</div>
						<div class="col-sm-4" style="width: 220px;">
							<label for="sell_price2" class="form-label">판매 단가</label> <input
								type="text" name="sell_price2" class="form-control"
								id="sell_price2" required>
						</div>
						<div class="col-12">
							<label for="lot_code2" class="form-label">로트 번호</label> <input
								type="text" name="lot_code2" class="form-control" id="lot_code2"
								required>
							<div class="invalid-feedback">Member_No is required.</div>
						</div>
					</form>
				</div>
				<div class="modal-body2"></div>
				<div class="modal-footer border-0">
					<button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
					<button type="button" form="taskForm" class="btn btn-primary px-5"
						id="Sold_Detail_Submit" data-bs-dismiss="modal"
						data-bs-target="#Sold_Product_Add_Modal" data-bs-toggle="modal">등록</button>
					<button type="button" form="taskForm" class="btn btn-primary px-5"
						id="Sold_Detail_Update_Submit" onclick="goUpdate()">수정</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="delete_Sold_modal" tabindex="-1"
		aria-labelledby="delete_Sold" style="display: none;"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="delete_Sold">경고</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						data-bs-target="#addUserModal1" data-bs-toggle="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">정말 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" onclick="goDel()">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal END (Sell-Detail) -->
	<!-- 두번째 모달 -->
	<div class="modal fade" id="secondModal" tabindex="-2">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header border-0">
					<h5 id="second-modal-title">거래처 입력</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body" style="padding-bottom: 0px">
					<div class="modal-footer border-0">
						<form style="margin: auto; text-align: center;"
							onsubmit="return false;">
							<div class="d-flex gap-1 me-auto flex-wrap">
								<select id="searchWhatColumn" class="form-select"
									style="width: 140px;">
									<!-- option이 그려지는 부분 -->
								</select> <input type="text" id="searchKeyword" class="form-control"
									placeholder="입력" style="width: 200px; height: 38px;">
								<button type="submit" class="btn btn-light" id="searchBtn">
									검색</button>
							</div>
						</form>
					</div>
					<div class="table-responsive my-1">
						<table class="table align-middle">
							<thead id="secondModalThead">
								<!-- 테이블의 th 들을 그리는 부분 -->
							</thead>
							<tbody id="secondModalTbody">
								<!-- 조회된 레코드들이 javascript 코드에 의해 그려지는 위치 -->
							</tbody>
						</table>
					</div>

					<!-- 페이지내이션 -->
					<nav aria-label="Page navigation borderless example">
						<ul class="pagination pagination-borderless justify-content-end"
							id="modalPageNation">
							<!-- 페이지내이션이 javascript 코드에 의해 그려지는 위치 -->
						</ul>
					</nav>

				</div>

				<div class="modal-footer border-0">
					<button type="button" class="btn btn-light"
						data-bs-target="#Sold_Product_Add_Modal" data-bs-toggle="modal"
						data-bs-dismiss="modal">돌아가기</button>
					<button class="btn btn-primary"
						data-bs-target="#Sold_Product_Add_Modal" data-bs-toggle="modal"
						data-bs-dismiss="modal" id="delivery_data">확인</button>
				</div>
			</div>
		</div>
	</div>





</div>

<!-- bottom.jsp -->
<%@include file="../../common/bottom.jsp"%>

<script type="text/javascript">
	/* 왼쪽 카테고리창이 해당화면에 맞게 펼쳐지게 하는 코드 */
	$(function(){ 
		document.getElementById('input_warehouse').click();
	});
</script>