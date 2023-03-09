import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="loader"
export default class extends Controller {
  static targets = ["loader"]
  connect() {
    console.log("connected from footer navbar");
  }
  showLoader(){
    console.log('showloader');
    this.loaderTarget.classList.add("show");

    window.addEventListener('load', () => {
      this.loaderTarget.classList.remove("show");
    })
  }
}
