const navbar = () => {
  const togglebutton = document.getElementsByClassName('hamburger-menu')[0];
  const navbarLinks = document.getElementsByClassName('navbar-links')[0];

  togglebutton.addEventListener('click', () => {
    navbarLinks.classList.toggle('active');
    console.log('hello matey');
  });
}


export { navbar };
