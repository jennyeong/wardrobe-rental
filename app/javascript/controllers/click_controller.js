import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    // console.log("Hello from click Stimulus controller")
  }

  refresh() {
    window.location.reload(true);
  }
}
