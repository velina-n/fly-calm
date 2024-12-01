// app javascript controllers bar animation
document.addEventListener('DOMContentLoaded', () => {
  const bar = document.querySelector('.breath-bar');

  if (bar) {
    console.log("Barre trouvée");

    // Fonction pour animer la barre
    function barBreatheAnimation() {
      bar.style.transition = 'height 2s ease-in-out'; // Assure une transition fluide
      bar.style.height = '400px';
      setTimeout(() => {
        bar.style.height = '200px';
      }, 100);
    }
 
    // Démarrer immédiatement l'animation
    bar.style.height = '400px'; // Première étape sans délai
    setTimeout(() => {
      bar.style.height = '200px';
      setInterval(barBreatheAnimation, 4000); // Boucle toutes les 4 secondes
    }, 100); // Synchronisation avec la première étape
  } else {
    console.log("Barre non trouvée");
  }
});
