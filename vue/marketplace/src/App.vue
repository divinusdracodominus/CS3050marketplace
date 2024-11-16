<template>
  <div>
    <nav class="navbar">
      <h1>Marketplace</h1>
      <ul>
        <li><router-link to="/">Home</router-link></li>
        <li><router-link to="/profile">Profile</router-link></li>
        <li><router-link to="/listings">Listings</router-link></li>
        <li><router-link to="/add-item">Add Item</router-link></li>
        <li><router-link to="/checkout">Checkout</router-link></li>
      </ul>
    </nav>
    <router-view />
    <footer>
      <p>&copy; 2024 Marketplace. All rights reserved.</p>
    </footer>
  </div>
</template>

<style>
.navbar {
  display: flex;
  justify-content: space-between;
  padding: 1rem;
  background: #333;
  color: #fff;
}

.navbar ul {
  list-style: none;
  display: flex;
}

.navbar ul li {
  margin: 0 10px;
}

footer {
  text-align: center;
  padding: 1rem;
  background: #f4f4f4;
}
</style>
