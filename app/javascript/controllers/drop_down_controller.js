import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    optionsOpen: Boolean,
    hiddenClasses: Array,
    visibleClasses: Array,
    openButtonClasses: { type: Array, default: ["hidden"] },
    closeButtonClasses: { type: Array, default: ["hidden"] },
  };
  static targets = ["options", "open", "close"];

  connect() {
    this.controlOptionsOpen();
  }

  toggleOptions() {
    this.optionsOpenValue = !this.optionsOpenValue;
  }

  optionsOpenValueChanged() {
    this.controlOptionsOpen();
  }

  controlOptionsOpen() {
    if (this.optionsOpenValue) {
      this.openOptions();
    } else {
      this.closeOptions();
    }
  }

  openOptions() {
    this.hiddenClassesValue.map((cls) =>
      this.optionsTarget.classList.remove(cls),
    );
    this.visibleClassesValue.map((cls) =>
      this.optionsTarget.classList.add(cls),
    );
    if (this.hasOpenTarget) {
      this.openButtonClassesValue.map((cls) => this.openTarget.classList.add(cls))
    }
    if (this.hasCloseTarget) {
      this.closeButtonClassesValue.map((cls) => this.closeTarget.classList.remove(cls))
    }
  }

  closeOptions() {
    this.hiddenClassesValue.map((cls) => this.optionsTarget.classList.add(cls));
    this.visibleClassesValue.map((cls) =>
      this.optionsTarget.classList.remove(cls),
    );
    if (this.hasOpenTarget) {
      this.openButtonClassesValue.map((cls) => this.openTarget.classList.remove(cls))
    }
    if (this.hasCloseTarget) {
      this.closeButtonClassesValue.map((cls) => this.closeTarget.classList.add(cls))
    }
  }
}
