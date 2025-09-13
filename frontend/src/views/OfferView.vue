<template>
  <div class="container my-5">
    <!-- Başlık -->
    <div class="text-center mb-5">
      <h2>💸 Güncel Kampanyalar</h2>
      <p class="lead">
        En avantajlı sigorta kampanyaları burada! Hem cebinizi hem geleceğinizi korumak için özel fırsatları kaçırmayın.
      </p>
    </div>

    <!-- Kampanya Kartları -->
    <div class="row g-4">
      <!-- Kart 1 -->
      <div class="col-md-4">
        <div class="card h-100 shadow-sm border-0 rounded-4">
          <img src="../assets/trafik-sigortasi.jpeg" class="card-img-top" alt="Trafik Sigortası">
          <div class="card-body">
            <h5 class="card-title">🚗 İlk Trafik Sigortası Alımına Özel %10 İndirim</h5>
            <p class="card-text">
              Yeni müşterilerimize özel, ilk zorunlu trafik sigortasında %10 indirim fırsatı! Üstelik ücretsiz danışmanlık hizmetiyle.
            </p>
          </div>
        </div>
      </div>

      <!-- Kart 2 -->
      <div class="col-md-4">
        <div class="card h-100 shadow-sm border-0 rounded-4">
          <img src="../assets/kasko.jpg" class="card-img-top" alt="Kasko Sigortası">
          <div class="card-body">
            <h5 class="card-title">🛠️ Kasko Sigortası Yaptırana Ücretsiz Mini Onarım</h5>
            <p class="card-text">
              Genişletilmiş kasko sigortanızı şimdi yaptırın, yılda 2 kez mini onarım paketi ve yol yardımı ücretsiz sizin olsun!
            </p>
          </div>
        </div>
      </div>

      <!-- Kart 3 -->
      <div class="col-md-4">
        <div class="card h-100 shadow-sm border-0 rounded-4">
          <img src="../assets/konut-sigortasi.jpg" class="card-img-top" alt="Konut Sigortası">
          <div class="card-body">
            <h5 class="card-title">🏠 DASK + Konut Sigortasında %15 Toplu Alım İndirimi</h5>
            <p class="card-text">
              Ev güvenliğiniz için iki sigorta bir arada! DASK ve konut sigortasını birlikte yaptıran müşterilerimize %15'e varan indirim.
            </p>
          </div>
        </div>
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
  name: 'CampaignsView'
}
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
</style>
