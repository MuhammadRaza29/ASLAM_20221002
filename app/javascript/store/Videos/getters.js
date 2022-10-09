import * as VideoTypes from 'store/Videos/types'

export default {
  [VideoTypes.GET_VIDEOS]: (state) => {
    return state.videos
  }
}
