<template>
  <div class="home">
    <swiper
      :modules="modules"
      navigation
      :slides-per-view="1"
      :space-between="30"
      class="mySwiper custom-swiper"
    >
      <swiper-slide><img src="../assets/slider-1.jpg" alt="proje1" /></swiper-slide>
      <swiper-slide><img src="../assets/slider-2.jpg" alt="blockchain" /></swiper-slide>
      <swiper-slide><img src="../assets/dask.jpg" alt="image" /></swiper-slide>
      <swiper-slide><img src="../assets/slider-1.jpg" alt="proje2" /></swiper-slide>
    </swiper>
  </div>

  <section class="bg-light py-5 text-center">
  <div class="container">
    <h1 class="display-5 fw-bold">Sigortanızı Karşılaştırın, En Uygun Teklifi Alın!</h1>
    <p class="lead mt-3">İhtiyacınıza özel sigorta tekliflerini dakikalar içinde görüntüleyin. Tüm büyük sigorta şirketleri tek bir yerde.</p>
    <router-link to="/urunler" class="btn btn-primary btn-lg mt-3">Teklif Almaya Başla</router-link>
  </div>
</section>

<section class="py-5">
  <div class="container">
    <h2 class="text-center mb-5">Neler Sunuyoruz?</h2>
    <div class="row text-center">
      <div class="col-md-4 mb-4">
        <i class="bi bi-house fs-1 text-primary"></i>
        <h5 class="mt-3">Konut Sigortası</h5>
        <p>Evinizi yangın, deprem ve doğal afetlere karşı güvence altına alın.</p>
      </div>
      <div class="col-md-4 mb-4">
        <i class="bi bi-car-front fs-1 text-primary"></i>
        <h5 class="mt-3">Araç Sigortası</h5>
        <p>Trafik ve kasko sigortası seçenekleriyle aracınızı güvenceye alın.</p>
      </div>
      <div class="col-md-4 mb-4">
        <i class="bi bi-heart-pulse fs-1 text-primary"></i>
        <h5 class="mt-3">Sağlık Sigortası</h5>
        <p>Kendiniz ve sevdikleriniz için kapsamlı sağlık sigortası çözümleri.</p>
      </div>
    </div>
  </div>
</section>

<section class="bg-light py-5">
  <div class="container">
    <h2 class="text-center mb-5">Nasıl Çalışır?</h2>
    <div class="row text-center">
      <div class="col-md-3">
        <div class="p-3 border rounded shadow-sm">
          <h1 class="display-6 text-primary">1</h1>
          <h5>Sigortanı Seç</h5>
          <p>İhtiyacın olan sigorta türünü belirle ve taklifler için devam et.</p>
        </div>
      </div>
      <div class="col-md-3">
        <div class="p-3 border rounded shadow-sm">
          <h1 class="display-6 text-primary">2</h1>
          <h5>Formu Doldur</h5>
          <p>Kısa formu doldurarak gerekli bilgileri gir.</p>
        </div>
      </div>
      <div class="col-md-3">
        <div class="p-3 border rounded shadow-sm">
          <h1 class="display-6 text-primary">3</h1>
          <h5>Teklifleri Karşılaştır</h5>
          <p>Birden fazla sigorta şirketinden teklif al.</p>
        </div>
      </div>
      <div class="col-md-3">
        <div class="p-3 border rounded shadow-sm">
          <h1 class="display-6 text-primary">4</h1>
          <h5>Sigortanı Seç</h5>
          <p>Sana en uygun teklifi seç ve işlemini tamamla.</p>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="py-5">
  <div class="container">
    <h2 class="text-center mb-4">Sık Sorulan Sorular</h2>
    <div class="accordion" id="faqAccordion">
      <div class="accordion-item">
        <h2 class="accordion-header" id="faq1">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#answer1">
            Teklif almak ücretli mi?
          </button>
        </h2>
        <div id="answer1" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
          <div class="accordion-body">
            Hayır. Sitemiz üzerinden aldığınız tüm sigorta teklifleri tamamen ücretsizdir.
          </div>
        </div>
      </div>

      <div class="accordion-item">
        <h2 class="accordion-header" id="faq2">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#answer2">
            Verdiğim bilgiler güvende mi?
          </button>
        </h2>
        <div id="answer2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
          <div class="accordion-body">
            Evet. Bilgileriniz KVKK kapsamında korunur ve üçüncü kişilerle paylaşılmaz.
          </div>
        </div>
      </div>
    </div>
  </div>
