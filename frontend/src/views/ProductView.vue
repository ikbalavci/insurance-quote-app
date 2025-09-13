<template>
  <div class="container my-5">
    <div class="row g-4 justify-content-center">
      <div
  v-for="item in urunler"
  :key="item.href"
  class="col-12 col-sm-6 col-md-4 col-lg-3 d-flex justify-content-center"
>
  <div class="teklifbox text-center p-4 border rounded shadow-sm">
    <a :href="item.href" :title="item.title" class="text-decoration-none">
      <div class="boximage mx-auto mb-3">
        <img
          class="img-fluid"
          :src="item.img"
          :alt="item.title"
          width="80"
        />
      </div>
      <div class="boxtitle mb-2">{{ item.title }}</div>
      <div class="boxcta mx-auto">Teklif Al</div>
    </a>
  </div>
</div>

    </div>
  </div>
</template>


<script>
export default {
  name: "UrunlerView",
  data() {
    return {
      urunler: [
        {
          title: "Kasko Sigortası",
          img: "https://otokocsigorta.com/content/uploads/icons/kasko-icon-86949abc-7.svg",
          href: "../urunler/kasko",
        },
        {
          title: "Trafik Sigortası",
          img: "https://otokocsigorta.com/content/uploads/icons/trafik-icon-7d3cb899-1.svg",
          href: "../urunler/trafik",
        },
        {
          title: "Motosiklet Sigortası",
          img: "https://otokocsigorta.com/content/uploads/icons/motosiklet-icon-new-b5eb112a-f.png",
          href: "../urunler/motosiklet",
        },
        {
          title: "İMM Sigortası",
          img: "https://otokocsigorta.com/content/uploads/icons/imm-icon-23d3fb64-a.png",
          href: "../urunler/imm",
        },
        {
          title: "Tamamlayıcı Sağlık",
          img: "https://otokocsigorta.com/content/uploads/icons/tss-icon-00e1adb2-4.svg",
          href: "/urunler/tamamlayiciSaglik",
        },
        {
          title: "DASK Sigortası",
          img: "https://otokocsigorta.com/content/uploads/icons/dask-icon-59fc1009-6.svg",
          href: "../urunler/dask",
        },
        {
          title: "Seyahat Sigortası",
          img: "https://otokocsigorta.com/content/uploads/icons/seyehat-icon-8576790f-9.png",
          href: "../urunler/seyahat",
        },
        {
          title: "Pati Sigortası",
          img: "https://otokocsigorta.com/content/uploads/icons/pet-icon-052ac3f7-4.png",
          href: "../urunler/pet",
        },
      ],
    };
  },
};
</script>


<style>
@media (max-width: 1024px) {
  .teklifbox {
    padding: 10px;
    width: 90%;
  }

  .teklifbox-container .row {
    flex-wrap: wrap;
    display: flex;
    justify-content: center;
    flex-direction: row;
  }
}

.teklifbox {
  padding: 10px;
  width: 250px; /* Genişlik sabitlendi */
  margin: 10px; /* Kartlar arası boşluk için */
}

.teklifbox a {
  color: inherit;
}

.boximage {
  display: flex;
  align-items: center;
  justify-content: center;
  background: #fff;
  border-radius: 50%;
  width: 100px;
  height: 100px;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.boxtitle {
  font-weight: 600;
  font-size: 16px;
  letter-spacing: 0.5px;
  color: #333;
  line-height: 1.3;
}

.boxcta {
  background: #fd963d;
  color: #fff;
  padding: 5px 20px;
  border-radius: 20px;
  font-size: 14px;
  font-weight: bold;
  display: inline-block;
  transition: background 0.3s;
}

.boxcta:hover {
  background: #e07c1e;
}
</style>
