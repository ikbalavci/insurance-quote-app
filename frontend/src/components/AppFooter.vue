<template>
  <footer class="bg-dark text-white py-4 mt-5 border-top">
    <div class="container d-flex flex-column flex-md-row justify-content-between align-items-center">

      <div class="mb-3 mb-md-0 d-flex align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor"
          class="bi bi-person-circle me-2" viewBox="0 0 16 16">
          <path d="M11 10a3 3 0 1 0-6 0 3 3 0 0 0 6 0z" />
          <path fill-rule="evenodd"
            d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-4.468 12.51c.445-.767 1.118-1.372 1.98-1.724A5.985 5.985 0 0 1 8 11c.843 0 1.644.174 2.38.487.861.352 1.534.957 1.98 1.724A7 7 0 0 0 8 1z" />
        </svg>
        <span class="text-light">© {{ new Date().getFullYear() }} Avcı Sigorta</span>
      </div>

      <div class="social-icons">
        <a href="https://github.com/ikbalavci" target="_blank" class="text-white me-3" title="GitHub">
          <i class="fab fa-github fa-lg"></i>
        </a>
        <a href="https://www.linkedin.com/in/ikbal-avc%C4%B1-347a05234/" target="_blank" class="text-white me-3"
          title="LinkedIn">
          <i class="fab fa-linkedin fa-lg"></i>
        </a>
        <a href="mailto:ikbalavci101@gmail.com" class="text-white me-3" title="Mail Gönder">
          <i class="fas fa-envelope fa-lg"></i>
        </a>
        <router-link to="/messages" class="text-white" title="İletişime Geç">
          <i class="fas fa-comments fa-lg"></i>
        </router-link> 
      </div>
    </div>
  </footer>
</template>

