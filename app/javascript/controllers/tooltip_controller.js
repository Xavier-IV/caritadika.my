import { Controller } from "@hotwired/stimulus";
import {
  computePosition,
  offset,
  flip,
  shift,
  autoPlacement,
} from "@floating-ui/dom";

// Connects to data-controller="tooltip"
export default class extends Controller {
  static values = { content: String };

  connect() {
    this.tooltip = document.createElement("div");
    this.tooltip.className = "tooltip"; // Add a tooltip class for styling
    this.tooltip.textContent = this.contentValue;
    this.tooltip.style.position = "absolute";
    this.tooltip.style.zIndex = "9999";
    this.tooltip.style.padding = "8px";
    this.tooltip.style.backgroundColor = "#333";
    this.tooltip.style.color = "#fff";
    this.tooltip.style.borderRadius = "4px";
    this.tooltip.style.fontSize = "0.9rem";
    this.tooltip.style.display = "none"; // Initially hidden

    document.body.appendChild(this.tooltip);

    this.element.addEventListener("mouseenter", () => this.showTooltip());
    this.element.addEventListener("mouseleave", () => this.hideTooltip());
  }

  showTooltip() {
    this.tooltip.style.display = "block";
    computePosition(this.element, this.tooltip, {
      placement: "top", // Default placement is top, you can customize
      middleware: [offset(10), flip(), shift()],
    }).then(({ x, y }) => {
      Object.assign(this.tooltip.style, {
        left: `${x}px`,
        top: `${y}px`,
      });
    });
  }

  hideTooltip() {
    this.tooltip.style.display = "none";
  }

  disconnect() {
    this.tooltip.remove();
  }
}
