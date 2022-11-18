<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="resources/assets/img/favicon.ico" type="image/x-icon" />
  <title>WMS_Project</title>

  <!-- Required CSS -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;900&display=swap">
  <link rel="stylesheet" href="resources/assets/css/style.css">
</head>

<body>
  <div class="auth-container">
    <div class="card">
      <div class="card-body" style="margin-top: 150px;">
        <img src="resources/assets/img/logo.svg" alt="Mimity admin" width="32" height="32" class="mb-3" style="transform:rotate(180deg)">
        <h1 class="fw-black mb-2">WMS Project</h1>
        <p class="fw-light text-secondary mb-4"></p>
        <form class="needs-validation" novalidate name="loginForm">
          <div class="mb-3">
            <label class="form-label fw-bold" for="InputEmail">아이디</label>
            <input type="text" class="form-control" id="id" placeholder="아이디를 입력하세요" autocomplete="off" autofocus required>
            <div class="invalid-feedback">아이디 입력</div>
          </div>
          <div class="mb-3">
            <label class="form-label fw-bold" for="InputPassword">비밀번호</label>
            <input type="password" class="form-control" id="pw" placeholder="비밀번호를 입력하세요" required>
            <div class="invalid-feedback">비밀번호 입력</div>
          </div>
          <div class="mb-3 d-flex justify-content-between align-items-center">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" id="idsave" name="idsave">
              <label class="form-check-label" for="remember">기억하기</label>
            </div>
            <a style="width: 250px; text-align: right;" onclick="alert('여누솔루션 박찬섭 과장 [ 010-2452-4563 ]')" class="link-primary small text-decoration-none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관리자에게 문의</a>
          </div>
          <span id="msg"></span>
          <button type="button" class="btn btn-primary w-100" id="check_user">로그인</button>
          <input type="button" value="home" class="btn btn-primary w-100" onclick="location.href='/home'">
          <div class="divider-text"></div>
        </form>
      </div>
    </div>
  </div>
  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
     
   $(function(){
	   
	   if (getCookie("id")) { // getCookie함수로 id라는 이름의 쿠키를 불러와서 있을경우
           document.loginForm.id.value = getCookie("id"); //input 이름이 id인곳에 getCookie("id")값을 넣어줌
           document.loginForm.idsave.checked = true; // 체크는 체크됨으로
       }
	   
	   
	   /* 키보드가 올라오면  */
	   $("#id").keyup(function(){
		   $('#id').attr("class","form-control is-valid")
		   $('#msg').hide()
	   })
	   $("#pw").keyup(function(){
		   $('#pw').attr("class","form-control is-valid")
		   $('#msg').hide()
	   })
   })
		
		$('#check_user').click(function(){
			if($("#id").val()=="")
				$('#id').attr("class","form-control is-invalid")
			if($("#id").val()!="")
				$('#id').attr("class","form-control is-valid")
			if($('#pw').val()=="")
				$('#pw').attr("class","form-control is-invalid")
			if($('#pw').val()!="")
				$('#pw').attr("class","form-control is-valid")
			if($("#id").val()!="" && $("#pw").val()!=""){
				$.ajax({// 다른 jsp 가서 중복체크할것
		  			url : "/check_user ", // 일로가서 중복체크
		  			type : "post",
		  			data : {  // 보낼 데이터
		  				id : $('#id').val(),
		  				pw : $('#pw').val()// 값을 담을 변수 내맘 userid= choi 가지고 jsp로 넘어감.
		  			
		  			},
		  			datatype : 'json',
		  				success : function(data){// 사용가능 불가능 한 걸 data로 받는다. data:응답정보 url 갔다온 답
		  					const parse = JSON.parse(data);
		  					if(parse==0){
		  						$('#msg').show()
		  						$('#msg').html("<font color=red>아이디 또는 비밀번호가 일치하지 않습니다</font><br>")
		  					}
		  					else{
		  						 if (document.loginForm.idsave.checked == true) { // 아이디 저장을 체크 하였을때
		  				            setCookie("id", document.loginForm.id.value, 7); //쿠키이름을 id로 아이디입력필드값을 7일동안 저장
		  				        } else { // 아이디 저장을 체크 하지 않았을때
		  				            setCookie("id", document.loginForm.id.value, 0); //날짜를 0으로 저장하여 쿠키삭제
		  				        }
		  						location.href='/home';
		  					}
		  				}
		  		});//ajax
			}//else
      })
      
        
			function setCookie(name, value, expiredays) { //쿠키 저장함수
				var todayDate = new Date();
				todayDate.setDate(todayDate.getDate() + expiredays);
				document.cookie = name + "=" + escape(value)
						+ "; path=/; expires=" + todayDate.toGMTString() + ";"
			}

			function getCookie(Name) { // 쿠키 불러오는 함수
				var search = Name + "=";
				if (document.cookie.length > 0) { // if there are any cookies
					offset = document.cookie.indexOf(search);
					if (offset != -1) { // if cookie exists
						offset += search.length; // set index of beginning of value
						end = document.cookie.indexOf(";", offset); // set index of end of cookie value
						if (end == -1)
							end = document.cookie.length;
						return unescape(document.cookie.substring(offset, end));
					}
				}
			}
		</script>
</body>

</html>