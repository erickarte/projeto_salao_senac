document.getElementById('login-form').addEventListener('submit', function(event) {
    event.preventDefault(); // Evitar o envio do formulário padrão

    const email = document.getElementById('email').value;
    const senha = document.getElementById('senha').value;

    // Aqui você pode adicionar lógica para autenticar o usuário
    console.log('Login realizado com:', { email, senha });

    // Exemplo: redirecionar após login bem-sucedido
    // window.location.href = 'pagina_inicial.html';
});
