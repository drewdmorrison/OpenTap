<template>
  <div id="register" class="text-center">
    <div class="register-container">
      <form class="form-register" @submit.prevent="register">
        <h1 class="h3 mb-3 font-weight-normal">Create Account</h1>
        <div class="alert alert-danger" role="alert" v-if="registrationErrors">
          {{ registrationErrorMsg }}
        </div>
        <label for="username" class="sr-only">Username</label>
        <input
          type="text"
          id="username"
          class="form-control"
          placeholder="username"
          v-model="user.username"
          required
          autofocus
        />
        <label for="password" class="sr-only">Password</label>
        <input
          type="password"
          id="password"
          class="form-control"
          placeholder="password"
          v-model="user.password"
          required
        />
        <input
          type="password"
          id="confirmPassword"
          class="form-control"
          placeholder="confirm password"
          v-model="user.confirmPassword"
          required
        />
        <label for="isBrewer">Own a brewery?</label>
        <input type="checkbox" id="isBrewer" v-model="isBrewer">

        <router-link :to="{ name: 'login' }" id="account-link">Have an account?</router-link>
        <button class="register-button" type="submit">
          Create Account
        </button>
      </form>
    </div>
  </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  name: 'register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      isBrewer: false,
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        if(this.isBrewer) {
          this.user.role = "brewer"
        }
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap');

  #register {
    font-family: Cousine;
    color: white;
    display: flex;
    flex-direction: column;
    width: 100%;
    height: 100vh;
    align-items: center;
    justify-content: center;
  }

  .register-container {
    display: flex;
    flex-direction: column;
    width: 100%;
    align-items: center;
  }

  .form-register {
    display: flex;
    flex-direction: column;
    width: 30%;
    align-items: center;
    justify-content: center;
    background: rgba(0, 0, 0, .8);
    border-radius: 4px;
  }

  .form-register input {
    border: 1px solid #000;
    border-radius: 4px;
    width: 70%;
    height: 1.75rem;
    margin-top: .5rem;
    margin-bottom: 1.5rem;
  }

  #account-link {
    color: white;
    text-decoration: none;
    margin-bottom: .2rem;
  }

  #account-link:hover {
    text-decoration: underline;
  }
 
  .register-button {
    height: 1.75rem;
    width: 150px;
    margin-bottom: 1rem;
    border-radius: 4px;
    background: rgb(255, 183, 100);
    color: black;
    font-weight: bold;
    cursor: pointer;
  }



  @media (max-width: 800px) {
    .form-signin {
      width: 90%;
    }
    .login-div input {
      width: 80%;
    }
  }
</style>
