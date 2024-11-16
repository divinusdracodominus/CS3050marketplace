<template>
  <div class="home">
    <!-- Hero Section -->
    <section class="hero">
      <div class="hero-content">
        <h1>Welcome to Our Marketplace</h1>
        <p>Discover amazing deals and new arrivals!</p>
        <button @click="shopNow">Shop Now</button>
      </div>
    </section>

    <!-- Search and Filters -->
    <div class="filters">
      <input type="text" v-model="searchQuery" placeholder="Search for products..." />
      <select v-model="selectedCategory">
        <option value="">All Categories</option>
        <option value="electronics">Electronics</option>
        <option value="fashion">Fashion</option>
        <option value="home">Home</option>
      </select>
    </div>

    <!-- Product Listings -->
    <div class="product-list">
      <div class="product-card" v-for="product in filteredProducts" :key="product.id">
        <img :src="product.image" alt="Product Image" />
        <h3>{{ product.title }}</h3>
        <p>{{ product.price | currency }}</p>
        <button @click="addToCart(product)">Add to Cart</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      searchQuery: '',
      selectedCategory: '',
      products: [], // Fetch products from API
    };
  },
  computed: {
    filteredProducts() {
      return this.products.filter(
        (product) =>
          product.title.toLowerCase().includes(this.searchQuery.toLowerCase()) &&
          (!this.selectedCategory || product.category === this.selectedCategory)
      );
    },
  },
  methods: {
    shopNow() {
      this.$router.push('/listings');
    },
    addToCart(product) {
      // Add product to cart logic
    },
  },
};
</script>

<style>
/* Hero Section */
.hero {
  background: url('/path/to/banner.jpg') no-repeat center center/cover;
  text-align: center;
  color: white;
  padding: 4rem 2rem;
}

.hero-content h1 {
  font-size: 3rem;
}

.hero-content button {
  padding: 0.5rem 1.5rem;
  margin-top: 1rem;
}

/* Filters */
.filters {
  display: flex;
  justify-content: space-between;
  margin: 2rem 0;
}

.filters input,
.filters select {
  padding: 0.5rem;
  font-size: 1rem;
}

/* Product List */
.product-list {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 1.5rem;
}

.product-card {
  background: white;
  border: 1px solid #ddd;
  border-radius: 8px;
  padding: 1rem;
  text-align: center;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.product-card img {
  max-width: 100%;
  height: auto;
  border-bottom: 1px solid #ddd;
  margin-bottom: 1rem;
}

.product-card button {
  background: #007bff;
  color: white;
  padding: 0.5rem 1rem;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.product-card button:hover {
  background: #0056b3;
}
</style>