</section>



  <br><br><br>
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <h2 class="text-center mb-5">Anlaşmalı Sigorta Şirketleri</h2>
      </div>
    </div>
    <br><br>
    <div class="col col-12 ins-companies">
      <div class="row">
        <div class="col-6 col-md-2">
          <a href="https://www.aksigorta.com.tr/" title="Ak Sigorta" class="box-shadow ins-comp-logo" target="_blank">
            <img src="https://otokocsigorta.com/content/uploads/companies-logo/aksigorta_logo_sm-b5a428da-5.png" width="100%">
          </a>
        </div>
        <div class="col-6 col-md-2">
          <a href="https://www.allianz.com.tr/tr_TR.html#/customer-lead-form" title="Allianz Sigorta" class="box-shadow ins-comp-logo" target="_blank">
            <img src="https://otokocsigorta.com/content/uploads/companies-logo/allianz_sigorta_logo_sm-29dbb206-a.png" width="100%">
          </a>
        </div>
        <div class="col-6 col-md-2">
          <a href="https://www.anadolusigorta.com.tr/" title="Anadolu Sigorta" class="box-shadow ins-comp-logo" target="_blank">
            <img src="https://otokocsigorta.com/content/uploads/companies-logo/anadolu_sigorta_logo_sm-833b63ee-9.png" width="100%">
          </a>
        </div>
        <div class="col-6 col-md-2">
          <a href="https://www.axasigorta.com.tr/" title="Axa Sigorta" class="box-shadow ins-comp-logo" target="_blank">
            <img src="https://otokocsigorta.com/content/uploads/companies-logo/axa-sigorta-logo-new-173c3b0c-1.png" width="100%">
          </a>
        </div>
        <div class="col-6 col-md-2">
          <a href="https://www.dogasigorta.com/" title="Doğa Sigorta" class="box-shadow ins-comp-logo" target="_blank">
            <img src="https://otokocsigorta.com/content/uploads/companies-logo/doga_sigorta_logo_sm-f05b05b0-b.png" width="100%">
          </a>
        </div>
        <div class="col-6 col-md-2">
          <a href="https://www.hdisigorta.com.tr/" title="HDI Sigorta" class="box-shadow ins-comp-logo" target="_blank">
            <img src="https://otokocsigorta.com/content/uploads/companies-logo/hdi_sigorta_logo_sm-7b0778be-7.png" width="100%">
          </a>
        </div>
        <div class="col-6 col-md-2">
          <a href="https://www.mapfre.com.tr/sigorta-tr/bireysel/" title="Mapfre Sigorta" class="box-shadow ins-comp-logo" target="_blank">
            <img src="https://otokocsigorta.com/content/uploads/companies-logo/mapfre_sigorta_logo_sm-257dd028-e.png" width="100%">
          </a>
        </div>
        <div class="col-6 col-md-2">
          <a href="https://www.turkiyesigorta.com.tr/" title="Türkiye Sigorta" class="box-shadow ins-comp-logo" target="_blank">
            <img src="https://otokocsigorta.com/content/uploads/companies-logo/turkiye_sigorta_logo_sm-3f0f613e-e.png" width="100%">
          </a>
        </div>
        <div class="col-6 col-md-2">
          <a href="https://www.somposigorta.com.tr/" title="Sompo Sigorta" class="box-shadow ins-comp-logo" target="_blank">
            <img src="https://otokocsigorta.com/content/uploads/companies-logo/sompo_sigorta_logo_sm-e75b2cba-5.png" width="100%">
          </a>
        </div>
        <div class="col-6 col-md-2">
          <a href="https://www.neova.com.tr/" title="Neova Sigorta" class="box-shadow ins-comp-logo" target="_blank">
            <img src="https://otokocsigorta.com/content/uploads/companies-logo/neova-new-logo-0f17d7ac-a.png" width="100%">
          </a>
        </div>
        <div class="col-6 col-md-2">
          <a href="https://www.raysigorta.com.tr/" title="Ray Sigorta" class="box-shadow ins-comp-logo" target="_blank">
            <img src="https://otokocsigorta.com/content/uploads/companies-logo/ray_sigorta_logo_sm-ef5b5e44-e.png" width="100%">
          </a>
        </div>
        <div class="col-6 col-md-2">
          <a href="https://www.quicksigorta.com/" title="Quick Sigorta" class="box-shadow ins-comp-logo" target="_blank">
            <img src="https://otokocsigorta.com/content/uploads/companies-logo/quick-sigorta-logo-new-3abc0595-e.png" width="100%">
          </a>
        </div>
      </div>
    </div>
  </div>

</template>

<script>
import { Swiper, SwiperSlide } from 'swiper/vue';
import { Navigation } from 'swiper/modules';
import 'swiper/css';
import 'swiper/css/navigation';


export default {
  name: 'HomeView',
  components: {
    Swiper,
    SwiperSlide
  },

data(){
  return{
    modules: [Navigation]
  }
}
}
</script>
