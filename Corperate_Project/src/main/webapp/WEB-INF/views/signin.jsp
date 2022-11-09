<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="assets/img/favicon.ico" type="image/x-icon" />
  <title>WMS_Project</title>

  <!-- Required CSS -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;900&display=swap">
  <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>
  <div class="auth-container">
    <div class="card">
      <div class="card-body" style="margin-top: 150px;">
        <img src="assets/img/logo.svg" alt="Mimity admin" width="32" height="32" class="mb-3" style="transform:rotate(180deg)">
        <h1 class="fw-black mb-2">WMS Project</h1>
        <p class="fw-light text-secondary mb-4"></p>
        <form class="needs-validation" novalidate>
          <div class="mb-3">
            <label class="form-label fw-bold" for="InputEmail">아이디</label>
            <input type="email" class="form-control" id="InputEmail" placeholder="아이디를 입력하세요" autocomplete="off" autofocus required>
            <div class="invalid-feedback">아이디 입력</div>
          </div>
          <div class="mb-3">
            <label class="form-label fw-bold" for="InputPassword">비밀번호</label>
            <input type="password" class="form-control" id="InputPassword" placeholder="비밀번호를 입력하세요" required>
            <div class="invalid-feedback">비밀번호 입력</div>
          </div>
          <div class="mb-3 d-flex justify-content-between align-items-center">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" id="remember">
              <label class="form-check-label" for="remember">기억하기</label>
            </div>
            <a style="width: 250px; text-align: right;" href="forgot-password.html" class="link-primary small text-decoration-none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관리자에게 문의</a>
          </div>
          <button type="submit" class="btn btn-primary w-100">로그인</button>
          <input type="button" value="home" class="btn btn-primary w-100" onclick="location.href='/home'">
          <div class="divider-text"></div>
        </form>
      </div>
    </div>
  </div>

  <script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    void(function() {
      document.querySelectorAll('.needs-validation').forEach(form => {
        form.addEventListener('submit', event => {
          if (!form.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
          }

          form.classList.add('was-validated')
        })
      })
    })()
  </script>
</body>

</html>