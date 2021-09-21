let slideIndex = 1
mostrarSlide(slideIndex);

function siguienteSlide(n) {
    mostrarSlide(slideIndex += n);
}

function dotSlide(n) {
    mostrarSlide(slideIndex = n);
}

function mostrarSlide(n) {
    let i;
    let slides = document.getElementsByClassName('slides')
    let dots = document.getElementsByClassName('dot')
    if (n > slides.length) { slides = 1 }
    if (n < 1) { slideIndex = slides.length }
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";    
    }
    for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex - 1].style.display = "block"
    dots[slideIndex - 1].className += " active";
}