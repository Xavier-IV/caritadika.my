import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="near-me"
export default class extends Controller {
  static targets = ["button"];

  locate() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        this.handleLocation.bind(this),
        this.handleError.bind(this),
      );
    } else {
      alert("Geolocation is not supported by this browser.");
    }
  }

  handleLocation(position) {
    const latitude = position.coords.latitude;
    const longitude = position.coords.longitude;

    // Redirect to the URL with the latitude and longitude parameters
    const url = new URL(window.location.href);
    url.search = "";

    url.searchParams.set("latitude", latitude);
    url.searchParams.set("longitude", longitude);

    // Navigate to the new URL with the location params
    window.location.href = url.toString();
  }

  handleError(error) {
    alert("Unable to retrieve your location: " + error.message);
  }
}
