import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="bar-animation"
export default class extends Controller {
  connect() {
    console.log("Bar animation controller connected");
    const bar = this.element;

    // Première étape : augmentation initiale de la hauteur de la barre
    bar.style.height = "400px";

    setTimeout(() => {
      bar.style.height = "200px";

      // Démarrage de l'animation répétitive
      setInterval(() => this.barBreatheAnimation(bar), 4000);
    }, 200); // Délai de synchronisation avec la première étape
  }

  barBreatheAnimation(bar) {
    // Transition fluide pour l'animation
    bar.style.transition = "height 2s ease-in-out";
    bar.style.height = "400px";

    setTimeout(() => {
      bar.style.height = "200px";
    }, 2000); // Transition inverse après 2 secondes
  }
}
