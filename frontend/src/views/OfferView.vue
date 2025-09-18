<template>
  <div class="container my-5">
    <!-- Başlık -->
    <div class="text-center mb-5">
      <h2><i class="fas fa-tags me-2"></i> Güncel Kampanyalar</h2>
      <p class="lead">
        En avantajlı sigorta kampanyaları burada! Hem cebinizi hem geleceğinizi korumak için özel fırsatları kaçırmayın.
      </p>
    </div>

    <!-- Kampanya Kartları -->
    <div class="row g-4">
      <div
        v-for="(campaign, index) in campaigns"
        :key="index"
        class="col-md-4"
      >
        <router-link :to="campaign.link" class="text-decoration-none">
          <div class="card h-100 shadow-sm border-0 rounded-4 campaign-card">
            <img :src="campaign.image" class="card-img-top" :alt="campaign.title">
            <div class="card-body">
              <h5 class="card-title">
                <i :class="campaign.icon" class="me-2"></i> {{ campaign.title }}
              </h5>
              <p class="card-text">{{ campaign.description }}</p>
            </div>
          </div>
        </router-link>
      </div>
    </div>

    <!-- Alt Uyarı -->
    <div class="alert alert-warning text-center mt-5 rounded-4" role="alert">
      ⏳ Kampanyalar sınırlı bir süre için geçerlidir. Fırsatları kaçırmamak için hemen başvurun!
    </div>
  </div>
</template>

<script>
export default {
  name: "CampaignsView",
  data() {
    return {
      campaigns: [
        {
          title: "İlk Trafik Sigortası Alımına Özel %10 İndirim",
          description:
            "Yeni müşterilerimize özel, ilk zorunlu trafik sigortasında %10 indirim fırsatı! Üstelik ücretsiz danışmanlık hizmetiyle.",
          image: require("../assets/trafik-sigortasi.jpeg"),
          link: "/urunler/trafik",
          icon: "fas fa-car"
        },
        {
          title: "Kasko Sigortası Yaptırana Ücretsiz Mini Onarım",
          description:
            "Genişletilmiş kasko sigortanızı şimdi yaptırın, yılda 2 kez mini onarım paketi ve yol yardımı ücretsiz sizin olsun!",
          image: require("../assets/kasko.jpg"),
          link: "/urunler/kasko",
          icon: "fas fa-tools"
        },
        {
          title: "DASK + Konut Sigortasında %15 Toplu Alım İndirimi",
          description:
            "Ev güvenliğiniz için iki sigorta bir arada! DASK ve konut sigortasını birlikte yaptıran müşterilerimize %15'e varan indirim.",
          image: require("../assets/konut-sigortasi.jpg"),
          link: "/urunler/dask",
          icon: "fas fa-home"
        }
      ]
    };
  }
};
</script>

<style scoped>
.card-title {
  font-weight: 600;
}
.card-img-top {
  border-top-left-radius: 1rem;
  border-top-right-radius: 1rem;
  height: 200px;
  object-fit: cover;
}

/* Hover efekti */
.campaign-card {
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}
.campaign-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
  cursor: pointer;
}
</style>
