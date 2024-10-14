import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="help-toggle"
export default class extends Controller {
  static targets = ["helpBox"];

  toggle() {
    // Toggle the visibility of the filterBox target
    this.helpBoxTarget.classList.toggle("hidden");
  }
}
