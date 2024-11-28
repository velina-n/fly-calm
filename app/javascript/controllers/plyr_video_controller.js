import { Controller } from "@hotwired/stimulus"
import Plyr from 'plyr';


// Connects to data-controller="plyr-video"
export default class extends Controller {
  connect() {
    this.player = new Plyr(this.element);
  }
}
