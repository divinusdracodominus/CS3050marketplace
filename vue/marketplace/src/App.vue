<template>
  <div id="app">
    <nav>
      <router-link to="/">Home</router-link>
      <router-link to="/profile">Profile</router-link>
      <router-link to="/post-item">Post Item</router-link>
    </nav>
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style lang="less">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
  nav {
    margin-bottom: 20px;
    a {
      margin: 0 10px;
      text-decoration: none;
      color: #42b983;
      &:hover {
        color: #35495e;
      }
    }
  }
}
</style>
