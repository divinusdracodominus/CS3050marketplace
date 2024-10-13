<template>
  <div>
    <h2>Edit Profile</h2>
    <!-- Here we can add a form to edit user information -->
    <form>
      <label for="name">Name:</label>
      <input type="text" id="name" v-model="name">
      <label for="email">Email:</label>
      <input type="email" id="email" v-model="email">
      <button type="submit">Save</button>
    </form>
  </div>
</template>

<script>
export default {
  name: 'EditProfile',
  data() {
    return {
      name: '',
      email: ''
    }
  }
}
</script>
