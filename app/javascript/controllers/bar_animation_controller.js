// app/javascript/controllers/bar_animation_controller.js
import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="bar-animation"
export default class extends Controller {
  connect() {
    console.log("Bar animation controller connected");
    const bar = this.element;

    // Initialisation de la transition pour une animation fluide
    bar.style.transition = "height 4s ease-in-out";

    // Lancer l'animation de respiration
    this.startBreatheAnimation(bar);
  }

  startBreatheAnimation(bar) {
    const bubble = bar.querySelector(".bubble");
    let isInhaling = true;

    // Fonction répétée pour monter et descendre la bulle
    setInterval(() => {
      if (isInhaling) {
        bar.style.height = "400px"; // Barre s'étend
        bar.style.transitionDuration = "4s";

        bubble.style.bottom = "360px"; // Bulle monte
        bubble.style.transitionDuration = "4s";
      } else {
        bar.style.height = "200px"; // Barre se rétracte
        bar.style.transitionDuration = "6s";

        bubble.style.bottom = "0"; // Bulle descend
        bubble.style.transitionDuration = "6s";
      }

      isInhaling = !isInhaling; // Alterne inspiration/expiration
    }, 10000); // Cycle complet = 10 secondes
  }
}

