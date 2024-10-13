<template>
  <div>
    <h1>Profile</h1>
    <p>Welcome to your profile page!</p >
    <EditProfile />
  </div>
</template>

<script>
import EditProfile from '@/components/EditProfile.vue'

export default {
  components: {
    EditProfile
  }
}
</script>
