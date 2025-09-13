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
    </div>
</template>

<script>
export default{
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

            }
        };
    },
    methods: {
        nextStep(){
            if (this.step <4) {
                this.step++
            }
        },
        submitForm(){
            console.log('veri',this.formData);
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