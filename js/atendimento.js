document.addEventListener("DOMContentLoaded", function() {
    const sendButton = document.getElementById("send-button");
    const messageInput = document.getElementById("message-input");
    const messagesContainer = document.getElementById("messages");

    // Protocolo fictício para o atendimento
    let protocolNumber = 1; // Inicia o contador de protocolo

    sendButton.addEventListener("click", function() {
        const message = messageInput.value.trim();

        if (message !== "") {
            // Adiciona a mensagem do usuário à caixa de mensagens
            const userMessageDiv = document.createElement("div");
            userMessageDiv.classList.add("user-message");
            userMessageDiv.textContent = message;
            messagesContainer.appendChild(userMessageDiv);

            // Limpa o input
            messageInput.value = "";

            // Simula uma resposta do suporte
            setTimeout(() => {
                const supportMessageDiv = document.createElement("div");
                supportMessageDiv.classList.add("support-message");
                supportMessageDiv.textContent = `Atendente: Recebemos sua mensagem. Protocolo: #${protocolNumber++}`;
                messagesContainer.appendChild(supportMessageDiv);
                
                // Faz o scroll para a última mensagem
                messagesContainer.scrollTop = messagesContainer.scrollHeight;
            }, 1000); // Responde após 1 segundo
        }
    });
});
