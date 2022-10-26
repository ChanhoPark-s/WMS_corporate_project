const settingModal = `
<button style="position:fixed;top:156px;right:-.25rem;z-index:1029" class="btn btn-light d-flex shadow-sm" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSettings" aria-controls="offcanvasSettings">
  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
    <path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd" />
  </svg>
</button>
<div class="offcanvas offcanvas-end shadow" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasSettings" aria-labelledby="offcanvasSettingsLabel">
  <div class="offcanvas-header bg-dark">
    <h5 class="offcanvas-title text-white" id="offcanvasSettingsLabel">Settings</h5>
    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <h6 class="mb-3">Layout</h6>
    <div class="form-check form-switch">
      <input class="form-check-input theme-layout" type="checkbox" id="layout-fixed-sidebar" value="fixed-sidebar">
      <label class="form-check-label" for="layout-fixed-sidebar">Fixed sidebar</label>
    </div>
    <div class="form-check form-switch">
      <input class="form-check-input theme-layout" type="checkbox" id="layout-fixed-navbar" value="fixed-navbar">
      <label class="form-check-label" for="layout-fixed-navbar">Fixed navbar</label>
    </div>
    <div class="form-check form-switch">
      <input class="form-check-input theme-layout" type="checkbox" id="layout-fixed-footer" value="fixed-footer">
      <label class="form-check-label" for="layout-fixed-footer">Fixed footer</label>
    </div>
    <hr class="my-4">
    <h6 class="mb-3">Sidebar theme</h6>
    <div class="row row-cols-2 g-4">
      <div class="col">
        <input type="radio" class="btn-check" name="sidebar-theme" autocomplete="off" value="sidebar-dark.css" id="sidebar-theme-dark" checked>
        <label class="btn btn-outline-secondary shadow-none border-0 p-1" for="sidebar-theme-dark">
          <img class="img-thumbnail border-0" src="assets/img/sidebar/sidebar-dark.jpg" alt="sidebar-dark">
        </label>
      </div>
      <div class="col">
        <input type="radio" class="btn-check" name="sidebar-theme" autocomplete="off" value="sidebar-light.css" id="sidebar-theme-light">
        <label class="btn btn-outline-secondary shadow-none border-0 p-1" for="sidebar-theme-light">
          <img class="img-thumbnail border-0" src="assets/img/sidebar/sidebar-light.jpg" alt="sidebar-light">
        </label>
      </div>
      <div class="col">
        <input type="radio" class="btn-check" name="sidebar-theme" autocomplete="off" value="sidebar-cyan.css" id="sidebar-theme-cyan">
        <label class="btn btn-outline-secondary shadow-none border-0 p-1" for="sidebar-theme-cyan">
          <img class="img-thumbnail border-0" src="assets/img/sidebar/sidebar-cyan.jpg" alt="sidebar-cyan">
        </label>
      </div>
      <div class="col">
        <input type="radio" class="btn-check" name="sidebar-theme" autocomplete="off" value="sidebar-green.css" id="sidebar-theme-green">
        <label class="btn btn-outline-secondary shadow-none border-0 p-1" for="sidebar-theme-green">
          <img class="img-thumbnail border-0" src="assets/img/sidebar/sidebar-green.jpg" alt="sidebar-green">
        </label>
      </div>
      <div class="col">
        <input type="radio" class="btn-check" name="sidebar-theme" autocomplete="off" value="sidebar-indigo.css" id="sidebar-theme-indigo">
        <label class="btn btn-outline-secondary shadow-none border-0 p-1" for="sidebar-theme-indigo">
          <img class="img-thumbnail border-0" src="assets/img/sidebar/sidebar-indigo.jpg" alt="sidebar-indigo">
        </label>
      </div>
      <div class="col">
        <input type="radio" class="btn-check" name="sidebar-theme" autocomplete="off" value="sidebar-red.css" id="sidebar-theme-red">
        <label class="btn btn-outline-secondary shadow-none border-0 p-1" for="sidebar-theme-red">
          <img class="img-thumbnail border-0" src="assets/img/sidebar/sidebar-red.jpg" alt="sidebar-red">
        </label>
      </div>
    </div>
  </div>
</div>
`;
void (() => {
  document.body.insertAdjacentHTML("beforeend", settingModal);
  const wrapper = document.querySelector("#wrapper");
  const sidebar = document.querySelector("#sidebar");
  new MutationObserver(() => {
    sessionStorage.setItem("wrapper-class", wrapper.className);
  }).observe(wrapper, { attributes: true });
  document.addEventListener("change", (e) => {
    if (e.target.closest(".theme-layout")) {
      const input = e.target.closest(".theme-layout");
      input.checked ? wrapper.classList.add(input.value) : wrapper.classList.remove(input.value);
    }
  });
  if (sessionStorage.getItem("wrapper-class")) {
    const wrapperClass = sessionStorage.getItem("wrapper-class");
    wrapper.className = wrapperClass;
  }
  if (wrapper.className) {
    document.querySelector("#layout-fixed-sidebar").checked = wrapper.className.split(" ").includes("fixed-sidebar");
    document.querySelector("#layout-fixed-navbar").checked = wrapper.className.split(" ").includes("fixed-navbar");
    document.querySelector("#layout-fixed-footer").checked = wrapper.className.split(" ").includes("fixed-footer");
  }
  function applyTheme(src) {
    const target = document.querySelector("#sidebar-theme");
    target.href = target.href.replace(target.href.split("/").pop(), src);
    if (/light/.test(src)) {
      sidebar.classList.remove("navbar-dark");
      sidebar.classList.add("navbar-light");
    } else {
      sidebar.classList.remove("navbar-light");
      sidebar.classList.add("navbar-dark");
    }
  }
  document.addEventListener("change", (e) => {
    if (e.target.closest('input[name="sidebar-theme"]')) {
      const el = e.target.closest('input[name="sidebar-theme"]');
      applyTheme(el.value);
      sessionStorage.setItem("sidebar-theme", el.value);
    }
  });
  if (sessionStorage.getItem("sidebar-theme")) {
    document.querySelector('input[name="sidebar-theme"][value="' + sessionStorage.getItem("sidebar-theme") + '"]').checked = true;
    applyTheme(sessionStorage.getItem("sidebar-theme"));
  }
})();
