document.addEventListener("DOMContentLoaded", function() {
    const recuperarForm = document.getElementById("recuperar-form");

    recuperarForm.addEventListener("submit", function(event) {
        event.preventDefault(); // Impede o envio automático do formulário

        const email = document.getElementById("email").value;

        // Validação simples
        if (email === "") {
            alert("Por favor, preencha o campo de e-mail.");
            return;
        }

        // Simulação de envio de instruções para recuperação de senha
        alert("Instruções para recuperação de senha foram enviadas para o e-mail: " + email);
        
        // Redirecionar para a página de login após simulação
        window.location.href = "login.html";
    });
});
