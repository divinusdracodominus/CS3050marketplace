<template>
  <div class="post-item">
    <div class="form-container">
      <h2>Post a New Product</h2>
      <form @submit.prevent="submitForm">
        <!-- Product Images -->
        <div class="form-group">
          <label for="images">Product Images</label>
          <input type="file" id="images" multiple @change="handleImageUpload" />
          <div class="image-preview" v-if="images.length">
            <img v-for="(img, index) in images" :src="img" :key="index" alt="Preview" />
          </div>
        </div>

        <!-- Title -->
        <div class="form-group">
          <label for="title">Product Title</label>
          <input type="text" id="title" v-model="title" placeholder="Enter product title" required />
        </div>

        <!-- Description -->
        <div class="form-group">
          <label for="description">Description</label>
          <textarea id="description" v-model="description" placeholder="Enter product description" required></textarea>
        </div>

        <!-- Price -->
        <div class="form-group">
          <label for="price">Price ($)</label>
          <input type="number" id="price" v-model="price" placeholder="Enter price" required />
        </div>

        <!-- Category -->
        <div class="form-group">
          <label for="category">Category</label>
          <select id="category" v-model="category">
            <option value="" disabled>Select a category</option>
            <option value="electronics">Electronics</option>
            <option value="fashion">Fashion</option>
            <option value="home">Home</option>
          </select>
        </div>

        <!-- Submit Button -->
        <button type="submit" class="submit-btn">Post Product</button>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      images: [],
      title: '',
      description: '',
      price: '',
      category: '',
    };
  },
  methods: {
    handleImageUpload(event) {
      const files = event.target.files;
      this.images = Array.from(files).map((file) => URL.createObjectURL(file));
    },
    submitForm() {
      if (this.title && this.description && this.price && this.category) {
        alert('Product Posted Successfully!');
        // Add logic to submit the product data to the server
      } else {
        alert('Please fill out all fields.');
      }
    },
  },
};
</script>

<style scoped>
.post-item {
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 2rem;
  background-color: #f9f9f9;
  min-height: 100vh;
}

.form-container {
  background: white;
  padding: 2rem;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  max-width: 500px;
  width: 100%;
}

.form-container h2 {
  margin-bottom: 1rem;
  text-align: center;
}

.form-group {
  margin-bottom: 1.5rem;
}

.form-group label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: bold;
}

.form-group input,
.form-group textarea,
.form-group select {
  width: 100%;
  padding: 0.5rem;
  border: 1px solid #ccc;
  border-radius: 4px;
  font-size: 1rem;
}

.image-preview {
  display: flex;
  gap: 0.5rem;
  margin-top: 0.5rem;
}

.image-preview img {
  width: 50px;
  height: 50px;
  border-radius: 4px;
  object-fit: cover;
  border: 1px solid #ccc;
}

.submit-btn {
  background-color: #007bff;
  color: white;
  border: none;
  padding: 0.75rem 1.5rem;
  border-radius: 4px;
  cursor: pointer;
  width: 100%;
}

.submit-btn:hover {
  background-color: #0056b3;
}
</style>
