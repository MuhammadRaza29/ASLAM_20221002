import * as VideoTypes from "./types"
import Axios from "utils/axiosConfiguration"
 
export default {
  [VideoTypes.FETCH_VIDEOS]: ({ commit }, params) => {
    console.log(params)
    Axios.get('v1/videos', params)
      .then((response) => {
        commit(VideoTypes.SET_VIDEOS, response)
      })
      .catch((err) => {
        console.log('Error in fetching videos', err)
      })
  },
  [VideoTypes.ADD_VIDEO]: ({ commit }, params) => {
    Axios.post('v1/videos', params)
      .then((response) => {
        commit(VideoTypes.SUCCESSFULLY_ADDED, true)
      })
      .catch((err) => {
        let error_msg = err.response.data.error
        alert(error_msg)
        console.log('Error in adding video', error_msg)
      })
  }
}
