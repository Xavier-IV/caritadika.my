import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="state-select"
export default class extends Controller {
  static targets = ["state", "city"];

  connect() {
    console.log("connected");
  }

  fetchCities() {
    const selectedState = this.stateTarget.value;

    // Clear the current city options
    this.cityTarget.innerHTML = "";

    if (selectedState) {
      // Fetch cities using the selected state name
      fetch(`/cities_for_state?state_name=${encodeURIComponent(selectedState)}`)
        .then((response) => response.json())
        .then((cities) => {
          // Add the "All Cities" prompt
          const promptOption = document.createElement("option");
          promptOption.textContent = "All Cities";
          this.cityTarget.appendChild(promptOption);

          // Populate the city dropdown with the fetched cities
          cities.forEach((city) => {
            const option = document.createElement("option");
            option.value = city;
            option.textContent = city;
            this.cityTarget.appendChild(option);
          });
        })
        .catch((error) => console.error("Error fetching cities:", error));
    }
  }
}
