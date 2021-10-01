<template>
    <slide right :closedOnNavigation="true" closeOnNavigation>
        <router-link v-bind:to="{ name: 'home' }" class="links">
          Home
        </router-link>
        <router-link v-bind:to="{ name: 'login' }" v-if="$store.state.token === ''" class="links">
          Login
        </router-link>
        <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''" class="links">
          Logout
        </router-link>
      </slide>

</template>

<script>
import { Slide } from 'vue-burger-menu';

export default {
    components: {
      Slide
    }
}
</script>

<style>

    .links {
        text-decoration: none;
        color: white;
        font-family: cousine, monospace;
        font-size: 2rem;
    }

    .links:hover {
        color: rgba(255, 183, 100, .8);
    }

    .bm-burger-bars {
      background-color:  white;
      border-radius: 2px;
    }

    .bm-burger-button {
      margin-right: 45px;
      margin-top: 10px;
      cursor: pointer;
    }

    .bm-burger-button:hover > .bm-burger-bars {
        background-color:  rgb(255, 183, 100);
    }

     .bm-menu {
      background: rgba(0, 0, 0, .8);
      display: flex;
      justify-content: center;
    }

    .bm-item-list {
        text-align: center;
        margin-left: 0px;
    }


  
</style>