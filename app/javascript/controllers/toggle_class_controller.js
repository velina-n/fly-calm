import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-class"
export default class extends Controller {
  static values = {className: String }
  connect() {
    console.log("Hello, Stimulus!", this.classNameValue)
  }
}
