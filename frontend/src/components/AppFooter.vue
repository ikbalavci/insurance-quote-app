<template>
  <footer class="custom-footer mt-5 border-top">
    <div class="container d-flex flex-column flex-md-row justify-content-between align-items-center">

      <!-- Sol kısım -->
      <div class="mb-3 mb-md-0 d-flex align-items-center">
        
        <span>© {{ new Date().getFullYear() }} Avcı Sigorta</span>
      </div>

      <!-- Sosyal ikonlar -->
      <div class="social-icons">
        <a href="https://github.com/ikbalavci" target="_blank" class="me-3" title="GitHub">
          <i class="fab fa-github fa-lg"></i>
        </a>
        <a href="https://www.linkedin.com/in/ikbal-avc%C4%B1-347a05234/" target="_blank" class="me-3" title="LinkedIn">
          <i class="fab fa-linkedin fa-lg"></i>
        </a>
        <a href="mailto:ikbalavci101@gmail.com" class="me-3" title="Mail Gönder">
          <i class="fas fa-envelope fa-lg"></i>
        </a>
        <router-link to="/messages" class="me-3" title="İletişime Geç">
          <i class="fas fa-comments fa-lg"></i>
        </router-link>
      </div>
    </div>
  </footer>
</template>

<style scoped>
.custom-footer {
  background-color: #f8f9fa; /* Açık gri ton */
  color: #343a40; /* Daha koyu gri yazılar */
  padding: 1.2rem 0;
  box-shadow: 0 -2px 6px rgba(0,0,0,0.08);
}

.custom-footer .social-icons a {
  color: #343a40;
  transition: all 0.3s ease;
}

.custom-footer .social-icons a:hover {
  color: #0d6efd; /* Bootstrap primary rengi */
  transform: scale(1.15);
}
</style>
