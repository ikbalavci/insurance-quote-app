<template>

  <div :class="themeClass" class="d-flex flex-column min-vh-100">
    <div>
      <AppNavbar />
    </div>

    <main class="flex-fill">
      <router-view />
    </main>

    <AppFooter />
  </div>
</template>

<script setup>

import AppNavbar from './components/AppNavbar.vue'
import AppFooter from './components/AppFooter.vue'

</script>

<style>
html {
  overflow-y: scroll;
}
</style>
