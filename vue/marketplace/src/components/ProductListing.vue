<template>
  <div class="product-listing">
    <div class="product-grid">
      <div class="product-card" v-for="product in products" :key="product.id">
        <img :src="product.image" alt="Product Image" class="product-image" />
        <div class="product-details">
          <h3 class="product-title">{{ product.title }}</h3>
          <p class="product-price">{{ product.price | currency }}</p>
          <p class="product-description">{{ product.description }}</p>
          <div class="product-actions">
            <button @click="addToCart(product)" class="btn-add-to-cart">Add to Cart</button>
            <button @click="viewDetails(product.id)" class="btn-view-details">View Details</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    products: {
      type: Array,
      required: true,
    },
  },
  methods: {
    addToCart(product) {
      // Logic to add product to cart
      alert(`Added ${product.title} to cart!`);
    },
    viewDetails(productId) {
      // Navigate to product details page
      this.$router.push(`/product/${productId}`);
    },
  },
  filters: {
    currency(value) {
      return `$${value.toFixed(2)}`;
    },
  },
};
</script>

<style scoped>
.product-listing {
  padding: 2rem;
  background-color: #f9f9f9;
}

.product-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 1.5rem;
}

.product-card {
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  transition: transform 0.3s, box-shadow 0.3s;
}

.product-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.product-image {
  width: 100%;
  height: 200px;
  object-fit: cover;
}

.product-details {
  padding: 1rem;
  text-align: center;
}

.product-title {
  font-size: 1.2rem;
  font-weight: bold;
  margin-bottom: 0.5rem;
}

.product-price {
  color: #007bff;
  font-size: 1.1rem;
  margin-bottom: 0.5rem;
}

.product-description {
  color: #666;
  font-size: 0.9rem;
  margin-bottom: 1rem;
}

.product-actions {
  display: flex;
  justify-content: center;
  gap: 1rem;
}

.btn-add-to-cart,
.btn-view-details {
  background: #007bff;
  color: white;
  border: none;
  padding: 0.5rem 1rem;
  border-radius: 4px;
  cursor: pointer;
  transition: background 0.3s;
}

.btn-add-to-cart:hover,
.btn-view-details:hover {
  background: #0056b3;
}
</style>
