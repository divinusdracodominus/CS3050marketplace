import axios from 'axios';

export default {
  data() {
    return {
      user: {
        username: '',
        email: '',
        password: '',
      },
      message: '',
    };
  },
  methods: {
    async createUser() {
      try {
        const response = await axios.post('http://localhost:8080/api/users', this.user);
        this.message = `User ${response.data.username} created successfully!`;
        this.user = { username: '', email: '', password: '' }; // 重置表单
      } catch (error) {
        this.message = 'Error creating user.';
      }
    },
  },
};

