function toggleCategoria(element) {
    const subcategorias = element.nextElementSibling;
    const isVisible = subcategorias.style.display === "block";
    
    if (isVisible) {
        subcategorias.style.display = "none";
        element.classList.remove("active");
    } else {
        subcategorias.style.display = "block";
        element.classList.add("active");
    }
}
