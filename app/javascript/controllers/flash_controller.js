import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    hiddenClasses: { type: Array, default: ["hidden"] },
    enteringClasses: { type: Array, default: ["hidden"] },
    visibleClasses: { type: Array, default: ["hidden"] },
    leavingClasses: { type: Array, default: ["hidden"] },
    exitedClasses: { type: Array, default: ["hidden"] },
    delay: { type: Number, default: 0 },
    timeout: { type: Number, default: 5000 },
  };
  static targets = ["flash"];

  connect() {
    if (this.hasFlashTarget) {
      setTimeout(() => this.onEnter(), this.delayValue);
    }
  }

  onEnter() {
    this.enteringClassesValue.map((cls) => {
      this.flashTarget.classList.add(cls);
    });
    this.hiddenClassesValue.map((cls) => {
      this.flashTarget.classList.add(cls);
    });
    requestAnimationFrame(() => {
      this.hiddenClassesValue.map((cls) => {
        this.flashTarget.classList.remove(cls);
      });
      this.visibleClassesValue.map((cls) => {
        this.flashTarget.classList.add(cls);
      });
    });
    setTimeout(() => this.onExit(), this.timeoutValue);
  }

  close() {
    this.onExit();
  }

  onExit() {
    if (!this.hasFlashTarget) {
      return;
    }
    this.enteringClassesValue.map((cls) => {
      this.flashTarget.classList.remove(cls);
    });
    this.leavingClassesValue.map((cls) => {
      this.flashTarget.classList.add(cls);
    });
    requestAnimationFrame(() => {
      this.visibleClassesValue.map((cls) => {
        this.flashTarget.classList.remove(cls);
      });
      this.exitedClassesValue.map((cls) => {
        this.flashTarget.classList.add(cls);
      });
    });
    setTimeout(() => this.flashTarget.remove(), 1000);
  }
}
