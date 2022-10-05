import * as VideoTypes from 'store/VideosList/types'

export default {
  [VideoTypes.SET_VIDEOS]: (state, payload) => {
    const data = payload.data
    state.videos = data.videos
    state.totalPages = data.total_pages
    state.totalVideos = data.total_videos
  }
}
