(function() {
  let vh = window.innerHeight * 0.01;
  document.documentElement.style.setProperty("--vh", `${vh}px`);
  window.addEventListener("resize", () => {
    let vh2 = window.innerHeight * 0.01;
    document.documentElement.style.setProperty("--vh", `${vh2}px`);
  });
  document.addEventListener("click", function(e) {
    if (e.target.closest("[data-toggle]")) {
      const button = e.target.closest("[data-toggle]");
      switch (button.dataset.toggle) {
        case "fixed-navbar":
        case "fixed-footer":
        case "fixed-sidebar":
        case "mini-sidebar":
          document.querySelector("#wrapper").classList.toggle(button.dataset.toggle);
          window.dispatchEvent(new Event("resize"));
          button.tagName === "A" && e.preventDefault();
          break;
        case "inner-sidebar-collapse":
        case "inner-sidebar-expand":
          document.querySelector("#inner-wrapper").classList.toggle(button.dataset.toggle);
          button.tagName === "A" && e.preventDefault();
          break;
      }
    }
  });
  window.addEventListener("load", () => {
    if (document.body.classList && document.body.classList.contains("preloading")) {
      setTimeout(() => {
        document.body.classList.remove("preloading");
      }, 200);
    }
  });
  ["shown.bs.modal", "shown.bs.dropdown"].forEach((event) => {
    document.addEventListener(event, (e) => {
      let autofocusEl = null;
      if (e.target.hasAttribute("data-bs-toggle") && e.target.getAttribute("data-bs-toggle") === "dropdown") {
        autofocusEl = e.target.nextElementSibling.querySelector("[autofocus]");
      } else {
        autofocusEl = e.target.querySelector("[autofocus]");
      }
      autofocusEl && autofocusEl.focus();
    });
  });
  document.addEventListener("show.bs.collapse", (event) => {
    const parent = event.target.parentElement;
    if (parent.classList.contains("accordion-item")) {
      parent.classList.add("active");
    }
  });
  document.addEventListener("hide.bs.collapse", (event) => {
    const parent = event.target.parentElement;
    if (parent.classList.contains("accordion-item")) {
      parent.classList.remove("active");
    }
  });
})();
function dropdownHover() {
  document.querySelectorAll("[data-dropdown-hover]").forEach((toggler) => {
    const menu = toggler.nextElementSibling;
    toggler.addEventListener("mouseenter", (e) => {
      if (!menu.classList.contains("show")) {
        toggler.click();
      }
    });
    toggler.addEventListener("mouseleave", (e) => {
      const targetMenu = e.relatedTarget.closest(".dropdown-menu");
      if (targetMenu != menu && menu.classList.contains("show")) {
        toggler.click();
        toggler.blur();
      }
    });
    menu.addEventListener("mouseleave", (e) => {
      if (e.relatedTarget != toggler) {
        toggler.click();
        toggler.blur();
      }
    });
  });
}
function summernoteStyle() {
  (function($2) {
    $2.fn.replaceClass = function(before, after) {
      return this.removeClass(before).addClass(after);
    };
  })(jQuery);
  $(".summernote, .summernote-air").on("summernote.init", function() {
    const editor = $(this).next();
    editor.find(".dropdown-toggle").addClass("no-caret").removeAttr("data-toggle");
    editor.find(".note-btn-group").addClass("btn-group");
    editor.find(".note-btn").replaceClass("note-btn", "btn btn-sm btn-light shadow-none");
    editor.find(".note-modal-header").replaceClass("note-modal-header", "modal-header flex-row-reverse");
    editor.find(".note-modal-footer").replaceClass("note-modal-footer", "modal-footer");
    editor.find(".note-modal-title").replaceClass("note-modal-title", "modal-title");
    editor.find(".note-modal-body").replaceClass("note-modal-body", "modal-body").css("overflow-x", "hidden");
    editor.find(".note-dropdown-item").addClass("dropdown-item");
    editor.find(".note-dropdown-menu").addClass("dropdown-menu");
    editor.find('input[type="checkbox"]').addClass("form-check-input me-2");
    editor.find(".note-form-label").replaceClass("note-form-label", "form-label");
    editor.find(".note-input").addClass("form-control-sm");
    editor.find(".btn-primary").removeClass("note-btn-primary btn-sm");
    editor.find(".note-image-input").addClass("form-control");
  });
  $(document).on("summernote.focus", ".summernote", function() {
    $(this).next().addClass("focus");
  }).on("summernote.blur", ".summernote", function() {
    $(this).next().removeClass("focus");
  });
}
document.querySelectorAll('[data-bs-toggle="popover"]').forEach((i) => new bootstrap.Popover(i));
document.querySelectorAll('[data-bs-toggle="tooltip"]').forEach((i) => new bootstrap.Tooltip(i));
document.querySelectorAll('[data-bs-toggle="dropdown"]').forEach((i) => {
  const option = i.dataset.dropdownHover !== void 0 ? { display: "static" } : {};
  new bootstrap.Dropdown(i, option);
});
