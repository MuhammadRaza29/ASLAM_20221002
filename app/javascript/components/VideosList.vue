<template>
  <Header />
  <div class='row list'>
    <h6>
      All Videos
      <span class="stl-text-grays-6">
        ({{totalVideos()}})
      </span>
    </h6>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">Title</th>
          <th scope="col">Category</th>
          <th scope="col">Thumbnail</th>
        </tr>
      </thead>
      <tbody>
        <tr v-if="totalVideos()==0">
          <td colspan='8' class='center'>
            <h5>No Records Found</h5>
          </td>
        </tr>
        <tr v-else v-for='video in this.videos()' :key='video.id'>
          <td>{{ video.title }}</td>
          <td>{{ video.category_id }}</td>
          <td>{{ video.thumbnail }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
  import { VIDEOS_MODULE, FETCH_VIDEOS, SUCCESSFULLY_ADDED } from 'store/Videos/types'
  import { mapActions, mapState } from 'vuex'
  import Header from 'components/shared/AppHeader.vue'

  export default {
    components: {
      Header
    },
    mounted() {
      this.fetchVideos({ page: 1 })
      if(this.successfully_added()==true) {
        alert('Sucessfully Added!')
        this.$store.commit(`${VIDEOS_MODULE}/${SUCCESSFULLY_ADDED}`, false)
      }
    },
    methods: {
      ...mapActions(VIDEOS_MODULE, {
        fetchVideos: FETCH_VIDEOS
      }),
      ...mapState(VIDEOS_MODULE, ['videos', 'totalVideos', 'totalPages', 'successfully_added'])
    }
  }
</script>

<style scoped>
  .list {
    background-color: #fff;
    padding: 2%;
    padding-top: 1%;
  }
  td img {
    border-radius: 2%;
  }
  .table {
    margin-top: 2%;
  }
</style>
