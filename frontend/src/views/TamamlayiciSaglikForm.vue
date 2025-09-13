<template>
    <div class="container my-5">
        <h2 class="form-title">Tamamlayıcı Sağlık Sigortası</h2>
        <div v-if="step === 1" class="form-section shadow-sm">
            <h4>Sigortalı Bilgileri</h4>
            <form @submit.prevent="nextStep">

                <div class="mb-3">
                    <label class="form-label">Sigortalı Türü</label>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" v-model="formData.sigortaTuru" id="sahis"
                            value="sahis">
                        <label class="form-check-label" for="sahis">Şahıs</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" v-model="formData.sigortaTuru" id="sirket"
                            value="sirket">
                        <label class="form-check-label" for="sirket">Şirket</label>
                    </div>
                </div>

                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">TC Kimlik No</label>
                        <input type="text" class="form-control" v-model="formData.tcKimlik">
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Doğum Tarihi</label>
                        <input type="date" class="form-control" v-model="formData.dogumTarihi">
                    </div>
                </div>

                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Telefon</label>
                        <input type="text" class="form-control" v-model="formData.telefon" placeholder="05XXXXXXXXX">
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

        <div v-if="step === 2" class="form-section shadow-sm">
            <h4>Detay Kayıt</h4>
            <form @submit.prevent="nextStep">
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Aile bireyi ekle</label>
                        <select class="form-select" v-model="formData.aileBireyi">
                            <option value="">Eş</option>
                            <option value="">Çocuk</option>
                        </select>
                        <h5>seçince bilgileri doldurulmalı!!</h5>
                        <button class="btn btn-primary mt-2">Bu kişiyi sigorta kapsamına dahil et</button>
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Doğum Teminatı</label>
                        <select class="form-select" v-model="formData.dogumTeminat">
                            <option value="">hariç</option>
                            <option value="">dahil(eko)</option>
                            <option value="">dahil(geniş)</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Cinsiyet</label>
                        <select class="form-select" v-model="formData.cinsiyet">
                            <option value="">Erkek</option>
                            <option value="">Kadın</option>
                        </select>
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Meslek Bilgisi</label>
                        <input type="text" class="form-control" v-model="formData.meslek">
                    </div>
                    <!-- <div class="mb-3 col-md-6">
                        <label class="form-label">Tel. No:</label>
                        <input type="text" class="form-control" v-model="FormData.">
                    </div> -->
                </div>
                <button class="btn btn-primary mt-2" type="submit">TEKLİF AL</button>
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
export default {
    name: 'TamamlayiciSaglikForm',
    data() {
        return {
            step: 1,
            formData: {
                policeDurum: '',
                sigortaTuru: '',
                tcKimlik: '',
                dogumTarihi: '',
                telefon: '',
                email: '',
                aileBireyi: '',
                dogumTeminat: '',
                cinsiyet: '',
                meslek: '',
            }
        };
    },
    methods: {
        nextStep() {
            if (this.step < 3) {
                this.step++
            }
        },
        submitForm() {
            console.log('veri', this.formData);
            alert('bilgiler gönderildi ');
        }
    },
}
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