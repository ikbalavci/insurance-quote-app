<template>
  <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm py-3">
    <div class="container">
     
      <router-link to="/" class="navbar-brand d-flex align-items-center">

        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="32"
          height="32"
          fill="none"
          stroke="#0d6efd"
          stroke-width="2"
          stroke-linejoin="round"
          stroke-linecap="round"
          viewBox="0 0 24 24"
          aria-hidden="true"
        >
          <path d="M12 2L3 7v5c0 5 3 8 9 10 6-2 9-5 9-10V7l-9-5z" />
        </svg>

        <span>Avcı Sigorta</span>
      </router-link>

      <!-- Hamburger -->
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNav"
        aria-controls="navbarNav"
        aria-expanded="false"
        aria-label="Menüyü Aç"
      >
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- Menü -->
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item" v-for="item in navItems" :key="item.to">
            <router-link class="nav-link" :to="item.to">{{ item.label }}</router-link>
          </li>
        </ul>

        <!-- Sağ Taraf Butonları -->
        <div class="d-flex gap-2">
          
          <router-link to="/login" class="btn btn-primary">Üye Girişi</router-link>
        </div>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  name: 'AppNavbar',
  data() {
    return {
      isDarkMode: false,
      navItems: [
        { label: 'Anasayfa', to: '/' },
        { label: 'Ürünler', to: '/urunler' },
        { label: 'Kampanyalar', to: '/kampanyalar' },
        { label: 'İletişim', to: '/iletisim' }
      ]
    };
  },
};
</script>

