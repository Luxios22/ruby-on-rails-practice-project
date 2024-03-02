import { Controller } from "@hotwired/stimulus";

const backdropHiddenClasses = ["opacity-0", "invisible"];
const backdropVisibleClasses = ["opacity-100", "visible"];
const menuHiddenClasses = ["translate-x-full"];
const menuVisibleClasses = ["translate-x-0"];

export default class extends Controller {
  static values = {
    isOpen: Boolean,
  };
  static targets = ["backdrop", "menu", "open", "close", "offCanvas"];

  connect() {
    this.controlOpen();
  }

  toggleMenu() {
    this.isOpenValue = !this.isOpenValue;
  }

  isOpenValueChanged() {
    this.controlOpen();
  }

  controlOpen() {
    if (this.isOpenValue) {
      this.openMenu();
    } else {
      this.closeMenu();
    }
  }

  openMenu() {
    backdropHiddenClasses.map((cls) =>
      this.backdropTarget.classList.remove(cls),
    );
    backdropVisibleClasses.map((cls) => this.backdropTarget.classList.add(cls));
    menuHiddenClasses.map((cls) => this.menuTarget.classList.remove(cls));
    menuVisibleClasses.map((cls) => this.menuTarget.classList.add(cls));
    this.offCanvasTarget.classList.remove("invisible");
    this.offCanvasTarget.classList.add("visible");
  }

  closeMenu() {
    backdropHiddenClasses.map((cls) => this.backdropTarget.classList.add(cls));
    backdropVisibleClasses.map((cls) =>
      this.backdropTarget.classList.remove(cls),
    );

    menuHiddenClasses.map((cls) => this.menuTarget.classList.add(cls));
    menuVisibleClasses.map((cls) => this.menuTarget.classList.remove(cls));
    this.offCanvasTarget.classList.add("invisible");
    this.offCanvasTarget.classList.remove("visible");
  }
}
