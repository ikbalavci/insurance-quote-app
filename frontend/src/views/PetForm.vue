<template>
    <div class="container my-5">
        <h2 class="form-title">Evcil Hayvan Sigortası</h2>
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
            <form @submit.prevent="nextStep">
                <h4>Pet Bilgileri</h4>
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Pet Adı</label>
                        <input type="text" class="form-control" v-model="formData.petAdi">
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Pet Doğum Tarihi</label>
                        <input type="date" class="form-control" v-model="formData.petDogumTarihi">
                    </div>
                </div>
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Pet Cinsiyeti</label>
                        <select class="form-select" v-model="formData.petCinsiyet">
                            <option>Erkek</option>
                            <option>Dişi</option>
                        </select>
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Pet Türü</label>
                        <select class="form-select" v-model="formData.petTuru">
                            <option>Kedi</option>
                            <option>Köpek</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Pet Cinsi</label>
                        <select class="form-select" v-model="formData.petCinsi">
                            <option>Siyam kedisi</option>
                            <option>British</option>
                            <option>Scotish</option>
                            <option>İran kedisi</option>
                            <option>Birman</option>
                            <option>Sarman</option>
                            <option>Tekir</option>
                            <option>Doberman</option>
                            <option>Buldog</option>
                            <option>Golden Retriever</option>
                            <option>Anadolu Çoban Köpeği</option>
                            <option>Pug</option>
                            <option>Afgan Tazısı</option>
                        </select>
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Pet Chip Numarası</label>
                        <input type="text" class="form-control" v-model="formData.petChipNo">
                    </div>
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
    name: 'DaskForm',
    data() {
        return {
            step: 1,
            formData: {
                sigortaTuru: '',
                tcKimlik: '',
                dogumTarihi: '',
                telefon: '',
                email: '',
                petAdi: '',
                petDogumTarihi: '',
                petCinsiyet: '',
                petTuru: '',
                petCinsi: '',
                petChipNo: ''

            }
        };
    },
    methods: {
        nextStep() {
            if (this.step < 3) {
                this.step++;
            }
        },
        submitForm() {
            console.log('veri:', this.formData);
            alert('Teklif Hazırlanıyor...');
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