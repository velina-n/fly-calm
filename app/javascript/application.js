// app javascript application.js
// app/javascript/application.js
import { Application } from "@hotwired/stimulus";
import "@hotwired/turbo-rails"; // Pour la navigation dynamique (Hotwire)
import "controllers"; // Charge automatiquement les contrôleurs Stimulus
import "bootstrap"; // Charge Bootstrap pour les composants interactifs

// Import d'animations personnalisées (si elles existent)
import "../animations/circle_animation";
import "../animations/bar_animation";

// Débogage pour vérifier que ce fichier est chargé
console.log("Application.js chargé avec succès !");

// Initialise Stimulus
const application = Application.start();
application.debug = false; // Désactiver les logs en production
window.Stimulus = application;

export default application;
