const logo = document.getElementById("logo");
const barraLateral  = document.querySelector(".sidebar");
const spans = document.querySelectorAll(".sidebar span");
const main = document.querySelector("main");

logo.addEventListener("click", () => {
    barraLateral.classList.toggle("mini-sidebar");
    main.classList.toggle("min-main");
    spans.forEach(span => {
        span.classList.toggle("oculto");
    });
});
