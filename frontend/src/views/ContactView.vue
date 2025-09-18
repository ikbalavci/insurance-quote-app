<template>
  <div class="container mt-5">
    <div class="card shadow-lg p-5 rounded-4 contact-card mx-auto" style="max-width:600px;">
      <h2 class="text-center mb-4 contact-title">
        <i class="fas fa-envelope-open-text me-2"></i> İletişim
      </h2>
      <form @submit.prevent="submitForm">
        <div class="mb-3">
          <label for="name" class="form-label small-label">
            <i class="fas fa-user me-1"></i> Ad Soyad
          </label>
          <input type="text" class="form-control custom-input" id="name" placeholder="Adınızı girin"
            v-model="form.name" />
        </div>
        <div class="mb-3">
          <label for="email" class="form-label small-label">
            <i class="fas fa-envelope me-1"></i> E-posta
          </label>
          <input type="email" class="form-control custom-input" id="email" placeholder="E-posta adresiniz"
            v-model="form.email" />
        </div>
        <div class="mb-4">
          <label for="message" class="form-label small-label">
            <i class="fas fa-comment-dots me-1"></i> Mesajınız
          </label>
          <textarea class="form-control custom-input" id="message" rows="5" placeholder="Mesajınızı buraya yazın..."
            v-model="form.message"></textarea>
        </div>

        <div class="text-center">
          <button class="btn-modern" type="submit"><i class="fas fa-paper-plane me-1"></i> Gönder</button>
        </div>
      </form>
    </div>
  </div>


</template>

<script>
import Swal from 'sweetalert2/dist/sweetalert2';

export default {
  name: 'ContactView',
  data() {
    return {
      form: { name: '', email: '', message: '' },
      messagesList: []
    };
  },
  methods: {
    submitForm() {
      if (!this.form.name.trim() || !this.form.email.trim() || !this.form.message.trim()) {
        Swal.fire({ title: "Uyarı!", text: "Lütfen tüm alanları doldurunuz.", icon: "warning" });
        return;
      }
      this.createContact();
      Swal.fire({ title: "TEŞEKKÜRLER!", text: "Mesajınız başarıyla gönderildi!", icon: "success" });
    },
    cleanForm() {
      this.form = { name: '', email: '', message: '' };
    },
    getMessageLocal() {
      this.messagesList = JSON.parse(localStorage.getItem('messages')) || [];
    },
    createContact() {
      this.getMessageLocal();
      this.messagesList.push({
        name: this.form.name,
        email: this.form.email,
        message: this.form.message,
        date: new Date().toLocaleString()
      });
      localStorage.setItem('messages', JSON.stringify(this.messagesList));
      this.cleanForm();
    }
  },
  mounted() {
    this.getMessageLocal();
  }
};
</script>

<style scoped>
.contact-card {
  background-color: #f8f9fa;
  border: none;
}

.contact-title {
  font-size: 1.8rem;
  font-weight: 600;
  color: #270f0f;
}

.small-label {
  font-size: 0.9rem;
  font-weight: 500;
  color: #6c757d;
}

.custom-input {
  border-radius: 0.5rem;
  border: 1px solid #ced4da;
  padding: 0.65rem 1rem;
  transition: all 0.3s ease;
}

.custom-input:focus {
  border-color: #0d6efd;
  box-shadow: 0 0 8px rgba(13, 110, 253, 0.25);
}
</style>
