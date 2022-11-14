<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
  
  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
            <a class="nav-link px-2 d-flex align-items-center gap-3" href="chat.html">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z" />
              </svg>
              <span>쪽지</span>
              <span class="badge rounded-pill ms-auto">3</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#dashboard-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="dashboard-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z" />
              </svg>
              <span class="me-auto" id="basicinfo">기초정보관리</span>
            </a>
            <div class="ms-5 collapse" id="dashboard-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item" ><a class="nav-link" href="/basicinfo/member/list">사원정보</a></li>
                <li class="nav-item"><a class="nav-link" href="/basicinfo/department/list">부서정보</a></li>
                <li class="nav-item"><a class="nav-link" href="/basicinfo/rank/list">직급정보</a></li>
                <li class="nav-item"><a class="nav-link" href="/basicinfo/item/list">품목정보</a></li>
                <li class="nav-item"><a class="nav-link" href="/basicinfo/client/list">거래처정보</a></li>
                <li class="nav-item"><a class="nav-link" href="/basicinfo/lot/list">로트정보</a></li>
                <li class="nav-item"><a class="nav-link" href="/basicinfo/warehouse/list">창고정보</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3" href="calendar.html">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4" />
              </svg>
              <span>창고별 재고현황</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3" href="calendar.html">
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
                <li class="nav-item"><a class="nav-link" href="/ordersheet/list">수주정보</a></li>
                <li class="nav-item"><a class="nav-link" href="index.html">수주별 처리현황</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#request-order-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="dashboard-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
              </svg>
              <span class="me-auto">발주지시관리</span>
            </a>
            <div class="ms-5 collapse" id="request-order-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="list.ps">발주지시정보</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#order-process-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="dashboard-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
              </svg>
              <span class="me-auto">발주처리관리</span>
            </a>
            <div class="ms-5 collapse" id="order-process-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="index.html">발주서정보</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#come-process-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="dashboard-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
              </svg>
              <span class="me-auto">입고처리관리</span>
            </a>
            <div class="ms-5 collapse" id="come-process-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="index.html">입고정보</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#out-process-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="dashboard-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" width="24px" height="30px" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.3" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
              </svg>
              <span class="me-auto">출고처리관리</span>
            </a>
            <div class="ms-5 collapse" id="out-process-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="/sell/origin/list">출고정보</a></li>
              </ul>
            </div>
          </li>
          
          
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3" href="email.html">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
              </svg>
              <span>E</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3" href="file-manager.html">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z" />
              </svg>
              <span>F</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3" href="forum.html">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8h2a2 2 0 012 2v6a2 2 0 01-2 2h-2v4l-4-4H9a1.994 1.994 0 01-1.414-.586m0 0L11 14h4a2 2 0 002-2V6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2v4l.586-.586z" />
              </svg>
              <span>Forum</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3" href="invoice.html">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
              </svg>
              <span>Invoice</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3" href="photos.html">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
              </svg>
              <span>Photos</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3" href="pricing.html">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z" />
              </svg>
              <span>Pricing</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3" href="todo.html">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4" />
              </svg>
              <span>Todo</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#blog-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="blog-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 5c7.18 0 13 5.82 13 13M6 11a7 7 0 017 7m-6 0a1 1 0 11-2 0 1 1 0 012 0z" />
              </svg>
              <span class="me-auto">Blog</span>
            </a>
            <div class="ms-5 collapse" id="blog-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="post-all.html">All posts</a></li>
                <li class="nav-item"><a class="nav-link" href="post-new.html">Add new post</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-label px-2 small mt-3"><small>PAGES</small></li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#authentication-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="authentication-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
              </svg>
              <span class="me-auto">Authentication</span>
            </a>
            <div class="ms-5 collapse" id="authentication-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="signin.html">Sign in</a></li>
                <li class="nav-item"><a class="nav-link" href="register.html">Register</a></li>
                <li class="nav-item"><a class="nav-link" href="forgot-password.html">Forgot password</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#error-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="error-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
              <span class="me-auto">Error</span>
            </a>
            <div class="ms-5 collapse" id="error-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="error-404.html">Page not found</a></li>
                <li class="nav-item"><a class="nav-link" href="error-500.html">Internal server error</a></li>
                <li class="nav-item"><a class="nav-link" href="error-503.html">Service unavailable</a></li>
                <li class="nav-item"><a class="nav-link" href="error-505.html">Forbidden access</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#user-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="user-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z" />
              </svg>
              <span class="me-auto">User</span>
            </a>
            <div class="ms-5 collapse" id="user-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="user-settings.html">User settings</a></li>
                <li class="nav-item"><a class="nav-link" href="user-list.html">User list</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-label px-2 small mt-3"><small>BOOTSTRAP</small></li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#content-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="content-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10h18M3 14h18m-9-4v8m-7 0h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v8a2 2 0 002 2z" />
              </svg>
              <span class="me-auto">Content</span>
            </a>
            <div class="ms-5 collapse" id="content-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="typography.html">Typography</a></li>
                <li class="nav-item"><a class="nav-link" href="images.html">Images</a></li>
                <li class="nav-item"><a class="nav-link" href="tables.html">Tables</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#components-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="components-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4" />
              </svg>
              <span class="me-auto">Components</span>
            </a>
            <div class="ms-5 collapse" id="components-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="accordion.html">Accordion</a></li>
                <li class="nav-item"><a class="nav-link" href="alerts.html">Alerts</a></li>
                <li class="nav-item"><a class="nav-link" href="badge.html">Badge</a></li>
                <li class="nav-item"><a class="nav-link" href="breadcrumb.html">Breadcrumb</a></li>
                <li class="nav-item"><a class="nav-link" href="buttons.html">Buttons</a></li>
                <li class="nav-item"><a class="nav-link" href="button-group.html">Button group</a></li>
                <li class="nav-item"><a class="nav-link" href="card.html">Card</a></li>
                <li class="nav-item"><a class="nav-link" href="carousel.html">Carousel</a></li>
                <li class="nav-item"><a class="nav-link" href="collapse.html">Collapse</a></li>
                <li class="nav-item"><a class="nav-link" href="dropdowns.html">Dropdowns</a></li>
                <li class="nav-item"><a class="nav-link" href="list-group.html">List group</a></li>
                <li class="nav-item"><a class="nav-link" href="modal.html">Modal</a></li>
                <li class="nav-item"><a class="nav-link" href="navs-tabs.html">Navs and tabs</a></li>
                <li class="nav-item"><a class="nav-link" href="navbar.html">Navbar</a></li>
                <li class="nav-item"><a class="nav-link" href="offcanvas.html">Offcanvas</a></li>
                <li class="nav-item"><a class="nav-link" href="pagination.html">Pagination</a></li>
                <li class="nav-item"><a class="nav-link" href="placeholders.html">Placeholders</a></li>
                <li class="nav-item"><a class="nav-link" href="popovers.html">Popovers</a></li>
                <li class="nav-item"><a class="nav-link" href="progress.html">Progress</a></li>
                <li class="nav-item"><a class="nav-link" href="scrollspy.html">Scrollspy</a></li>
                <li class="nav-item"><a class="nav-link" href="spinners.html">Spinners</a></li>
                <li class="nav-item"><a class="nav-link" href="toasts.html">Toasts</a></li>
                <li class="nav-item"><a class="nav-link" href="tooltips.html">Tooltips</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#forms-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="forms-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
              </svg>
              <span class="me-auto">Forms</span>
            </a>
            <div class="ms-5 collapse" id="forms-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="form-control.html">Form control</a></li>
                <li class="nav-item"><a class="nav-link" href="select.html">Select</a></li>
                <li class="nav-item"><a class="nav-link" href="checks-radios.html">Checks and radios</a></li>
                <li class="nav-item"><a class="nav-link" href="range.html">Range</a></li>
                <li class="nav-item"><a class="nav-link" href="input-group.html">Input group</a></li>
                <li class="nav-item"><a class="nav-link" href="floating-labels.html">Floating labels</a></li>
                <li class="nav-item"><a class="nav-link" href="layout.html">Layout</a></li>
                <li class="nav-item"><a class="nav-link" href="validation.html">Validation</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-label px-2 small mt-3"><small>ADVANCED</small></li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#advanced-components-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="advanced-components-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10" />
              </svg>
              <span class="me-auto">Components</span>
            </a>
            <div class="ms-5 collapse" id="advanced-components-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="datatables.html">DataTables</a></li>
                <li class="nav-item"><a class="nav-link" href="sortable-list.html">Sortable list</a></li>
                <li class="nav-item"><a class="nav-link" href="stepper.html">Stepper</a></li>
                <li class="nav-item"><a class="nav-link" href="timeline.html">Timeline</a></li>
                <li class="nav-item"><a class="nav-link" href="touch-slider.html">Touch slider</a></li>
                <li class="nav-item"><a class="nav-link" href="treeview.html">Treeview</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#advanced-forms-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="advanced-forms-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
              </svg>
              <span class="me-auto">Forms</span>
            </a>
            <div class="ms-5 collapse" id="advanced-forms-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="autocomplete.html">Autocomplete</a></li>
                <li class="nav-item"><a class="nav-link" href="autosize.html">Autosize textarea</a></li>
                <li class="nav-item"><a class="nav-link" href="color-picker.html">Color picker</a></li>
                <li class="nav-item"><a class="nav-link" href="date-picker.html">Date picker</a></li>
                <li class="nav-item"><a class="nav-link" href="dropdown-select.html">Dropdown select</a></li>
                <li class="nav-item"><a class="nav-link" href="input-mask.html">Input mask</a></li>
                <li class="nav-item"><a class="nav-link" href="input-touchspin.html">Input touchspin</a></li>
                <li class="nav-item"><a class="nav-link" href="markdown.html">Markdown</a></li>
                <li class="nav-item"><a class="nav-link" href="range-slider.html">Range slider</a></li>
                <li class="nav-item"><a class="nav-link" href="tag-input.html">Tag input</a></li>
                <li class="nav-item"><a class="nav-link" href="wysiwyg-editor.html">WYSIWYG editor</a></li>
              </ul>
            </div>
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
            <li class="nav-item dropdown">
              <a href="#" class="nav-link dropdown-toggle no-caret" role="button" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                  <path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd" />
                </svg>
              </a>
              <!-- 검색창 파트 -->
              <div class="dropdown-menu dropdown-menu-end p-3">
                <form><input type="text" class="form-control border-0 shadow-none px-3" placeholder="Search..." autofocus></form>
                <div class="dropdown-divider"></div>
                <h6 class="dropdown-header d-flex justify-content-between">
                  Recently searched:
                  <a href="javascript:void(0)" class="text-muted ms-5">Clear</a>
                </h6>
                <div class="max-h-[300px] overflow-auto">
                  <a class="dropdown-item" href="javascript:void(0)">Calendar</a>
                  <a class="dropdown-item" href="javascript:void(0)">Chat</a>
                  <a class="dropdown-item" href="javascript:void(0)">Email</a>
                  <a class="dropdown-item" href="javascript:void(0)">File manager</a>
                  <a class="dropdown-item" href="javascript:void(0)">Forum</a>
                  <a class="dropdown-item" href="javascript:void(0)">Invoice</a>
                  <a class="dropdown-item" href="javascript:void(0)">Photos</a>
                  <a class="dropdown-item" href="javascript:void(0)">Pricing</a>
                  <a class="dropdown-item" href="javascript:void(0)">Todo</a>
                  <a class="dropdown-item" href="javascript:void(0)">Blog</a>
                  <a class="dropdown-item" href="javascript:void(0)">Settings</a>
                  <a class="dropdown-item" href="javascript:void(0)">Profile</a>
                </div>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a href="#" class="nav-link dropdown-toggle no-caret" role="button" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside">
                <div class="position-relative">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path d="M10 2a6 6 0 00-6 6v3.586l-.707.707A1 1 0 004 14h12a1 1 0 00.707-1.707L16 11.586V8a6 6 0 00-6-6zM10 18a3 3 0 01-3-3h6a3 3 0 01-3 3z" />
                  </svg>
                  <span class="badge bg-danger position-absolute top-0 start-100 translate-middle p-1">
                    <span class="visually-hidden">unread notifications</span>
                  </span>
                </div>
              </a>
              <!-- 알림창 파트 -->
              <div class="dropdown-menu dropdown-menu-end">
                <h6 class="dropdown-header d-flex justify-content-between">
                  5 New notifications
                  <a href="javascript:void(0)" class="text-muted ms-5">Clear</a>
                </h6>
                <div class="dropdown-divider"></div>
                <div class="max-h-[300px] overflow-auto">
                  <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="javascript:void(0)">
                    <svg class="text-muted" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                    </svg>
                    <div class="vstack">
                      <p class="mb-0">New customer registered</p>
                      <small class="text-muted">5 min ago</small>
                    </div>
                  </a>
                  <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="javascript:void(0)">
                    <svg class="text-muted" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
                    </svg>
                    <div class="vstack">
                      <p class="mb-0">New order received</p>
                      <small class="text-muted">11 min ago</small>
                    </div>
                  </a>
                  <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="javascript:void(0)">
                    <svg class="text-muted" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 4a2 2 0 114 0v1a1 1 0 001 1h3a1 1 0 011 1v3a1 1 0 01-1 1h-1a2 2 0 100 4h1a1 1 0 011 1v3a1 1 0 01-1 1h-3a1 1 0 01-1-1v-1a2 2 0 10-4 0v1a1 1 0 01-1 1H7a1 1 0 01-1-1v-3a1 1 0 00-1-1H4a2 2 0 110-4h1a1 1 0 001-1V7a1 1 0 011-1h3a1 1 0 001-1V4z" />
                    </svg>
                    <div class="vstack">
                      <p class="mb-0">Plugin updates available <span class="badge rounded-pill ms-1 bg-secondary align-bottom">3</span></p>
                      <small class="text-muted">30 min ago</small>
                    </div>
                  </a>
                  <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="javascript:void(0)">
                    <svg class="text-muted" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
                    </svg>
                    <div class="vstack">
                      <p class="mb-0">Download completed</p>
                      <small class="text-muted">35 min ago</small>
                    </div>
                  </a>
                  <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="javascript:void(0)">
                    <svg class="text-muted" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01" />
                    </svg>
                    <div class="vstack">
                      <p class="mb-0">Weekly usage report</p>
                      <small class="text-muted">40 min ago</small>
                    </div>
                  </a>
                </div>
              </div>
            </li>
            <li class="nav-item vr mx-3"></li>
            <li class="nav-item dropdown">
              <a href="#" class="nav-link dropdown-toggle no-caret py-0 pe-0" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="/resources/assets/img/user/user1.svg" width="32" alt="User" class="rounded-circle" loading="lazy">
              </a>
              <ul class="dropdown-menu dropdown-menu-end">
                <li><a class="dropdown-item" href="javascript:void(0)">Profile</a></li>
                <li><a class="dropdown-item" href="user-settings.html">Settings</a></li>
                <li>
                  <div class="dropdown-divider"></div>
                </li>
                <li><a class="dropdown-item" href="signin.html">Sign out</a></li>
              </ul>
            </li>
          </ul>
        </nav>
      </div>
      <!-- /Main header -->

      <!-- Main body -->
      <div id="main-body">


          
        