import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scheduled"
export default class extends Controller {
  static targets = ["bgcolor", "text", "temperature", "button", "inputvalue"]
  connect() {
    console.log("connected")
    console.log(this.bgcolorTarget)
    console.log(this.textTarget)
    console.log(this.temperatureTarget)
    console.log(this.buttonTarget)
  }

  change(event) {
    event.preventDefault()
    console.log("click")
    console.log(this.inputvalueTarget.value);
    if (this.inputvalueTarget.value === "suggested") {
    this.bgcolorTarget.style = "background-image: linear-gradient(#0096C7 -20%, #FFFFFF 30%);"
    this.inputvalueTarget.value = "scheduled"
    this.buttonTarget.value = "ADD TO CALENDAR"
    console.log("open https");
    window.open(this.element.dataset.url, '_blank');
    } else {
    this.inputvalueTarget.value = "suggested"
    this.buttonTarget.value = "CANCEL"
    this.bgcolorTarget.style = "background-image: linear-gradient(#FF9E00 -20%, #FFFFFF 30%);"
    }

    this.textTarget.classList.toggle("text-warning")
    this.temperatureTarget.classList.toggle("bg-warning")
    this.temperatureTarget.classList.toggle("bg-primary")


  }
}
