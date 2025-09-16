<template>
    <div class="container my-5">
        <h2 class="form-title">KASKO</h2>
        <div v-if="step === 1" class="form-section shadow-sm">
            <h4>Poliçe Durumu</h4>
            <form @submit.prevent="nextStep">
                <div class="mb-3">
                    <label class="form-label">Lütfen teklif almak istediğiniz poliçe durumunu seçiniz</label><br>

                    <div class="d-flex flex-wrap gap-3">
                        <label class="card-radio" :class="{ selected: formData.policeDurum === 'sigortaYenileme' }"
                            for="sigortaYenileme">
                            <input type="radio" id="sigortaYenileme" value="sigortaYenileme"
                                v-model="formData.policeDurum" class="d-none" />
                            <div class="card-content">
                                Motosikletimin Sigortası Bitiyor
                            </div>
                        </label>

                        <label class="card-radio" :class="{ selected: formData.policeDurum === 'ikinciEl' }"
                            for="ikinciEl">
                            <input type="radio" id="ikinciEl" value="ikinciEl" v-model="formData.policeDurum"
                                class="d-none" />
                            <div class="card-content">
                                İkinci El Motosiklet Aldım
                            </div>
                        </label>

                        <label class="card-radio" :class="{ selected: formData.policeDurum === 'sifir' }" for="sifir">
                            <input type="radio" id="sifir" value="sifir" v-model="formData.policeDurum"
                                class="d-none" />
                            <div class="card-content">
                                Sıfır Motosiklet Aldım
                            </div>
                        </label>
                    </div>
                </div>

                <button class="btn btn-primary mt-2" type="submit">Sonraki</button>
            </form>
        </div>


        <div v-if="step === 2" class="form-section shadow-sm">
            <h4>Sigortalı Bilgileri</h4>
            <form @submit.prevent="nextStep">

                <div class="mb-3">
                    <label class="form-label">Sigortalı Türü</label><br>
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

        <div v-if="step === 3" class="form-section shadow-sm">
            <h4>Araç Bilgileri</h4>
            <form @submit.prevent="nextStep">
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Plaka İli</label>
                        <input type="text" class="form-control" v-model="formData.plakaSehri">
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Model Yılı</label>
                        <input type="text" class="form-control" v-model="formData.modelYili">
                    </div>
                </div>
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Marka</label>
                        <input type="text" class="form-control" v-model="formData.marka">
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Model</label>
                        <input type="text" class="form-control" v-model="formData.model">
                    </div>
                </div>
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Kullanım Şekli</label>
                        <select class="form-select" v-model="formData.kullanimSekli">
                            <option>Otomobil</option>
                            <option>Taksi</option>
                            <option>Minibüs</option>
                            <option>Otobüs</option>
                            <option>Kamyonet</option>
                            <option>Kamyon</option>
                            <option>İş makinesi</option>
                        </select>
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Kullanım Detayı</label>
                        <select class="form-select" v-model="formData.kullanimDetayi">
                            <option>Hususi</option>
                            <option>Rent A Car</option>
                            <option>Dolmuş</option>
                            <option>Jip-SUV</option>
                            <option>Servis</option>
                            <option>Ticari</option>
                            <option>Nakliye</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Motor no</label>
                        <input type="text" class="form-control" v-model="formData.motorNo">
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Şasi no</label>
                        <input type="text" class="form-control" v-model="formData.sasiNo">
                    </div>
                </div>
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Yolcu sayısı</label>
                        <input type="text" class="form-control" v-model="formData.yolcuSayisi">
                    </div>
                    <div class="mb-3 col-md-6">
                        <input type="checkbox">
                        <label for="">hasarsızlık indirimi kullan</label>
                    </div>
                </div>
                <button class="btn btn-primary mt-2" type="submit">Sonraki</button>
            </form>
        </div>
        <div v-if="step === 4" class="form-section text-center">
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
    name: 'KaskoForm',
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
                plakaSehri: '',
                modelYili: '',
                marka: '',
                model: '',
                kullanimSekli: '',
                kullanimDetayi: '',
                motorNo: '',
                sasiNo: '',
                yolcuSayisi: ''

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
            if (this.step < 4) {
                this.step++
            }
        },
        submitForm() {
            axios.post("http://localhost:5210/api/kasko/teklif", this.formData)
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

.card-radio {
    cursor: pointer;
    border: 2px solid #ccc;
    border-radius: 10px;
    padding: 15px 20px;
    min-width: 250px;
    text-align: center;
    transition: all 0.3s ease;
    background-color: #fff;
    box-shadow: 0 0 6px rgba(0, 0, 0, 0.05);
}

.card-radio:hover {
    border-color: #007bff;
}

.card-radio.selected {
    border-color: #007bff;
    background-color: #e9f3ff;
}

.card-content {
    font-weight: 500;
    color: #333;
}
</style>