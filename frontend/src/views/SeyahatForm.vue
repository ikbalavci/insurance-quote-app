<template>
    <div class="container my-5">
        <h2 class="form-title">Seyahat Sigortası</h2>
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
            <h4>Nereye Seyahat Ediyorsunuz?</h4>
            <form @submit.prevent="nextStep">
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Seyahat Bölgesi</label>
                        <select class="form-select" v-model="formData.bolge">
                            <option>Tüm Dünya</option>
                            <option>Tüm Avrupa Ülkeleri</option>
                            <option>Schengen Ülkeleri</option>
                        </select>
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Seyahat Edilecek Ülke</label>
                        <input type="text" class="form-control" v-model="formData.ulke">
                    </div>
                </div>
                <h4>Sağlık Teminatlar</h4>
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Seyahat Paket</label>
                        <select class="form-select" v-model="formData.paket">
                            <option value="teminat1">Standart Dünya</option>
                            <option value="teminat2">Standart Avrupa Schengen</option>
                            <option value="teminat3">Öğrenci Eğitim Seyahat Sağlık Avrupa</option>
                            <option value="teminat4">Öğrenci Eğitim Seyahat Sağlık Tüm Dünya</option>
                            <option value="teminat5">VIP</option>
                        </select>
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">AXA Ürün Seçimi</label>
                        <select class="form-select" v-model="formData.axaÜrün">
                            <option>Geniş seyahat ürün</option>
                            <option>Konsolosluk Vize</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Pandemi Teminatı</label>
                        <select class="form-select" v-model="formData.pandemi">
                            <option value="pandemi1">Pandemi dahil</option>
                            <option value="pandemi2">Pandemi hariç</option>
                        </select>
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Kapkaç Teminatı</label>
                        <select class="form-select" v-model="formData.kapkacTeminat">
                            <option>Kapkaç dahildir</option>
                            <option>Kapkaç hariçtir</option>
                        </select>
                    </div>
                </div>
                <h4>Seyahat Tarihi Aralığı</h4>
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Seyahat Başlangıç</label>
                        <input type="date" class="form-control" v-model="formData.seyahatBaslangic">
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Seyahat Bitiş</label>
                        <input type="date" class="form-control" v-model="formData.seyahatBitis">
                    </div>
                </div>
                <h4>Meslek Bilgisi</h4>
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Mesleğiniz nedir?</label>
                        <input type="Text" class="form-control" v-model="formData.meslek">
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
export default {
    name: 'SeyahatForm',
    data() {
        return {
            step: 1,
            formData: {
                sigortaTuru: '',
                tcKimlik: '',
                dogumTarihi: '',
                telefon: '',
                email: '',
                bolge: '',
                ulke: '',
                paket: '',
                axaÜrün: '',
                pandemi: '',
                kapkacTeminat: '',
                seyahatBaslangic: '',
                seyahatBitis: '',
                meslek: ''
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