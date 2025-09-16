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
                        <select class="form-select" v-model="formData.axaUrun">
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

        <div v-if="teklifler && teklifler.length > 0" class="row mt-4">
            <div v-for="(t, i) in teklifler" :key="i" class="col-6 col-md-3 mb-3">
                <div class="card h-100 shadow-sm">
                    <img :src="firmaLogolari[t.firma]" class="card-img-top p-2" :alt="t.firma"
                        style="height: 50px; object-fit: contain;">
                    <div class="card-body p-2 text-center"> <!-- padding azaltıldı -->
                        <h6 class="card-title mb-1">{{ t.firma }}</h6> <!-- font küçültüldü -->
                        <p class="card-text mb-1">{{ t.aciklama }}</p>
                        <p class="card-text fw-bold mb-1">{{ t.fiyat }} TL</p>
                        <a :href="getFirmaLink(t.firma)" class="btn btn-sm btn-primary" target="_blank">Firma
                            Sayfası</a>
                    </div>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
import axios from 'axios';
import Swal from 'sweetalert2';
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
                axaUrun: '',
                pandemi: '',
                kapkacTeminat: '',
                seyahatBaslangic: '',
                seyahatBitis: '',
                meslek: ''
            },
            teklifler: [],
            firmaLogolari: {
                "Allianz": "https://otokocsigorta.com/content/uploads/companies-logo/allianz_sigorta_logo_sm-29dbb206-a.png",
                "AXA": "https://otokocsigorta.com/content/uploads/companies-logo/axa-sigorta-logo-new-173c3b0c-1.png",
                "Anadolu Sigorta": "https://otokocsigorta.com/content/uploads/companies-logo/anadolu_sigorta_logo_sm-833b63ee-9.png",
                "Ak Sigorta": "https://otokocsigorta.com/content/uploads/companies-logo/aksigorta_logo_sm-b5a428da-5.png",
                "Doğa Sigorta": "https://otokocsigorta.com/content/uploads/companies-logo/doga_sigorta_logo_sm-f05b05b0-b.png",
                "HDI Sigorta": "https://otokocsigorta.com/content/uploads/companies-logo/hdi_sigorta_logo_sm-7b0778be-7.png",
                "Mapfre Sigorta": "https://otokocsigorta.com/content/uploads/companies-logo/mapfre_sigorta_logo_sm-257dd028-e.png",
                "Türkiye Sigorta": "https://otokocsigorta.com/content/uploads/companies-logo/turkiye_sigorta_logo_sm-3f0f613e-e.png",
                "Sompo Sigorta": "https://otokocsigorta.com/content/uploads/companies-logo/sompo_sigorta_logo_sm-e75b2cba-5.png",
                "Neova": "https://otokocsigorta.com/content/uploads/companies-logo/neova-new-logo-0f17d7ac-a.png",
                "Ray Sigorta": "https://otokocsigorta.com/content/uploads/companies-logo/ray_sigorta_logo_sm-ef5b5e44-e.png",
                "Quick Sigorta": "https://otokocsigorta.com/content/uploads/companies-logo/quick-sigorta-logo-new-3abc0595-e.png"
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
            axios.post("http://localhost:5210/api/seyahat/teklif", this.formData)
                .then(res => {
                    Swal.fire({
                        icon: 'success',
                        title: 'Teklifler Hazır!',
                        text: 'Aşağıda teklifleri görebilirsiniz.'
                    });

                    console.log("Teklifler:", res.data);
                    // Burada teklifleri ekranda gösterecek şekilde state’e kaydedebilirsin
                    this.teklifler = res.data;
                })
                .catch(err => {
                    Swal.fire({
                        icon: 'error',
                        title: 'Hata!',
                        text: err.response?.data?.message || "Bir hata oluştu"
                    });
                });
        },

        getFirmaLink(firma) {
            const links = {
                "Allianz": "https://www.allianz.com.tr/tr_TR.html#/customer-lead-form",
                "AXA": "https://www.axasigorta.com.tr/",
                "Anadolu Sigorta": "https://www.anadolusigorta.com.tr/",
                "Ak Sigorta": "https://www.aksigorta.com.tr/",
                "Doğa Sigorta": "https://www.dogasigorta.com/",
                "HDI Sigorta": "https://www.hdisigorta.com.tr/",
                "Mapfre Sigorta": "https://www.mapfre.com.tr/sigorta-tr/bireysel/",
                "Türkiye Sigorta": "https://www.turkiyesigorta.com.tr/",
                "Sompo Sigorta": "https://www.somposigorta.com.tr/",
                "Neova": "https://www.neova.com.tr/",
                "Ray Sigorta": "https://www.raysigorta.com.tr/",
                "Quick Sigorta": "https://www.quicksigorta.com/"
            };
            return links[firma] || "#";
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