// app javascript packs breathing animations
document.addEventListener('DOMContentLoaded', () => {
  console.log("JavaScript chargé !");

  const circle = document.querySelector('.circle');
  const bar = document.querySelector('.breath-bar');

  if (circle) {
    console.log("Cercle trouvé");
    function circleBreatheAnimation() {
      circle.style.transform = 'scale(1.5)';
      setTimeout(() => {
        circle.style.transform = 'scale(1)';
      }, 2000);
    }
    setInterval(circleBreatheAnimation, 4000);
  } else {
    console.log("Cercle non trouvé");
  }

  if (bar) {
    console.log("Barre trouvée");
    function barBreatheAnimation() {
      bar.style.height = '400px';
      setTimeout(() => {
        bar.style.height = '200px';
      }, 2000);
    }
    setInterval(barBreatheAnimation, 4000);
  } else {
    console.log("Barre non trouvée");
  }
});
