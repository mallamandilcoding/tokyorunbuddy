import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["activeicon"]
  connect() {
    console.log("connected")
    console.log(this.activeiconTargets);
  }
  makeactive(){
    console.log(this.activeiconTargets);
  }
}
