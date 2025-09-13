<template>
  <div class="d-flex vh-100 justify-content-center align-items-center bg-light">
    <div class="card shadow-sm p-4 rounded-4" style="width: 320px;">
      <h3 class="text-center mb-4 fw-bold">Giriş Yap</h3>
      <form @submit.prevent="handleLogin">
        <div class="mb-3">
          <label for="text" class="form-label">TC Kimlik No</label>
          <input
            type="text"
            class="form-control"
            v-model="tcNo"
            required
          />
        </div>
        <div class="mb-4">
          <label for="text" class="form-label">Telefon Numarası</label>
          <input
            type="text"
            class="form-control"
            v-model="telNo"
            required
          />
        </div>
        <button type="submit" class="btn btn-primary w-100" :disabled="loading">
          <span v-if="loading" class="spinner-border spinner-border-sm me-2"></span>
          Giriş Yap
        </button>
      </form>
      <div class="mt-3 text-center">
        <small>Henüz hesabınız yok mu? <a href="#" class="text-decoration-none">Kayıt Ol</a></small>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "LoginView",
  data() {
    return {
      email: "",
      password: "",
      loading: false,
    };
  },
  methods: {
    handleLogin() {
      this.loading = true;

      // Simulate async login
      setTimeout(() => {
        this.loading = false;

        if (this.email === "user@example.com" && this.password === "123456") {
          alert("Giriş başarılı!");
          // Burada yönlendirme vb. işlemler yapılabilir
        } else {
          alert("TC No veya Tel No yanlış.");
        }
      }, 1200);
    },
  },
};
</script>

<style scoped>
body, html {
  margin: 0;
  height: 100%;
  font-family: "Montserrat", sans-serif;
}
</style>
