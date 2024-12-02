// app javascript quizz.js
document.addEventListener("DOMContentLoaded", () => {
  const form = document.querySelector("form");
  const feedbacks = document.querySelectorAll(".feedback");

  form.addEventListener("submit", (event) => {
    // Récupère la réponse sélectionnée
    const selectedAnswer = document.querySelector("input[name='journeys_document[answer_id]']:checked");

    // Si aucune réponse n'est sélectionnée
    if (!selectedAnswer) {
      alert("Veuillez sélectionner une réponse.");
      event.preventDefault(); // Bloque le formulaire
      return;
    }

    // Vérifie si la réponse est correcte
    const isCorrect = selectedAnswer.getAttribute("data-correct") === "true";

    if (!isCorrect) {
      // Affiche une croix rouge à côté de la réponse sélectionnée
      const feedback = document.querySelector(`#feedback_${selectedAnswer.value}`);
      if (feedback) feedback.style.display = "inline";

      // Empêche l'envoi du formulaire pour une mauvaise réponse
      alert("Mauvaise réponse. Veuillez réessayer.");
      event.preventDefault(); // Bloque le formulaire
    }
  });

  // Réinitialise les croix rouges lorsqu'une autre réponse est sélectionnée
  document.querySelectorAll("input[name='journeys_document[answer_id]']").forEach((input) => {
    input.addEventListener("change", () => {
      feedbacks.forEach((feedback) => {
        feedback.style.display = "none";
      });
    });
  });
});

