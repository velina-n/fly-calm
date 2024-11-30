// app javascript favorites_controller.js
// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
console.log("Chargement des contrôleurs Stimulus...");
eagerLoadControllersFrom("controllers", application);
console.log("Tous les contrôleurs ont été chargés !");
