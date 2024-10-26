<template>
  <div>
    <h2>Post Item</h2>
    <form @submit.prevent="postItem">
      <label for="description">Description:</label>
      <textarea id="description" v-model="description"></textarea>
      <label for="price">Price:</label>
      <input type="number" id="price" v-model="price">
      <button type="submit">Post</button>
    </form>
  </div>
</template>

<script>
export default {
  name: 'PostItem',
  data() {
    return {
      description: '',
      price: ''
    }
  },
  methods: {
    postItem() {
      // Here you can add the logic for publishing products, such as submitting them to the server through the API
      console.log('Posting item:', { description: this.description, price: this.price });
      this.description = '';
      this.price = '';
    }
  }
}
</script>
