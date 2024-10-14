import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="main-filter"
export default class extends Controller {
  static targets = ["filterBox"];

  toggle() {
    this.filterBoxTarget.classList.toggle("hidden");
  }
}
