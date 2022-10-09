<template>
  <div class="row list">
    <h6>Add a new video</h6>
    <div class="col-md-3">
      <div class="form-group">
        <label for="title" class="form-check-label">Title</label>
        <input
          id="title"
          v-model="title"
          type="text"
          name="title"
          class="form-control"
          placeholder="Enter Title"
        >
      </div>
      <div class="form-group">
        <label for="Category" class="form-check-label">Select Category</label>
        <select
          id="categories"
          v-model="category_id"
          name="category_id"
          class="form-control"
        >
          <option disabled value="">--Select Category--</option>
            <option
              v-for="category in categories()"
              :value="category.id"
              :key="category.id"
            >
              {{ category.name }}
            </option>
        </select>
      </div>
      <div style='display:none'>
        {{ this.redirectToRoot }}
      </div>
      <div class="form-group">
        <label for="video" class="form-check-label">Upload a video</label>
        <input type="file" class="form-control" @change="handleVideoUpload">
      </div>
      <button class="btn btn-primary" @click="uploadVideo()">Add Video</button>
    </div>
  </div>
</template>


<script>
  import { CATEGORIES_MODULE, FETCH_CATEGORIES } from 'store/Categories/types'
  import { VIDEOS_MODULE, ADD_VIDEO } from 'store/Videos/types'
  import { mapState, mapActions, mapGetters } from "vuex";
  export default {
    data() {
      return {
        title: '',
        category_id: '',
        video: '',

      }
    },
    mounted() {
      this.fetchCategories()
    },
    computed: {
      redirectToRoot() {
        if(this.successfully_added() == true) {
          this.$router.push('/')
        }
      }
    },
    methods: {
      ...mapActions(CATEGORIES_MODULE, {
        fetchCategories: FETCH_CATEGORIES
      }),
      ...mapActions(VIDEOS_MODULE, {
        addVideo: ADD_VIDEO
      }),
      ...mapState(CATEGORIES_MODULE, ['categories']),
      ...mapState(VIDEOS_MODULE, ['successfully_added']),
      handleVideoUpload(event) {
        this.video = event.target.files[0]
        console.log(this.video)
      },
      uploadVideo() {
        let params = {
          title: this.title,
          category_id: this.category_id,
          video: this.video,
        }
        let formData = new FormData()
        Object.entries(params).forEach(
          ([key, value]) => formData.append(key, value)
        )
        this.addVideo(formData)
      }
    }
  }
</script>

<style scoped>
.list {
    background-color: #fff;
    padding: 2%;
    padding-top: 1%;
  }
</style>