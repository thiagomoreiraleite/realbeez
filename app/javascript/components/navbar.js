const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 50) {
        navbar.classList.add('navbar-lewagon-white');
        // navbar.style.backgroundColor = 'white';
      } else {
        navbar.classList.remove('navbar-lewagon-white');
        // navbar.style.backgroundColor = 'transparen';
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
