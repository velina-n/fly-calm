import { Application } from "@hotwired/stimulus";
import "@hotwired/turbo-rails";
import "controllers"; // Cela inclut tous les contrôleurs de Stimulus

const application = Application.start();

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export default application;
