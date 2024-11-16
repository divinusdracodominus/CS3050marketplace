<template>
  <div class="profile">
    <div class="profile-card">
      <div class="avatar-section">
        <img :src="user.avatar || defaultAvatar" alt="User Avatar" class="avatar" />
      </div>
      <div class="profile-details">
        <h2>{{ user.name }}</h2>
        <p>Email: {{ user.email }}</p>
        <p>Bio: {{ user.bio }}</p>
        <button @click="editProfile" class="edit-btn">
          <i class="fas fa-edit"></i> Edit Profile
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      user: {
        name: 'John Doe',
        email: 'johndoe@example.com',
        bio: 'Passionate about technology and design.',
        avatar: '', // URL to user avatar
      },
      defaultAvatar: '/path/to/default-avatar.png',
    };
  },
  methods: {
    editProfile() {
      this.$router.push('/edit-profile');
    },
  },
};
</script>

<style scoped>
.profile {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 80vh;
  background-color: #f4f4f4;
  padding: 2rem;
}

.profile-card {
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  padding: 2rem;
  text-align: center;
  width: 100%;
  max-width: 400px;
}

.avatar-section {
  margin-bottom: 1rem;
}

.avatar {
  width: 100px;
  height: 100px;
  border-radius: 50%;
  object-fit: cover;
  border: 2px solid #ddd;
}

.profile-details h2 {
  font-size: 1.5rem;
  margin-bottom: 0.5rem;
}

.profile-details p {
  margin: 0.5rem 0;
  color: #666;
}

.edit-btn {
  background-color: #007bff;
  color: white;
  border: none;
  padding: 0.5rem 1rem;
  border-radius: 4px;
  font-size: 1rem;
  cursor: pointer;
  margin-top: 1rem;
}

.edit-btn i {
  margin-right: 0.5rem;
}

.edit-btn:hover {
  background-color: #0056b3;
}
</style>
