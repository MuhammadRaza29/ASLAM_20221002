import * as VideoTypes from "./types"
import Axios from "utils/axiosConfiguration"
 
export default {
  [VideoTypes.FETCH_VIDEOS]: ({ commit }, params) => {
    console.log(params)
    Axios.get('v1/videos', 
      {
        params
      })
      .then((response) => {
        commit(VideoTypes.SET_VIDEOS, response)
      })
      .catch((err) => {
        console.log('Error in fetching videos', err)
      })
  }
}
