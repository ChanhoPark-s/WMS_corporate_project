<%@page import="com.spring.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
.box {
    width: 45px;
    height: 45px; 
    border-radius: 70%;
    z-index:5;
    position: fixed;
    bottom: 60px;
    right: 50px;
    cursor: pointer;
}

#chatModal{
	top:52%;
	left:82%;
	max-height: 350px;
	max-width: 300px;
}
a {
    text-decoration: none;
}

.wrap {
    background-color: #FFF;
}

.wrap .chat {
    display: flex;
    align-items: flex-start;
}


.wrap .chat .textbox {
    position: relative;
    display: block;
    max-width: calc(100% - 70px);
    padding: 8px;
    margin-top: 7px;
    font-size: 11px;
    border-radius: 10px;
    color: white;
}

.ch1{
flex-direction:column;
margin-top: 5px;
}

.wrap .chat .textbox::before {
    position: absolute;
    display: block;
    top: 0;
    font-size: 1.5rem;
}

.wrap .ch1 .textbox {
	display: block;
    margin-top: 0px;
    margin-bottom:10px;
    background-color: #1f2937;
}

.wrap .ch1 .textbox::before {
	display: block;
    left: -15px;
    content: "◀";
    color:#1f2937;
}

.wrap .ch2 {
    flex-direction: row-reverse;
}

.wrap .ch2 .textbox {
    margin-right: 20px;
    background-color: #5457cd;
    color: white;
}

.wrap .ch2 .textbox::before {
    right: -15px;
    content: "▶";
    color: #5457cd;
}
#message{
  width: 220px;
  height: 32px;
  font-size: 12px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
}
#scroll{
	border-radius:10px;
}
.lnamed{
	font-size: 4px; 
	display: block;
}


.btn_search{
  cursor : pointer;
  position : absolute;
  right : 7px;
  top : 50%;
  transform : translatey(-50%);
}
#search{
  position : relative;
}

</style>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 창 최상단 아이콘+타이틀파트 -->
  <link rel="icon" href="/resources/assets/img/favicon.ico"  type="image/x-icon" />
  <title>WMS_Project</title>
  
  <!-- Required CSS -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;900&display=swap">
  <link rel="stylesheet" href="/resources/assets/css/simplebar.css">
  <link rel="stylesheet" href="/resources/assets/css/style.css">
  <link rel="stylesheet" href="/resources/assets/css/sidebar-dark.css" id="sidebar-theme"> <!-- available themes: dark, light, cyan, green, indigo, red -->
  <!-- fontAwesome icon -->
  <script src="https://kit.fontawesome.com/6363f16fdc.js" crossorigin="anonymous"></script>
  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <!-- 소켓 라이브러리 추가해주는 코드 -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
  <script type="text/javascript">
	var msgbtn;
	
	$(function(){
			$('.preloading').on("click",function(){
				if(<%=(String)session.getAttribute("id")%>==null){
					alert("로그인 세션이 만료되었습니다.");
					location.href='/';
				}
			})
		
		$('#msgbtn').click(function(){
			/* 모달 띄울시 투명도x */
			$('.modal-backdrop.show').css('opacity','0');
			/* 모달 띄어도 뒤에 클릭되게 */
			$('.modal-backdrop').css('position','unset');
			/* 모달 띄어도 배경 스크롤 되도록  */
			document.body.style= 'overflow: auto';
			
			$("#messageArea").html("");
			$.getJSON("/chat/getAll", 
	 			function(c){
					for(i=0;i<c.length;i++){
						if(c[i].member_id!='<%=(String)session.getAttribute("id")%>'){
							$("#messageArea").append(
								"<div class='chat ch1'>"+
				            	 "<div class='lnamed'>"+c[i].member_name+" "+c[i].rank_name+"</div><div class='textbox'>"+c[i].content+"</div></div>");
						}
						else{
							$("#messageArea").append(
							 "<div class='chat ch2'>"+
					            "<div class='textbox'>"+c[i].content+"</div></div>");
						}
					}
	 			}).fail(function(xhr, status, err){
	 					alert("데이터 조회실패");
	 			});	
		})
		/* 엔터가 눌리면 되게하는법 */
		$("#chatModal").keypress(function(e){
			
			if(e.keyCode===13){
				send();
			}
		})
		$("#sendBtn").click(function() {
			send();
		});
	})	
		/* 웹소켓이랑 연결  */
		let sock = new SockJS("http://52.79.144.231:8080/echo");//http://52.79.144.231:8080/echo // http://localhost:8080/echo
		sock.onmessage = onMessage;
		sock.onclose = onClose;
		
		// 메시지 전송 소켓으로 
		function sendMessage() {
			/* 채팅방에 보여줄때 내가 보낸건지 다른 사람이 보낸건지 확인하기 위해 id를 함께 보내준다.  */
			sock.send($("#message").val()+"/"+'<%=(String)session.getAttribute("id")%>'+"/"+'<%=(String)session.getAttribute("name")%>');
			$('#scroll').scrollTop($('#scroll')[0].scrollHeight);
		}
		// 서버로부터 메시지를 받았을 때
		function onMessage(msg) {
			var data = msg.data;
			/* 아이디를 확인해서 왼쪽 오른쪽 구분해야하기 때문 */
			var answer = data.split("/");
			if(answer[1]!='<%=(String)session.getAttribute("id")%>'){
				$("#messageArea").append(
					"<div class='chat ch1'>"+
					"<div class='lnamed'>"+answer[2]+"</div><div class='textbox'>"+answer[0]+"</div><br>");
			}
			else{
				$("#messageArea").append(
					"<div class='chat ch2'>"+
		            "<div class='textbox'>"+answer[0]+"</div></div><br>");
			}
			$('#scroll').scrollTop($('#scroll')[0].scrollHeight);
		}
		// 서버와 연결을 끊었을 때
		function onClose(evt) {
			$("#messageArea").append("연결 끊김");
	
		}
		
		function send(){
			$.ajax({
				url : "/chat/insert ",
				type : "post",
				data : {  
				content : $('#message').val()
				}
			})//ajax
			sendMessage();
			$('#message').val('')
		}
