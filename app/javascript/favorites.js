// app javascript favorites.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["heartFilled", "heartOpen"];

  toggle(event) {
    event.preventDefault();
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
        if (data.favorited) {
          this.heartFilledTarget.classList.remove("hidden");
          this.heartOpenTarget.classList.add("hidden");
        } else {
          this.heartFilledTarget.classList.add("hidden");
          this.heartOpenTarget.classList.remove("hidden");
        }
      });
  }
}
