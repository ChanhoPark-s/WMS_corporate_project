<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="resources/assets/img/favicon.ico" type="image/x-icon" />
  <title>Mimity admin</title>

  <!-- Required CSS -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;900&display=swap">
  <link rel="stylesheet" href="resources/assets/css/simplebar.css">
  <link rel="stylesheet" href="resources/assets/css/style.css">
  <link rel="stylesheet" href="resources/assets/css/sidebar-dark.css" id="sidebar-theme"> <!-- available themes: dark, light, cyan, green, indigo, red -->

</head>

<body class="preloading">

  <!-- Wrapper -->
  <div id="wrapper" class="fixed-sidebar fixed-navbar">
    <!-- available options: fixed-sidebar, fixed-navbar, fixed-footer, mini-sidebar -->

    <!-- Sidebar -->
    <div class="offcanvas offcanvas-start navbar-dark text-nowrap" tabindex="-1" id="sidebar" aria-label="sidebar">

      <div class="offcanvas-header px-3">
        <a href="javascript:void(0)" class="logo nav-link px-0 d-flex align-items-center">
          <svg width="24" height="24" viewBox="0 0 90 90" fill="none" xmlns="http://www.w3.org/2000/svg">
            <rect width="90" height="90" rx="25" fill="#6366F1" />
            <path d="M63.312 29.16C63.568 29.64 63.712 30.072 63.744 30.456C63.808 30.84 63.84 31.4 63.84 32.136V58.776C63.84 60.984 63.232 62.28 62.016 62.664C61.408 62.856 60.64 62.952 59.712 62.952C58.784 62.952 58.048 62.872 57.504 62.712C56.96 62.552 56.544 62.36 56.256 62.136C55.968 61.912 55.744 61.592 55.584 61.176C55.424 60.632 55.344 59.8 55.344 58.68V42.6C54.544 43.592 53.376 45.176 51.84 47.352C50.304 49.496 49.328 50.84 48.912 51.384C48.496 51.928 48.208 52.312 48.048 52.536C47.888 52.728 47.488 53.016 46.848 53.4C46.24 53.752 45.568 53.928 44.832 53.928C44.128 53.928 43.472 53.768 42.864 53.448C42.288 53.096 41.872 52.76 41.616 52.44L41.232 51.912C40.592 51.112 39.328 49.416 37.44 46.824C35.552 44.2 34.528 42.792 34.368 42.6V58.776C34.368 59.512 34.336 60.072 34.272 60.456C34.24 60.808 34.096 61.208 33.84 61.656C33.36 62.52 32.112 62.952 30.096 62.952C28.144 62.952 26.928 62.52 26.448 61.656C26.192 61.208 26.032 60.792 25.968 60.408C25.936 60.024 25.92 59.448 25.92 58.68V32.04C25.92 31.304 25.936 30.76 25.968 30.408C26.032 30.024 26.192 29.592 26.448 29.112C26.928 28.28 28.176 27.864 30.192 27.864C31.056 27.864 31.792 27.976 32.4 28.2C33.04 28.392 33.456 28.6 33.648 28.824L33.936 29.112L44.832 43.416C50.272 36.216 53.904 31.464 55.728 29.16C56.272 28.296 57.552 27.864 59.568 27.864C61.616 27.864 62.864 28.296 63.312 29.16Z" fill="white" />
          </svg>
          <span class="h5 mb-0 text-reset ms-3">Mimity admin</span>
        </a>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body px-2 py-3 h-100" data-simplebar>
        <ul class="navbar-nav mb-4" id="mainMenu">
          <li class="nav-label px-2 small mt-3"><small>MENU</small></li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle active" href="#dashboard-collapse" data-bs-toggle="collapse" role="button" aria-expanded="true" aria-controls="dashboard-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
              </svg>
              <span class="me-auto">Dashboard</span>
            </a>
            <div class="ms-5 collapse show" id="dashboard-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link active" href="index.html">Ecommerce</a></li>
                <li class="nav-item"><a class="nav-link" href="dashboard-analytics.html">Analytics</a></li>
                <li class="nav-item"><a class="nav-link" href="dashboard-crm.html">CRM</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3" href="calendar.html">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
              </svg>
              <span>Calendar</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3" href="chat.html">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z" />
              </svg>
              <span>Chat</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3" href="email.html">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
              </svg>
              <span>Email</span>
              <span class="badge rounded-pill ms-auto">3</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3" href="file-manager.html">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z" />
              </svg>
              <span>File manager</span>
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
          <button type="button" class="btn btn-light d-none d-xl-flex" data-toggle="mini-sidebar">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
              <path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h6a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd" />
            </svg>
          </button>
          <button type="button" class="btn btn-light d-flex d-xl-none me-3" data-bs-toggle="offcanvas" data-bs-target="#sidebar" aria-controls="sidebar">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
              <path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd" />
            </svg>
          </button>
          <ul class="navbar-nav align-items-center ms-auto">
            <li class="nav-item dropdown">
              <a href="#" class="nav-link dropdown-toggle no-caret" role="button" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                  <path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd" />
                </svg>
              </a>
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
                <img src="resources/assets/img/user/user1.svg" width="32" alt="User" class="rounded-circle" loading="lazy">
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

        <div class="row g-4">
          <div class="col-lg-4">
            <div class="row g-4">
              <div class="col-md-3 col-lg-6 col-6">
                <div class="card h-100">
                  <div class="card-body">
                    <p class="mb-0 text-secondary">Orders</p>
                    <h3 class="fw-black">2,56k</h3>
                    <div id="orders"></div>
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-lg-6 col-6">
                <div class="card h-100">
                  <div class="card-body">
                    <p class="mb-0 text-secondary">Profit</p>
                    <h3 class="fw-black">6,25k</h3>
                    <div id="profit"></div>
                  </div>
                </div>
              </div>
              <div class="col-lg-12 col-md-6 col-12">
                <div class="card h-100">
                  <div class="card-body">
                    <div class="row">
                      <div class="col-6">
                        <h3 class="fw-black mb-2">Earnings</h3>
                        <p class="small text-secondary mb-1">This Month</p>
                        <h4 class="mb-3">$4,055.56</h4>
                        <p class="card-text text-secondary small">
                          <span class="font-weight-bolder">68.2%</span><span> more earnings than last month.</span>
                        </p>
                      </div>
                      <div class="col-6">
                        <div id="earnings"></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-8">
            <div class="card h-100">
              <div class="card-body">
                <div class="row">
                  <div class="col-12 col-md-8">
                    <div class="d-sm-flex justify-content-between align-items-center">
                      <h6 class="mb-sm-0">Revenue Report</h6>
                      <div class="d-flex align-items-center">
                        <div class="d-flex align-items-center">
                          <svg class="text-primary me-1" viewBox="0 0 20 20" fill="currentColor" stroke-linecap="round">
                            <circle cx="10" cy="10" r="7"></circle>
                          </svg>
                          Earning
                        </div>
                        <div class="d-flex align-items-center ms-3">
                          <svg class="text-warning me-1" viewBox="0 0 20 20" fill="currentColor" stroke-linecap="round">
                            <circle cx="10" cy="10" r="7"></circle>
                          </svg>
                          Expense
                        </div>
                      </div>
                    </div>
                    <div id="revenue"></div>
                  </div>
                  <div class="col-12 col-md-4 text-center px-4 vstack justify-content-between align-items-center">
                    <div class="btn-group mb-3">
                      <button type="button" class="btn btn-outline-primary btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        2021
                      </button>
                      <ul class="dropdown-menu">
                        <li><button class="dropdown-item" type="button">2021</button></li>
                        <li><button class="dropdown-item" type="button">2020</button></li>
                        <li><button class="dropdown-item" type="button">2019</button></li>
                      </ul>
                    </div>
                    <div class="text-secondary">
                      <h4>$25,852</h4>
                      <p>
                        <span class="fw-bolder text-dark me-25">Budget:</span>
                        <span>56,800</span>
                      </p>
                    </div>
                    <div id="budget"></div>
                    <button class="btn btn-primary" type="button">Increase Budget</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-12 col-md-6 col-lg-4">
            <div class="card h-100">
              <div class="card-header border-bottom-0 d-flex justify-content-between">
                <div>
                  <h6 class="mb-0">Browser States</h6>
                  <small class="text-secondary">Counter April 2021</small>
                </div>
                <div class="dropdown">
                  <button class="btn text-secondary p-0 dropdown-toggle no-caret" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z" />
                    </svg>
                  </button>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li><button class="dropdown-item" type="button">Last 28 days</button></li>
                    <li><button class="dropdown-item" type="button">Last month</button></li>
                    <li><button class="dropdown-item" type="button">Last year</button></li>
                  </ul>
                </div>
              </div>
              <div class="card-body">
                <div class="d-flex align-items-center">
                  <img src="resources/assets/img/browser/chrome.svg" alt="" width="30" height="30" loading="lazy">
                  <span class="ms-2">Google Chrome</span>
                  <span class="ms-auto me-2">54.4%</span>
                  <div id="browser-stat-1"></div>
                </div>
                <div class="d-flex align-items-center mt-2">
                  <img src="resources/assets/img/browser/firefox.svg" alt="" width="30" height="30" loading="lazy">
                  <span class="ms-2">Mozilla Firefox</span>
                  <span class="ms-auto me-2">6.1%</span>
                  <div id="browser-stat-2"></div>
                </div>
                <div class="d-flex align-items-center mt-2">
                  <img src="resources/assets/img/browser/safari.svg" alt="" width="30" height="30" loading="lazy">
                  <span class="ms-2">Apple Safari</span>
                  <span class="ms-auto me-2">14.6%</span>
                  <div id="browser-stat-3"></div>
                </div>
                <div class="d-flex align-items-center mt-2">
                  <img src="resources/assets/img/browser/ie.svg" alt="" width="30" height="30" loading="lazy">
                  <span class="ms-2">Internet Explorer</span>
                  <span class="ms-auto me-2">4.2%</span>
                  <div id="browser-stat-4"></div>
                </div>
                <div class="d-flex align-items-center mt-2">
                  <img src="resources/assets/img/browser/opera.svg" alt="" width="30" height="30" loading="lazy">
                  <span class="ms-2">Opera Mini</span>
                  <span class="ms-auto me-2">8.4%</span>
                  <div id="browser-stat-5"></div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-12 col-md-6 col-lg-4">
            <div class="card h-100">
              <div class="card-header border-bottom-0 d-flex justify-content-between">
                <h6 class="mb-0">Goal Overview</h6>
                <button class="btn text-secondary p-0" type="button">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-3a1 1 0 00-.867.5 1 1 0 11-1.731-1A3 3 0 0113 8a3.001 3.001 0 01-2 2.83V11a1 1 0 11-2 0v-1a1 1 0 011-1 1 1 0 100-2zm0 8a1 1 0 100-2 1 1 0 000 2z" clip-rule="evenodd" />
                  </svg>
                </button>
              </div>
              <div class="card-body">
                <div id="goal"></div>
              </div>
              <div class="card-footer p-0">
                <div class="row text-center mx-0">
                  <div class="col-6 border-end py-1">
                    <small class="text-secondary">Completed</small>
                    <h6>786,617</h6>
                  </div>
                  <div class="col-6 py-1">
                    <small class="text-secondary">In Progress</small>
                    <h6>13,561</h6>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-12 col-md-6 col-lg-4">
            <div class="card h-100">
              <div class="card-header border-bottom-0 d-flex justify-content-between">
                <h6 class="mb-0">Transactions</h6>
                <div class="dropdown">
                  <button class="btn text-secondary p-0 dropdown-toggle no-caret" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z" />
                    </svg>
                  </button>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li><button class="dropdown-item" type="button">Last 28 days</button></li>
                    <li><button class="dropdown-item" type="button">Last month</button></li>
                    <li><button class="dropdown-item" type="button">Last year</button></li>
                  </ul>
                </div>
              </div>
              <div class="card-body">
                <div class="d-flex align-items-center">
                  <svg class="align-self-start text-primary" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 9V7a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2m2 4h10a2 2 0 002-2v-6a2 2 0 00-2-2H9a2 2 0 00-2 2v6a2 2 0 002 2zm7-5a2 2 0 11-4 0 2 2 0 014 0z" />
                  </svg>
                  <div class="mx-2">
                    <h6 class="mb-0">Wallet</h6>
                    <small class="text-secondary">Starbucks</small>
                  </div>
                  <span class="ms-auto text-danger">- $74</span>
                </div>
                <div class="d-flex align-items-center mt-3">
                  <svg class="align-self-start text-success" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                  </svg>
                  <div class="mx-2">
                    <h6 class="mb-0">Bank transfer</h6>
                    <small class="text-secondary">Add money</small>
                  </div>
                  <span class="ms-auto text-success">+ $480</span>
                </div>
                <div class="d-flex align-items-center mt-3">
                  <svg class="align-self-start text-primary" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
                  <div class="mx-2">
                    <h6 class="mb-0">Paypal</h6>
                    <small class="text-secondary">Add money</small>
                  </div>
                  <span class="ms-auto text-success">+ $590</span>
                </div>
                <div class="d-flex align-items-center mt-3">
                  <svg class="align-self-start text-danger" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10h18M7 15h1m4 0h1m-7 4h12a3 3 0 003-3V8a3 3 0 00-3-3H6a3 3 0 00-3 3v8a3 3 0 003 3z" />
                  </svg>
                  <div class="mx-2">
                    <h6 class="mb-0">Master card</h6>
                    <small class="text-secondary">Ordered food</small>
                  </div>
                  <span class="ms-auto text-danger">- $23</span>
                </div>
                <div class="d-flex align-items-center mt-3">
                  <svg class="align-self-start text-info" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10h10a8 8 0 018 8v2M3 10l6 6m-6-6l6-6" />
                  </svg>
                  <div class="mx-2">
                    <h6 class="mb-0">Transfer</h6>
                    <small class="text-secondary">Refund</small>
                  </div>
                  <span class="ms-auto text-success">+ $98</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- /Main body -->

      <!-- Main footer -->
      <div id="main-footer">
        <nav class="navbar navbar-expand navbar-light bg-white small shadow-sm">
          <span class="navbar-text">
            2021 &copy; Mimity admin
          </span>
          <ul class="navbar-nav ms-auto">
            <li class="nav-item">
              <a href="javascript:void(0)" class="nav-link">About</a>
            </li>
            <li class="nav-item">
              <a href="javascript:void(0)" class="nav-link">Help</a>
            </li>
          </ul>
        </nav>
      </div>
      <!-- /Main footer -->

    </div>
    <!-- /Main -->

  </div>
  <!-- /Wrapper -->

  <!-- Required JS -->
  <script src="resources/assets/vendor/bootstrap/bootstrap.bundle.js"></script>
  <script src="resources/assets/vendor/simplebar/simplebar.js"></script>
  <script src="resources/assets/js/script.js"></script>

  <script src="resources/assets/js/settings.js"></script>

  <script src="resources/assets/vendor/apexcharts/apexcharts.js"></script>
  <script>
    new ApexCharts(document.querySelector('#orders'), {
      chart: {
        type: 'bar',
        sparkline: {
          enabled: true
        },
        height: 50,
      },
      colors: ['#facc15'],
      series: [{
        name: 'orders',
        data: [30, 40, 35, 45, 40, 50]
      }],
      xaxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun']
      },
      plotOptions: {
        bar: {
          columnWidth: '30%',
          colors: {
            backgroundBarColors: ['#f5f5f5', '#f5f5f5', '#f5f5f5', '#f5f5f5', '#f5f5f5'],
          },
          borderRadius: 4,
        },
      },
    }).render()

    new ApexCharts(document.querySelector('#profit'), {
      chart: {
        type: 'line',
        sparkline: {
          enabled: true
        },
        height: 50,
      },
      colors: ['#0dcaf0'],
      series: [{
        name: 'profit',
        data: [10, 30, 15, 40, 25, 55]
      }],
      xaxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun']
      },
      stroke: {
        width: 2,
      },
    }).render()

    new ApexCharts(document.querySelector('#revenue'), {
      chart: {
        type: 'bar',
        height: 260,
        toolbar: {
          show: false,
        }
      },
      colors: ['#facc15', '#6366f1'],
      series: [{
          name: 'expense',
          data: [17, 32, 50, 47, 19, 11, 30, 40, 13]
        },
        {
          name: 'earning',
          data: [34, 65, 104, 94, 38, 23, 61, 80, 26]
        },
      ],
      xaxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep']
      },
      plotOptions: {
        bar: {
          columnWidth: '30%',
          borderRadius: 4,
        },
      },
      dataLabels: {
        enabled: false
      },
      legend: {
        show: false,
      }
    }).render()

    new ApexCharts(document.querySelector('#budget'), {
      chart: {
        type: 'line',
        sparkline: {
          enabled: true
        },
        height: 80,
        width: '80%',
      },
      colors: ['#6366f1'],
      series: [{
        data: [61, 48, 69, 52, 60, 40, 79, 60, 59, 43, 62]
      }],
      stroke: {
        width: 2,
        curve: 'smooth',
      },
      tooltip: {
        enabled: false,
      },
    }).render()

    new ApexCharts(document.querySelector('#earnings'), {
      series: [53, 16, 31],
      chart: {
        height: 150,
        type: 'donut',
        toolbar: {
          show: false,
        },
      },
      labels: ['App', 'Service', 'Product'],
      dataLabels: {
        enabled: false,
      },
      legend: {
        show: false,
      },
      stroke: {
        width: 0,
      },
      colors: ['#6366f1', '#0dcaf0', '#facc15'],
    }).render()

    new ApexCharts(document.querySelector('#browser-stat-1'), {
      series: [54.4],
      chart: {
        width: 30,
        height: 30,
        type: 'radialBar',
      },
      plotOptions: {
        radialBar: {
          hollow: {
            size: '20%',
          },
          dataLabels: {
            name: {
              show: false,
            },
            value: {
              show: false,
            }
          }
        },
      },
      stroke: {
        lineCap: 'round',
      },
      dataLabels: {
        enabled: false,
      },
      legend: {
        show: false,
      },
      grid: {
        show: false,
        padding: {
          left: -15,
          right: -15,
          top: -15,
          bottom: -15,
        },
      },
      colors: ['#6366f1'],
    }).render()

    new ApexCharts(document.querySelector('#browser-stat-2'), {
      series: [6.1],
      chart: {
        width: 30,
        height: 30,
        type: 'radialBar',
      },
      plotOptions: {
        radialBar: {
          hollow: {
            size: '20%',
          },
          dataLabels: {
            name: {
              show: false,
            },
            value: {
              show: false,
            }
          }
        },
      },
      stroke: {
        lineCap: 'round',
      },
      dataLabels: {
        enabled: false,
      },
      legend: {
        show: false,
      },
      grid: {
        show: false,
        padding: {
          left: -15,
          right: -15,
          top: -15,
          bottom: -15,
        },
      },
      colors: ['#facc15'],
    }).render()

    new ApexCharts(document.querySelector('#browser-stat-3'), {
      series: [14.6],
      chart: {
        width: 30,
        height: 30,
        type: 'radialBar',
      },
      plotOptions: {
        radialBar: {
          hollow: {
            size: '20%',
          },
          dataLabels: {
            name: {
              show: false,
            },
            value: {
              show: false,
            }
          }
        },
      },
      stroke: {
        lineCap: 'round',
      },
      dataLabels: {
        enabled: false,
      },
      legend: {
        show: false,
      },
      grid: {
        show: false,
        padding: {
          left: -15,
          right: -15,
          top: -15,
          bottom: -15,
        },
      },
      colors: ['#4b5563'],
    }).render()

    new ApexCharts(document.querySelector('#browser-stat-4'), {
      series: [4.2],
      chart: {
        width: 30,
        height: 30,
        type: 'radialBar',
      },
      plotOptions: {
        radialBar: {
          hollow: {
            size: '20%',
          },
          dataLabels: {
            name: {
              show: false,
            },
            value: {
              show: false,
            }
          }
        },
      },
      stroke: {
        lineCap: 'round',
      },
      dataLabels: {
        enabled: false,
      },
      legend: {
        show: false,
      },
      grid: {
        show: false,
        padding: {
          left: -15,
          right: -15,
          top: -15,
          bottom: -15,
        },
      },
      colors: ['#0dcaf0'],
    }).render()

    new ApexCharts(document.querySelector('#browser-stat-5'), {
      series: [8.4],
      chart: {
        width: 30,
        height: 30,
        type: 'radialBar',
      },
      plotOptions: {
        radialBar: {
          hollow: {
            size: '20%',
          },
          dataLabels: {
            name: {
              show: false,
            },
            value: {
              show: false,
            }
          }
        },
      },
      stroke: {
        lineCap: 'round',
      },
      dataLabels: {
        enabled: false,
      },
      legend: {
        show: false,
      },
      grid: {
        show: false,
        padding: {
          left: -15,
          right: -15,
          top: -15,
          bottom: -15,
        },
      },
      colors: ['#ef4444'],
    }).render()

    new ApexCharts(document.querySelector('#goal'), {
      chart: {
        height: 245,
        type: 'radialBar',
      },
      colors: ['#16a34a'],
      plotOptions: {
        radialBar: {
          offsetY: -10,
          startAngle: -150,
          endAngle: 150,
          hollow: {
            size: '77%'
          },
          track: {
            background: '#e5e7eb',
          },
          dataLabels: {
            name: {
              show: false
            },
            value: {
              fontSize: '2rem',
            }
          }
        }
      },
      series: [83],
      stroke: {
        lineCap: 'round'
      }
    }).render()
  </script>
</body>

</html>