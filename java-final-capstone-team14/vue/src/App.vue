<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">
        <img src="./assets/Opentap4.png" alt="OpenTap" class="logo">
      </router-link>
      <burger-menu></burger-menu>
    </div>
    <router-view />
  </div>
</template>

<script>

import BurgerMenu from "@/components/BurgerMenu.vue"

export default {
    components: {
      BurgerMenu
    }
}
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
}
  #app {
      /* background-image: url('https://images.unsplash.com/photo-1559526642-c3f001ea68ee?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80'); */
      /* background-image: url('https://images.unsplash.com/photo-1606045426421-2412d1a18999?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1600&q=80'); */
    /* background-image: url('https://images.unsplash.com/photo-1626990140776-407c6c0a1605?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2600&q=80'); */
    background-image: url('../src/assets/ontap wallpaper.png');    
    background-position: center;
    background-size: cover;
    min-height: 100vh;
    background-repeat: no-repeat;
    background-attachment: fixed;
    overflow: hidden;
  }

  #nav {
    width: 100%;
    background: rgba(0, 0, 0, .8);
    height: 8rem;
    margin-bottom: 1%;
    display:flex;
    justify-content: space-between;
  }

  .logo{
    display: inline-block;
    width: 250px;
    height: 130px;
    object-fit: cover;
    object-position: 0px -10px;
    margin: 0px 0px 0px 55px;   
  }

</style>
