import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import ProductView from '@/views/ProductView.vue'
import ContactView from '@/views/ContactView.vue'
import OfferView from '@/views/OfferView.vue'
import LoginView from '@/views/LoginView.vue'
import DaskForm from '@/views/DaskForm.vue'
import KaskoForm from '@/views/KaskoForm.vue'
import MotosikletForm from '@/views/MotosikletForm.vue'
import TrafikForm from '@/views/TrafikForm.vue'
import ImmForm from '@/views/ImmForm.vue'
import TamamlayiciSaglikForm from '@/views/TamamlayiciSaglikForm.vue'
import PetForm from '@/views/PetForm.vue'
import SeyahatForm from '@/views/SeyahatForm.vue'
import MessagesView from '@/views/MessagesView.vue'


const routes = [
  { path: '/', name: 'Home', component: HomeView },
  { path: '/urunler', name: 'Product', component: ProductView },
  { path: '/kampanyalar', name: 'Offer', component: OfferView },
  { path: '/login', name: 'Login', component: LoginView },
  { path: '/iletisim', name: 'Contact', component: ContactView },
  { path: '/urunler/dask', name: 'DaskForm', component: DaskForm },
  { path: '/urunler/kasko', name: 'KaskoForm', component: KaskoForm },
  { path: '/urunler/motosiklet', name: 'MotosikletForm', component: MotosikletForm },
  { path: '/urunler/trafik', name: 'TrafikForm', component: TrafikForm },
  { path: '/urunler/imm', name: 'ImmForm', component: ImmForm },
  { path: '/urunler/tamamlayiciSaglik', name: 'TamamlayiciSaglikForm', component: TamamlayiciSaglikForm },
  { path: '/urunler/pet', name: 'PetForm', component: PetForm },
  { path: '/urunler/seyahat', name: 'SeyahatForm', component: SeyahatForm },
  { path: '/messages', name: 'MessagesView', component: MessagesView }

  
  
]
const router = createRouter({
  history: createWebHistory(),
  routes,
  linkActiveClass: 'active'
})

export default router
