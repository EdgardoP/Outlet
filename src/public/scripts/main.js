let slideIndex = 0;
let slides = document.getElementsByClassName('slides')
mostrarSlide();


function siguienteSlide(n) {
    mostrarSlideElegido(slideIndex += n);
}

function dotSlide(n) {
    mostrarSlideElegido(slideIndex = n)
}

function mostrarSlideElegido(n) {
    let i;
    if (n > slides.length) { slideIndex = 1 }
    if (n < 1) { slideIndex = slides.length }
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none"
    }
    slides[slideIndex - 1].style.display = "block";
}

function mostrarSlide() {
    let i;
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = 'none';
    }
    slideIndex++;
    if (slideIndex > slides.length) { slideIndex = 1 }
    slides[slideIndex - 1].style.display = "block";
    setTimeout(mostrarSlide, 4000);
}