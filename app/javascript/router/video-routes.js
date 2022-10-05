import VideosList from 'components/VideosList.vue'
import AddNewVideo from 'components/AddNewVideo.vue'

const VideoRoutes = [
  {
    path: '/',
    name: 'AllVides',
    component: VideosList,
  },
  {
    path: '/add-new-video',
    name: 'AddNewVideo',
    component: AddNewVideo,
  },
]

export default VideoRoutes;
