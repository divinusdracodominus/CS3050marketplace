<template>
  <div class="edit-profile">
    <div class="form-container">
      <h2>Edit Your Profile</h2>
      <form @submit.prevent="submitForm">
        <!-- Profile Picture Upload -->
        <div class="form-group profile-picture-group">
          <label>Profile Picture</label>
          <div class="profile-picture">
            <img :src="profilePicture || defaultAvatar" alt="Profile Picture" />
            <input type="file" @change="onFileChange" accept="image/*" />
          </div>
        </div>

        <!-- Personal Information Section -->
        <div class="section">
          <h3>Personal Information</h3>
          <!-- Name Field -->
          <div class="form-group">
            <label for="name">Full Name</label>
            <div class="input-icon">
              <i class="fas fa-user"></i>
              <input
                type="text"
                id="name"
                v-model="user.name"
                placeholder="Enter your full name"
                required
              />
            </div>
          </div>

          <!-- Email Field -->
          <div class="form-group">
            <label for="email">Email Address</label>
            <div class="input-icon">
              <i class="fas fa-envelope"></i>
              <input
                type="email"
                id="email"
                v-model="user.email"
                placeholder="Enter your email address"
                required
              />
            </div>
          </div>
        </div>

        <!-- Account Settings Section -->
        <div class="section">
          <h3>Account Settings</h3>
          <!-- Password Field -->
          <div class="form-group">
            <label for="password">New Password</label>
            <div class="input-icon">
              <i class="fas fa-lock"></i>
              <input
                type="password"
                id="password"
                v-model="user.password"
                placeholder="Enter a new password"
              />
            </div>
          </div>

          <!-- Confirm Password Field -->
          <div class="form-group">
            <label for="confirmPassword">Confirm Password</label>
            <div class="input-icon">
              <i class="fas fa-lock"></i>
              <input
                type="password"
                id="confirmPassword"
                v-model="user.confirmPassword"
                placeholder="Confirm your new password"
              />
            </div>
          </div>
        </div>

        <!-- Action Buttons -->
        <div class="form-actions">
          <button type="submit" class="btn btn-primary">
            <i class="fas fa-save"></i> Save Changes
          </button>
          <button type="button" class="btn btn-secondary" @click="cancelEdit">
            <i class="fas fa-times"></i> Cancel
          </button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      user: {
        name: '',
        email: '',
        password: '',
        confirmPassword: '',
        // other user fields
      },
      profilePicture: '',
      defaultAvatar: '/path/to/default-avatar.png',
    };
  },
  methods: {
    onFileChange(event) {
      const file = event.target.files[0];
      if (file) {
        this.profilePicture = URL.createObjectURL(file);
      }
    },
    submitForm() {
      // Form validation logic
      if (this.validateForm()) {
        // Submit the form data to the server
        // Show success message or handle errors
        alert('Profile updated successfully!');
      }
    },
    validateForm() {
      // Add form validation logic here
      // Return true if the form is valid, otherwise false
      return true;
    },
    cancelEdit() {
      // Logic to reset the form or navigate away
      this.$router.go(-1); // Go back to the previous page
    },
  },
};
</script>

<style scoped>
.edit-profile {
  display: flex;
  justify-content: center;
  padding: 2rem 1rem;
  background-color: #f9f9f9;
}

.form-container {
  background: #fff;
  padding: 2rem;
  border-radius: 8px;
  width: 100%;
  max-width: 600px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.form-container h2 {
  text-align: center;
  margin-bottom: 2rem;
}

.section {
  margin-bottom: 2rem;
}

.section h3 {
  margin-bottom: 1rem;
  color: #333;
}

.form-group {
  margin-bottom: 1.5rem;
}

.form-group label {
  display: block;
  font-weight: 600;
  margin-bottom: 0.5rem;
}

.input-icon {
  position: relative;
}

.input-icon i {
  position: absolute;
  left: 10px;
  top: 50%;
  transform: translateY(-50%);
  color: #999;
}

.input-icon input {
  width: 100%;
  padding: 0.5rem 0.5rem 0.5rem 2.5rem;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.profile-picture-group {
  text-align: center;
}

.profile-picture {
  position: relative;
  display: inline-block;
}

.profile-picture img {
  width: 120px;
  height: 120px;
  border-radius: 50%;
  object-fit: cover;
  margin-bottom: 1rem;
}

.profile-picture input[type='file'] {
  display: none;
}

.profile-picture::after {
  content: 'Change';
  position: absolute;
  bottom: -10px;
  left: 50%;
  transform: translateX(-50%);
  background: #007bff;
  color: #fff;
  padding: 0.3rem 0.6rem;
  border-radius: 4px;
  cursor: pointer;
  font-size: 0.8rem;
}

.profile-picture:hover::after {
  background: #0056b3;
}

.profile-picture:hover input[type='file'] {
  display: block;
}

.form-actions {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.btn {
  display: inline-flex;
  align-items: center;
  padding: 0.6rem 1.2rem;
  border: none;
  border-radius: 4px;
  font-size: 1rem;
  cursor: pointer;
}

.btn i {
  margin-right: 0.5rem;
}

.btn-primary {
  background-color: #28a745;
  color: #fff;
}

.btn-primary:hover {
  background-color: #218838;
}

.btn-secondary {
  background-color: #6c757d;
  color: #fff;
}

.btn-secondary:hover {
  background-color: #5a6268;
}
</style>
