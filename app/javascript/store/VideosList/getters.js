import * as VideoTypes from 'store/VideosList/types'

export default {
  [VideoTypes.GET_VIDEOS]: (state) => {
    return state.videos
  }
}
