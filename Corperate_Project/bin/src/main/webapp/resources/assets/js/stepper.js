class Stepper {
  constructor(target) {
    this.wrapper = target;
    this.nav = target.querySelector(".stepper-nav");
    this.content = target.querySelector(".stepper-content");
    this.button = target.querySelector(".stepper-Button");
    this.nextBtn = target.querySelector(".stepper-button .stepper-next");
    this.prevBtn = target.querySelector(".stepper-button .stepper-prev");
    this.navLength = this.nav.querySelectorAll(":scope > *").length;
    this.toggleBtnDisplay();
    this.nextBtn.addEventListener("click", () => this.handleBtn("next"));
    this.prevBtn.addEventListener("click", () => this.handleBtn("prev"));
  }
  getActiveIndex() {
    const allPane = this.content.querySelectorAll(":scope > *");
    const activePane = this.content.querySelector(".active");
    return Array.from(allPane).findIndex((i) => i === activePane);
  }
  toggleBtnDisplay() {
    const activeIndex = this.getActiveIndex();
    this.prevBtn.style.display = activeIndex === 0 ? "none" : "";
    this.nextBtn.style.display = activeIndex === this.navLength - 1 ? "none" : "";
  }
  handleBtn(to) {
    this.wrapper.dispatchEvent(new Event(`stepper.${to}`));
  }
  go(to) {
    const activeNav = this.nav.querySelector(".active").parentNode;
    const targetNav = to === "next" ? activeNav.nextElementSibling : activeNav.previousElementSibling;
    if (targetNav) {
      const btn = targetNav.querySelector("button");
      const activeContent = this.content.querySelector(".active");
      const targetId = to === "next" ? activeContent.nextElementSibling.id : activeContent.previousElementSibling.id;
      btn.setAttribute("data-bs-toggle", "tab");
      btn.setAttribute("data-bs-target", "#" + targetId);
      btn.click();
      btn.removeAttribute("data-bs-toggle");
      btn.removeAttribute("data-bs-target");
      this.toggleBtnDisplay();
    }
  }
  on(event, callback) {
    this.wrapper.addEventListener(event, callback);
  }
}
