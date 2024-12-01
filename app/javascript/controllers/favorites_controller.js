import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["heartFilled", "heartOpen"];

  connect() {
    console.log("FavoritesController connecté !");
  }

  toggle(event) {
    event.preventDefault();

    console.log("Toggle action déclenchée !");
    console.log("Avant changement :");
    console.log("heartFilled visible ?", !this.heartFilledTarget.classList.contains("hidden"));
    console.log("heartOpen visible ?", !this.heartOpenTarget.classList.contains("hidden"));

    // Bascule les icônes
    this.heartFilledTarget.classList.toggle("hidden");
    this.heartOpenTarget.classList.toggle("hidden");

    console.log("Après changement :");
    console.log("heartFilled visible ?", !this.heartFilledTarget.classList.contains("hidden"));
    console.log("heartOpen visible ?", !this.heartOpenTarget.classList.contains("hidden"));

    // Optionnel : Logique de backend (Fetch API)
    const documentId = this.element.dataset.documentId;

    fetch("/favorites/toggle", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
      },
      body: JSON.stringify({ document_id: documentId })
    })
      .then(response => response.json())
      .then(data => {
        console.log("Réponse du serveur :", data);
      })
      .catch(error => {
        console.error("Erreur lors de la requête Fetch :", error);
      });
  }
}
