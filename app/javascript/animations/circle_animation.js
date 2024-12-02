// app javascript controllers circle animation
// document.addEventListener('DOMContentLoaded', () => {
//   const circle = document.querySelector('.circle');

//   if (circle) {
//     console.log("Cercle trouvé");

//     // Fonction pour animer le cercle
//     function circleBreatheAnimation() {
//       circle.style.transition = 'transform 2s ease-in-out'; // Assure une transition fluide
//       circle.style.transform = 'scale(1.5)';
//       setTimeout(() => {
//         circle.style.transform = 'scale(1)';
//       }, 2000);
//     }

//     // Démarrer immédiatement l'animation
//     circle.style.transform = 'scale(1.5)'; // Première étape sans délai
//     setTimeout(() => {
//       circle.style.transform = 'scale(1)';
//       setInterval(circleBreatheAnimation, 4000); // Boucle toutes les 4 secondes
//     }, 2000); // Synchronisation avec la première étape
//   } else {
//     console.log("Cercle non trouvé");
//   }
// });
