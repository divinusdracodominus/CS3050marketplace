<template>
  <div class="post-item">
    <div class="form-container">
      <h2>Post a New Product</h2>
      <form @submit.prevent="submitForm">
        <!-- Product Images -->
        <div class="form-group">
          <label for="images">Upload Product Images</label>
          <input type="file" id="images" multiple @change="handleImageUpload" />
          <div class="image-preview" v-if="images.length">
            <img v-for="(img, index) in images" :src="img" :key="index" alt="Product Image Preview" />
          </div>
        </div>

        <!-- Product Title -->
        <div class="form-group">
          <label for="title">Product Title</label>
          <input
            type="text"
            id="title"
            v-model="product.title"
            placeholder="Enter the product title"
            required
          />
        </div>

        <!-- Product Description -->
        <div class="form-group">
          <label for="description">Description</label>
          <textarea
            id="description"
            v-model="product.description"
            placeholder="Enter a detailed product description"
            rows="4"
            required
          ></textarea>
        </div>

        <!-- Product Price -->
        <div class="form-group">
          <label for="price">Price ($)</label>
          <input
            type="number"
            id="price"
            v-model="product.price"
            placeholder="Enter the product price"
            required
          />
        </div>

        <!-- Category Selection -->
        <div class="form-group">
          <label for="category">Category</label>
          <select id="category" v-model="product.category" required>
            <option value="" disabled>Select a category</option>
            <option value="electronics">Electronics</option>
            <option value="fashion">Fashion</option>
            <option value="home">Home</option>
          </select>
        </div>

        <!-- Submit Button -->
        <div class="form-actions">
          <button type="submit" class="btn btn-primary">Post Product</button>
          <button type="button" class="btn btn-secondary" @click="cancelPost">Cancel</button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      product: {
        title: '',
        description: '',
        price: '',
        category: '',
      },
      images: [],
    };
  },
  methods: {
    handleImageUpload(event) {
      const files = event.target.files;
      this.images = Array.from(files).map((file) => URL.createObjectURL(file));
    },
    submitForm() {
      if (this.validateForm()) {
        // Logic for posting product data to the server
        alert('Product posted successfully!');
      } else {
        alert('Please fill out all required fields.');
      }
    },
    validateForm() {
      const { title, description, price, category } = this.product;
      return title && description && price && category;
    },
    cancelPost() {
      // Logic to reset form or navigate away
      this.$router.go(-1); // Go back to the previous page
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
  border-radius: 8px;
  padding: 2rem;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  max-width: 600px;
  width: 100%;
}

h2 {
  text-align: center;
  margin-bottom: 1.5rem;
}

.form-group {
  margin-bottom: 1.5rem;
}

label {
  display: block;
  font-weight: bold;
  margin-bottom: 0.5rem;
}

input,
textarea,
select {
  width: 100%;
  padding: 0.5rem;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
}

textarea {
  resize: vertical;
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
  border: 1px solid #ddd;
}

.form-actions {
  display: flex;
  justify-content: space-between;
}

.btn {
  padding: 0.75rem 1.5rem;
  border: none;
  border-radius: 4px;
  font-size: 1rem;
  cursor: pointer;
}

.btn-primary {
  background-color: #007bff;
  color: white;
}

.btn-primary:hover {
  background-color: #0056b3;
}

.btn-secondary {
  background-color: #6c757d;
  color: white;
}

.btn-secondary:hover {
  background-color: #5a6268;
}
</style>
