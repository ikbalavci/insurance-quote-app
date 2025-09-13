<template>
  <div class="container mt-5">
    <div class="card shadow-lg p-4 rounded-4">
      <h2 class="text-center mb-4">📬 İletişim</h2>
      <form @submit.prevent="submitForm">
        <div class="mb-3">
          <label for="name" class="form-label">👤 Ad Soyad</label>
          <input type="text" class="form-control rounded-3" id="name" placeholder="Adınızı girin" v-model="form.name" />
        </div>
        <div class="mb-3">
          <label for="email" class="form-label ">📧 E-posta</label>
          <input type="email" class="form-control rounded-3" id="email" placeholder="E-posta adresiniz"
            v-model="form.email" />
        </div>
        <div class="mb-4">
          <label for="message" class="form-label">💬 Mesajınız</label>
          <textarea class="form-control rounded-3 message-box" id="message" rows="5"
            placeholder="Mesajınızı buraya yazın..." v-model="form.message"></textarea>
        </div>
        <div class="text-center">
          <button class="glow-on-hover px-5 py-2" type="submit" >Gönder</button>
        </div>
      </form>
    </div>
    

  </div>
</template>

<script>import Swal from 'sweetalert2/dist/sweetalert2';
export default {
  name: 'ContactView',
  
  data() {
    return {
      form: {
        name: '',
        email: '',
        message: ''
      },
      messagesList : []
    };
  },
  computed:{
      checkForm(){
      if (this.form.name == null || this.form.name == '' || this.form.email == null || this.form.email =='' || this.form.message == null || this.form.message == '') {
        return false;
      }else
      {
        return true;
      }
    }
  },
  methods: {
    submitForm() {
    if (!this.form.name.trim() || !this.form.email.trim() || !this.form.message.trim()) {
      Swal.fire({
        title: "Uyarı!",
        text: "Lütfen tüm alanları doldurunuz.",
        icon: "warning"
      });
      return;
    }
    this.createContact();

      Swal.fire({
        title: "TEŞEKKÜRLER!",
        text: "Mesajınız başarıyla gönderildi!",
        icon: "success"
      });
      
   
      this.getMessageLocal();
    },
    cleanForm(){
        
      this.form.name = '';
      this.form.email = '';
      this.form.message = '';
    },
    getMessageLocal(){
      // Mevcut mesajları çek
      this.messagesList = JSON.parse(localStorage.getItem('messages')) || [];
    },
    createContact(){
      this.messagesList.push({
        name: this.form.name,
        email: this.form.email,
        message: this.form.message,
        date: new Date().toLocaleString()
      });
      localStorage.setItem('messages', JSON.stringify(this.messagesList));
      this.cleanForm();
    },

  },
  mounted(){
    this.getMessageLocal();
  }
};
</script>


