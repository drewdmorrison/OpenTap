<template>
  <div id="login" class="text-center">
    <div class="login-container">
      <form class="form-signin" @submit.prevent="login">
        <h1 class="h3 mb-3 font-weight-normal">OpenTap Login</h1>
        <div
          class="alert alert-danger"
          role="alert"
          v-if="invalidCredentials"
        >Invalid username/password!</div>
        <div
          class="alert alert-success"
          role="alert"
          v-if="this.$route.query.registration"
        >Thank you for registering, please sign in.</div>
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
        <router-link :to="{ name: 'register' }" id="register-link">I don't have an account yet!</router-link>
        <button class="login-button" type="submit">Login</button>
      </form>
    </div>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap');

  #login {
    font-family: Cousine, 'Montserrat', sans-serif;
    color: white;
    display: flex;
    flex-direction: column;
    width: 100%;
    height: 100vh;
    align-items: center;
    justify-content: center;
  }

  .login-container {
    display: flex;
    flex-direction: column;
    width: 100%;
    align-items: center;
  }

  .form-signin {
    display: flex;
    flex-direction: column;
    width: 30%;
    align-items: center;
    justify-content: center;
    background: rgba(0, 0, 0, .8);
    border-radius: 4px;
  }

  .form-signin h1 {
    margin-bottom: 1rem;
  }

  .form-signin input {
    border: 1px solid #000;
    border-radius: 4px;
    width: 70%;
    height: 1.75rem;
    margin-top: .5rem;
    margin-bottom: 1.5rem;
  }

  .alert-success {
    text-align: center;
  }

  #register-link {
    color: white;
    text-decoration: none;
    margin-bottom: .2rem;
  }

  #register-link:hover {
    text-decoration: underline;
  }

  .login-button {
    height: 1.75rem;
    width: 85px;
    margin-bottom: 1rem;
    border-radius: 4px;
    background: rgb(255, 183, 100);
    color: black;
    font-family: Cousine;
    font-weight: bold;
  }

  .login-button:hover {
    cursor: pointer;
  }

  @media (max-width: 1050px) {
    .form-signin {
      width: 90%;
    }
    .login-div input {
      width: 80%;
    }
  }
</style>