</script>

</head>
<body class="preloading">

  <!-- Wrapper -->
  <div id="wrapper" class="fixed-sidebar fixed-navbar">
    <!-- available options: fixed-sidebar, fixed-navbar, fixed-footer, mini-sidebar -->
    <!-- 메뉴 사이드바 파트(링크 추가시 여기 수정하세요.) -->
    <div class="offcanvas offcanvas-start navbar-dark text-nowrap" tabindex="-1" id="sidebar" aria-label="sidebar">

      <div class="offcanvas-header px-3">
        <a href="/home" class="logo nav-link px-0 d-flex align-items-center">
          <svg width="24" height="24" transform="rotate(180)" viewBox="0 0 90 90" fill="none" xmlns="http://www.w3.org/2000/svg">
            <rect width="90" height="90" rx="25" fill="#6366F1" />
            <path d="M63.312 29.16C63.568 29.64 63.712 30.072 63.744 30.456C63.808 30.84 63.84 31.4 63.84 32.136V58.776C63.84 60.984 63.232 62.28 62.016 62.664C61.408 62.856 60.64 62.952 59.712 62.952C58.784 62.952 58.048 62.872 57.504 62.712C56.96 62.552 56.544 62.36 56.256 62.136C55.968 61.912 55.744 61.592 55.584 61.176C55.424 60.632 55.344 59.8 55.344 58.68V42.6C54.544 43.592 53.376 45.176 51.84 47.352C50.304 49.496 49.328 50.84 48.912 51.384C48.496 51.928 48.208 52.312 48.048 52.536C47.888 52.728 47.488 53.016 46.848 53.4C46.24 53.752 45.568 53.928 44.832 53.928C44.128 53.928 43.472 53.768 42.864 53.448C42.288 53.096 41.872 52.76 41.616 52.44L41.232 51.912C40.592 51.112 39.328 49.416 37.44 46.824C35.552 44.2 34.528 42.792 34.368 42.6V58.776C34.368 59.512 34.336 60.072 34.272 60.456C34.24 60.808 34.096 61.208 33.84 61.656C33.36 62.52 32.112 62.952 30.096 62.952C28.144 62.952 26.928 62.52 26.448 61.656C26.192 61.208 26.032 60.792 25.968 60.408C25.936 60.024 25.92 59.448 25.92 58.68V32.04C25.92 31.304 25.936 30.76 25.968 30.408C26.032 30.024 26.192 29.592 26.448 29.112C26.928 28.28 28.176 27.864 30.192 27.864C31.056 27.864 31.792 27.976 32.4 28.2C33.04 28.392 33.456 28.6 33.648 28.824L33.936 29.112L44.832 43.416C50.272 36.216 53.904 31.464 55.728 29.16C56.272 28.296 57.552 27.864 59.568 27.864C61.616 27.864 62.864 28.296 63.312 29.16Z" fill="white" />
          </svg>
          <span class="h5 mb-0 text-reset ms-3" onclick="location.href='/home'">WMS_Project</span>
        </a>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body px-2 py-3 h-100" data-simplebar>
        <ul class="navbar-nav mb-4" id="mainMenu">
          <li class="nav-label px-2 small mt-3"><small>MENU</small></li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#dashboard-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="dashboard-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z" />
              </svg>
              <span class="me-auto" id="basicinfo">기초정보관리</span>
            </a>
            <div class="ms-5 collapse" id="dashboard-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item" ><a class="nav-link" href="/basicinfo/member/list" id="member_info">사원정보</a></li>
                <li class="nav-item"><a class="nav-link" href="/basicinfo/department/list" id="depart_info">부서정보</a></li>
                <li class="nav-item"><a class="nav-link" href="/basicinfo/rank/list" id="rank_info">직급정보</a></li>
                <li class="nav-item"><a class="nav-link" href="/basicinfo/item/list" id="item_info">품목정보</a></li>
                <li class="nav-item"><a class="nav-link" href="/basicinfo/client/list" id="client_info">거래처정보</a></li>
                <li class="nav-item"><a class="nav-link" href="/basicinfo/lot/list" id="lot_info">로트정보</a></li>
                <li class="nav-item"><a class="nav-link" href="/basicinfo/warehouse/list" id="storage_info">창고정보</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3" href="${pageContext.request.contextPath }/warehouse/init/insert">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4" />
              </svg>
              <span>초기재고입력</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3" href="/warehouse/warehouse-detail/list">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4" />
              </svg>
              <span>창고별 재고현황</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3" href="${pageContext.request.contextPath }/warehouse/movementHistory/list">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4" />
              </svg>
              <span>재고이동</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#order-contract-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="dashboard-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
              </svg>
              <span class="me-auto" id="ordersheet">수주계약관리</span>
            </a>
            <div class="ms-5 collapse" id="order-contract-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="/ordersheet/list" >수주정보</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#request-order-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="dashboard-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
              </svg>
              <span class="me-auto" id="purchase_info">발주계약관리</span>
            </a>
            <div class="ms-5 collapse" id="request-order-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="/list.ps">발주정보</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#come-process-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="dashboard-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
              </svg>
              <span class="me-auto" id="input_warehouse">입고처리관리</span>
            </a>
            <div class="ms-5 collapse" id="come-process-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="/input_warehouse/list">입고정보</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#out-process-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="dashboard-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" width="24px" height="30px" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.3" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
              </svg>
              <span class="me-auto" id="sell_info">출고처리관리</span>
            </a>
            <div class="ms-5 collapse" id="out-process-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="/sell/origin/list">출고정보</a></li>
              </ul>
            </div>
             </li>
            <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3" href="/sell/origin/sellstatus">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4" />
              </svg>
              <span>영업현황</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <!-- /Sidebar -->

    <!-- Main -->
    <div id="main">

      <!-- Main header -->
      <div id="main-header">
        <nav class="navbar navbar-expand navbar-light bg-white gap-4">
          <ul class="navbar-nav align-items-center ms-auto">
            <li class="nav-item vr mx-3"></li>
            <li class="nav-item dropdown">
              <a href="#" class="nav-link dropdown-toggle no-caret py-0 pe-0" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="/resources/assets/img/user/user1.svg" width="32" alt="User" class="rounded-circle" loading="lazy">
              </a>
              <ul class="dropdown-menu dropdown-menu-end">
                <li><a class="dropdown-item" href="/logout">Sign out</a></li>
              </ul>
            </li>
          </ul>
        </nav>
      </div>
      <!-- /Main header -->
				<img class="box" alt="chatting" id="msgbtn" src="/resources/assets/img/chat.png" data-bs-toggle="modal" data-bs-target="#chatModal">
			<!-- Main body -->
		
		
		
		<!-- Modal 코드 넣을 위치 -->
<!-- Add user modal -->
<div class="modal fade" tabindex="-1" id="chatModal">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-body" id="scroll">
			<!-- 여기부터-->
				 <div class="wrap" id="messageArea"></div>
			<!-- 여기까지 -->
			</div>
			<div class="modal-footer border-0" id="footer-modal">
				<input type="text" id="message" />
				<img src="/resources/assets/img/send.png" width="20px;" height="20px;" id="sendBtn" style="cursor: pointer;" >
			</div>
		</div>
	</div>
</div>
			
			
      <div id="main-body">
      

          
        