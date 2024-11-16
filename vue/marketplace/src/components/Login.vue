<template>
  <div class="login">
    <div class="form-container">
      <h2>Login</h2>
      <form @submit.prevent="handleSubmit">
        <!-- Email Input -->
        <div class="form-group">
          <label for="email">Email</label>
          <input
            type="email"
            id="email"
            v-model="email"
            placeholder="Enter your email"
            required
          />
        </div>

        <!-- Password Input -->
        <div class="form-group">
          <label for="password">Password</label>
          <div class="password-input">
            <input
              :type="showPassword ? 'text' : 'password'"
              id="password"
              v-model="password"
              placeholder="Enter your password"
              required
            />
            <button
              type="button"
              @click="togglePasswordVisibility"
              class="toggle-password"
            >
              <i :class="showPassword ? 'fas fa-eye-slash' : 'fas fa-eye'"></i>
            </button>
          </div>
        </div>

        <!-- Action Buttons -->
        <div class="form-actions">
          <button type="submit" class="btn btn-primary">Login</button>
          <button type="button" class="btn btn-secondary" @click="forgotPassword">
            Forgot Password?
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
      email: '',
      password: '',
      showPassword: false,
    };
  },
  methods: {
    togglePasswordVisibility() {
      this.showPassword = !this.showPassword;
    },
    handleSubmit() {
      if (this.email && this.password) {
        // Logic to handle login submission
        alert('Login successful!');
      } else {
        alert('Please fill in all fields.');
      }
    },
    forgotPassword() {
      // Logic for forgotten password
      alert('Redirecting to password recovery page...');
    },
  },
};
</script>

<style scoped>
.login {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: #f4f4f4;
  padding: 2rem;
}

.form-container {
  background: white;
  padding: 2rem;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  max-width: 400px;
  width: 100%;
}

h2 {
  text-align: center;
  margin-bottom: 1.5rem;
  font-size: 1.5rem;
}

.form-group {
  margin-bottom: 1.5rem;
}

label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: bold;
}

input {
  width: 100%;
  padding: 0.5rem;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
}

.password-input {
  display: flex;
  align-items: center;
}

.password-input input {
  flex-grow: 1;
  border-right: none;
}

.toggle-password {
  background: none;
  border: 1px solid #ddd;
  border-left: none;
  border-radius: 0 4px 4px 0;
  padding: 0.5rem;
  cursor: pointer;
}

.toggle-password i {
  font-size: 1.2rem;
  color: #666;
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
