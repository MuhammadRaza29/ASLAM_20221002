<template>
  <div class='row'>
    <main>
      <div class='col-md-12 heading'>
        <h4>Videos</h4>
      </div>
      <div class="col-md-2">
        <router-link to="/add-new-video" class="btn btn-primary">Add New Video</router-link>
      </div>
      <hr>
    </main>
  </div>
   <router-view></router-view>
</template>

<style scoped>
  .logo {
    align-items: center !important;
  }
  .logo img {
    width: 250px;
  }
  main {
    background-color: #fff;
  }
  .heading {
    margin-top: 2%;
    margin-left: 2%;
  }
</style>
