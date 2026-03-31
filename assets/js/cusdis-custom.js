// Aguarda o Cusdis carregar completamente
function waitForCusdis() {
  let attempts = 0;
  const maxAttempts = 20; // 10 segundos máximo (20 * 500ms)
  
  const interval = setInterval(() => {
    attempts++;
    const iframe = document.querySelector('#cusdis_thread iframe');
    
    if (iframe && iframe.contentDocument) {
      clearInterval(interval);
      customizeCusdis(iframe.contentDocument);
    } else if (attempts >= maxAttempts) {
      clearInterval(interval);
      console.log('Cusdis não carregou a tempo');
    }
  }, 500);
}

function customizeCusdis(doc) {
  console.log('Customizando Cusdis...');
  
  // 1. Campo Nome (Nickname)
  const nameLabel = doc.querySelector('label[for="name"]');
  if (nameLabel) {
    nameLabel.innerText = 'Nome';
    nameLabel.style.color = '#ffffff';
    nameLabel.style.fontFamily = "'iA Writer Duo', monospace";
  }
  
  // 2. Campo Email
  const emailLabel = doc.querySelector('label[for="email"]');
  if (emailLabel) {
    emailLabel.innerText = 'Email (opcional)';
    emailLabel.style.color = '#ffffff';
    emailLabel.style.fontFamily = "'iA Writer Duo', monospace";
  }
  
  // 3. Botão Enviar
  const submitBtn = doc.querySelector('button[type="submit"]');
  if (submitBtn) {
    submitBtn.innerText = 'Enviar';
    submitBtn.style.backgroundColor = '#88aaff';
    submitBtn.style.color = '#0e0525';
    submitBtn.style.fontFamily = "'iA Writer Duo', monospace";
  }
  
  // 4. Links "Reply" (podem estar em diferentes lugares)
  // Espera um pouco para os comentários carregarem
  setTimeout(() => {
    // Procura por qualquer link com texto "Reply"
    const replyLinks = doc.querySelectorAll('a');
    replyLinks.forEach(link => {
      if (link.innerText === 'Reply') {
        link.innerText = 'Comentário';
        link.style.color = '#88aaff';
        link.style.fontFamily = "'iA Writer Duo', monospace";
      }
    });
    
    // Procura também por spans ou outros elementos com texto "Reply"
    const allElements = doc.querySelectorAll('*');
    allElements.forEach(el => {
      if (el.innerText === 'Reply' && el.tagName !== 'A') {
        el.innerText = 'Comentário';
        el.style.color = '#ffffff';
      }
    });
  }, 1000); // aguarda 1 segundo para os comentários carregarem
}

// Executa quando a página carregar
document.addEventListener('DOMContentLoaded', waitForCusdis);

// Também observa mudanças no iframe (para quando novos comentários são carregados)
const observer = new MutationObserver((mutations) => {
  const iframe = document.querySelector('#cusdis_thread iframe');
  if (iframe && iframe.contentDocument) {
    customizeCusdis(iframe.contentDocument);
  }
});

observer.observe(document.body, { childList: true, subtree: true });