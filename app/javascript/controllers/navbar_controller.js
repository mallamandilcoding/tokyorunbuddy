import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["drop"]
  connect() {
    console.log("connected")
  }

  dropdown(){
    this.dropTarget.classList.toggle("active")
  }
}
