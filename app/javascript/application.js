import { Application } from "@hotwired/stimulus";
import "@hotwired/turbo-rails"; // Turbo Rails pour améliorer la navigation dynamique
import "controllers"; // Charge automatiquement tous les contrôleurs Stimulus
import '../animations/circle_animation';
import '../animations/bar_animation';

const application = Application.start();

// Configure Stimulus pour désactiver les logs en production
application.debug = false;
window.Stimulus = application;

export default application;
