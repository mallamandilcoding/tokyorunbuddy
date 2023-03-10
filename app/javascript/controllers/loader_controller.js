import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="loader"
export default class extends Controller {
  static targets = ["loader","addbutton","form"]
  connect() {
    console.log("connected from footer navbar");
  }
  showLoader(){
    // console.log('showloader');
    // console.log(this.addbuttonTarget);
    // if (this.addbuttonTarget){
    //   this.addbuttonTarget.classList.add("d-none")
    // }
    this.loaderTarget.classList.add("show");
    if (this.formTarget) this.formTarget.classList.add("d-none");
    window.addEventListener('load', () => {
      if (this.formTarget){
        this.formTarget.classList.remove("d-none");
        // this.formTarget.style["z-index"] = 1;
      }
      this.loaderTarget.classList.remove("show");
    })
  }


}
