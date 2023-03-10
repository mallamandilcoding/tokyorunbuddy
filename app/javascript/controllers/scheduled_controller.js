import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scheduled"
export default class extends Controller {
  static targets = ["bgcolor", "text", "temperature", "button", "inputvalue", "form"]
  connect() {
    // console.log("connected")
    // console.log(this.bgcolorTarget)
    // console.log(this.textTarget)
    // console.log(this.temperatureTarget)
    // console.log(this.buttonTarget)
    //  if (this.addbuttonTarget){
    //     this.addbuttonTarget.classList.add("d-none")
    //   }
      // window.addEventListener('load', () => {
      //   if (this.formTarget){
      //     this.formTarget.classList.remove("d-none");
      //     this.formTarget.style["z-index"] = 1;
      //   }
      //   else{
      //     this.formTarget.classList.add("d-none");
      //   }
      // });
  }

  change(event) {
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })

    if (this.inputvalueTarget.value === "suggested") {
      this.buttonTarget.value = "ADD TO CALENDAR"
      this.inputvalueTarget.value = "scheduled"
    } else {
      this.buttonTarget.value = "CANCEL"
      this.inputvalueTarget.value = "suggested"
      console.log("open https");
      window.open(this.element.dataset.url, '_blank');
    }

    this.bgcolorTarget.classList.toggle("bg-suggested")
    this.bgcolorTarget.classList.toggle("bg-scheduled")
    this.textTarget.classList.toggle("text-warning")
    this.temperatureTarget.classList.toggle("bg-warning")
    this.temperatureTarget.classList.toggle("bg-primary")
  }


}
