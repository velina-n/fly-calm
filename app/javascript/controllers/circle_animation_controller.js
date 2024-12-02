import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="circle-animation"
export default class extends Controller {
  connect() {
    console.log("Circle animation controller connected");
    const circle = this.element;

    circle.style.transform = 'scale(1.5)';
    setTimeout(() => {
      circle.style.transform = 'scale(1)';
      setInterval(this.circleBreatheAnimation(circle), 4000);
    }, 2000);
  }

  circleBreatheAnimation(circle) {
    circle.style.transition = 'transform 2s ease-in-out';
    circle.style.transform = 'scale(1.5)';
    setTimeout(() => {
      circle.style.transform = 'scale(1)';
    }, 2000);
  }
}
