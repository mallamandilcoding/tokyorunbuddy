import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="editpage"
export default class extends Controller {
  static targets = ["edit"]
  connect() {
    // console.log("connected")
  }

  showeditpage(){
    console.log('mandilasdfasdf')
    this.editTarget.style.top = 0;
  }

  cancel(e){
    // alert('mandil')
    // console.log('mandil')
    e.preventDefault()
    this.editTarget.style.top = "-105%";
    // console.log(this.editTarget.style.top)
  }
}
