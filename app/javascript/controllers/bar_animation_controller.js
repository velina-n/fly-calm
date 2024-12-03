import { Controller } from "@hotwired/stimulus"; // Importer le contrôleur Stimulus

export default class extends Controller {
  static targets = ["bubble"]; // Définir une cible Stimulus pour la bulle

  connect() {
    console.log("Bar animation controller connected"); // Message de confirmation dans la console

    // Initialisation des variables
    this.selectedInspiration = null; // Pas de durée d'inspiration sélectionnée au départ
    this.selectedExpiration = null; // Pas de durée d'expiration sélectionnée au départ
    this.selectedButton = null; // Pas de bouton sélectionné au départ
    this.isInhaling = true; // Indique si on est en phase d'inspiration

    // Références DOM
    this.bubble = this.element.querySelector(".bubble"); // Récupérer l'élément de la bulle
    this.breathBar = this.element.querySelector(".breath-bar"); // Récupérer l'élément de la barre
    this.startButton = document.querySelector(".start-session"); // Récupérer le bouton "Commencer la séance"
    this.exitButton = document.querySelector(".exit-session"); // Récupérer le bouton "Terminer"
    this.modeButtons = document.querySelectorAll(".mode-button"); // Récupérer tous les boutons de mode

    // Ajouter les listeners
    this.addModeSelectionListeners(); // Gérer les clics sur les boutons de mode
    this.startButton.addEventListener("click", () => this.startSession()); // Lancer la séance
    this.exitButton.addEventListener("click", () => this.endSession()); // Terminer la séance

    // Démarrer l'animation par défaut (cycle lent)
    this.defaultBubbleAnimation();
  }

  defaultBubbleAnimation() {
    // Animation par défaut sans mode sélectionné
    const defaultInhale = 3; // Durée inspiration par défaut
    const defaultExhale = 3; // Durée expiration par défaut

    const animateBubble = () => {
      const barHeight = this.breathBar.clientHeight; // Hauteur de la barre
      const bubbleHeight = this.bubble.clientHeight; // Hauteur de la bulle

      if (this.isInhaling) {
        this.bubble.style.bottom = `${barHeight - bubbleHeight}px`; // Monter la bulle
        this.bubble.style.transitionDuration = `${defaultInhale}s`; // Durée de montée
      } else {
        this.bubble.style.bottom = `0px`; // Descendre la bulle
        this.bubble.style.transitionDuration = `${defaultExhale}s`; // Durée de descente
      }

      this.isInhaling = !this.isInhaling; // Alterner inspiration/expiration
    };

    // Cycle continu
    this.defaultInterval = setInterval(animateBubble, (defaultInhale + defaultExhale) * 1000);
  }

  addModeSelectionListeners() {
    this.modeButtons.forEach((mode) => {
      mode.addEventListener("click", () => {
        // Dé-sélectionner si déjà sélectionné
        if (mode.classList.contains("selected")) {
          mode.classList.remove("selected"); // Retirer la classe "selected"
          this.selectedInspiration = null; // Réinitialiser l'inspiration
          this.selectedExpiration = null; // Réinitialiser l'expiration
          this.selectedButton = null; // Pas de bouton sélectionné
          console.log("Mode dé-sélectionné"); // Log de dé-sélection
          this.startButton.disabled = true; // Désactiver le bouton "Commencer la séance"
          this.startButton.classList.remove("enabled"); // Retirer la classe "enabled"
          return; // Sortir de la fonction
        }

        // Sélectionner un mode
        this.modeButtons.forEach((m) => m.classList.remove("selected")); // Dé-sélectionner les autres boutons
        mode.classList.add("selected"); // Ajouter la classe "selected" au bouton cliqué
        this.selectedInspiration = parseInt(mode.dataset.inspiration, 10); // Récupérer la valeur d'inspiration
        this.selectedExpiration = parseInt(mode.dataset.expiration, 10); // Récupérer la valeur d'expiration
        this.selectedButton = mode; // Sauvegarder le bouton sélectionné

        console.log(`Mode sélectionné : ${mode.textContent}`); // Log du mode sélectionné
        this.startButton.disabled = false; // Activer le bouton "Commencer la séance"
        this.startButton.classList.add("enabled"); // Ajouter la classe "enabled"
      });
    });
  }

  startSession() {
    // Vérifier si un mode est sélectionné
    if (!this.selectedInspiration || !this.selectedExpiration) {
      alert("Veuillez sélectionner un mode avant de commencer !");
      return;
    }

    // Arrêter l'animation par défaut
    clearInterval(this.defaultInterval);

    // Passer à la vue de focus
    document.querySelector(".main-view").classList.add("hidden"); // Masquer la vue principale
    document.querySelector(".focus-view").classList.remove("hidden"); // Afficher la vue de focus

    const animateBubble = () => {
      const barHeight = this.breathBar.clientHeight; // Hauteur de la barre
      const bubbleHeight = this.bubble.clientHeight; // Hauteur de la bulle

      if (this.isInhaling) {
        this.bubble.style.bottom = `${barHeight - bubbleHeight}px`; // Monter la bulle
        this.bubble.style.transitionDuration = `${this.selectedInspiration}s`; // Durée de montée
      } else {
        this.bubble.style.bottom = `0px`; // Descendre la bulle
        this.bubble.style.transitionDuration = `${this.selectedExpiration}s`; // Durée de descente
      }

      this.isInhaling = !this.isInhaling; // Alterner inspiration/expiration
    };

    // Lancer l'animation immédiatement une première fois
    animateBubble();

    // Démarrer le cycle d'animation en continu
    this.interval = setInterval(
      animateBubble,
      (this.selectedInspiration + this.selectedExpiration) * 1000
    );
  }

  endSession() {
    // Revenir à la vue principale
    document.querySelector(".focus-view").classList.add("hidden"); // Masquer la vue de focus
    document.querySelector(".main-view").classList.remove("hidden"); // Afficher la vue principale

    // Arrêter l'animation en focus
    clearInterval(this.interval);

    // Relancer l'animation par défaut
    this.defaultBubbleAnimation();

    console.log("Session terminée, retour à la vue principale"); // Log de retour
  }
}
