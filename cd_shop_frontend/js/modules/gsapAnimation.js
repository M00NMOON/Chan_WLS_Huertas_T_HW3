gsap.registerPlugin(ScrollToPlugin);
export function gsapAnimation() {
  // Animate the hero section
  gsap.from("#hero-sec", {
    duration: 1,
    opacity: 0,
    y: 50,
    ease: "power2.out",
  });

  // Animate the album cards on load
  gsap.from("#album-list", {
    duration: 2,
    opacity: 0,
    y: -50,
    stagger: 0.5,
    ease: "power2.out",
  });

  // Animate the album details on click
  // gsap.from("#info-box", {
  //   duration: 1,
  //   opacity: 0,
  //   y: 50,
  //   ease: "power2.out",
  // });
}
