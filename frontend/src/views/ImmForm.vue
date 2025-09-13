<template>
    <div class="container my-5">
        <h2 class="form-title">İMM (İhtiyati Mali Mesuliyet Sigortası)</h2>

        <div v-if="step === 1" class="form-section shadow-sm">
            <h4>Sigortalı Bilgileri</h4>
            <form @submit.prevent="nextStep">

                <div class="mb-3">
                    <label class="form-label">Sigortalı Türü</label>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" v-model="formData.sigortaTuru" id="sahis" value="sahis">
                        <label class="form-check-label" for="sahis">Şahıs</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" v-model="formData.sigortaTuru" id="sirket" value="sirket">
                        <label class="form-check-label" for="sirket">Şirket</label>
                    </div>
                </div>
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">TC Kimlik No</label>
                        <input type="Text" class="form-control" v-model="formData.tcKimlik">
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Doğum Tarihi</label>
                        <input type="date" class="form-control" v-model="formData.dogumTarihi">
                    </div>
                </div>
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Telefon</label>
                        <input type="text" class="form-control" v-model="formData.telefon" placeholder="5XXXXXXXXX">
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">E-posta</label>
                        <input type="email" class="form-control" v-model="formData.email"
                            placeholder="ornek@sigorta.com">
                    </div>
                </div>
                <button class="btn btn-primary mt-2" type="submit">Sonraki</button>
            </form>
        </div>

        <div v-if="step === 2" class="form-section shadow sm">
            <h4>Araç Bilgileri</h4>
            <form @submit.prevent="nextStep">
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Aracın Plakası</label>
                        <input type="text" class="form-control" v-model="formData.plaka" placeholder="00 AAA 0000">
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Ruhsat Seri No</label>
                        <input type="textarea" class="form-control" v-model="formData.ruhsatSeriNo">
                    </div>
                </div>
                <button class="btn btn-primary mt-2" type="submit">Sonraki</button>
            </form>
        </div>

        <div v-if="step === 3" class="form-section text-center">
            <h4>Tüm Bilgiler Alındı 🎉</h4>
            <p>Teklif almak için aşağıdaki butona tıklayın.</p>
            <button class="btn btn-success" @click="submitForm">Teklif Al</button>
        </div>
    </div>

</template>

<script>
import Swal from 'sweetalert2';

export default {
    name: "ImmForm",
    data() {
        return {
            step: 1,
            formData: {
                sigortaTuru: '',
                tcKimlik: '',
                dogumTarihi: '',
                telefon: '',
                email: '',
                plaka: '',
                ruhsatSeriNo: ''

            }
        };
    },
    methods: {
        nextStep() {
                  if (this.step === 1) {
        if (
          !this.formData.sigortaTuru ||
          !this.formData.tcKimlik.trim() ||
          !this.formData.dogumTarihi ||
          !this.formData.telefon.trim() ||
          !this.formData.email.trim()
        ) {
          Swal.fire({
            icon: 'warning',
            title: 'Eksik Bilgi',
            text: 'Lütfen tüm sigortalı bilgilerini doldurunuz.'
          });
          return;
        }
      } else if (this.step === 2) {
        if (
          !this.formData.plaka.trim() ||
          !this.formData.ruhsatSeriNo.trim()
        ) {
          Swal.fire({
            icon: 'warning',
            title: 'Eksik Bilgi',
            text: 'Lütfen tüm adres bilgilerini doldurunuz.'
          });
          return;
        }
      } 
            if (this.step < 3) {
                this.step++;
            }
        },
        submitForm() {
            console.log('veri:', this.formData);
            alert('bilgiler gönderildi');
        }
    }
};
</script>

<style scoped>
.form-title {
    font-weight: bold;
    border-bottom: 3px solid #0d6efd;
    padding-bottom: 8px;
    margin-bottom: 32px;
}

.form-section {
    background-color: #f8f9fa;
    padding: 24px;
    border-radius: 12px;
    margin-bottom: 32px;
    border: 1px solid #dee2e6;
}
</style>