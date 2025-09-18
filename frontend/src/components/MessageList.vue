<template>
  <div>
    <h2 class="text-center mb-4">📥 Gelen Mesajlar</h2>
    <div v-if="messages.length > 0">
      <div class="card mb-3" v-for="(msg, index) in messages" :key="index">
        <div class="card-body">
          <h5 class="card-title">{{ msg.name }} ({{ msg.email }})</h5>
          <h6 class="card-subtitle mb-2 text-muted">{{ msg.date }}</h6>
          <p class="card-text">{{ msg.message }}</p>
        </div>
      </div>
    </div>
    <div v-else class="alert alert-info text-center">Henüz mesaj yok.</div>
  </div>
</template>

<script>
export default {
  name: 'MessageList',
  props: {
    list: {
      type: Array,
      default: () => []
    }
  },
  computed: {
    messages() {
      return this.list;
    }
  }
};
</script>
