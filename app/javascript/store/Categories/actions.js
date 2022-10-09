import * as CategoryTypes from "./types"
import Axios from "utils/axiosConfiguration"
 
export default {
  [CategoryTypes.FETCH_CATEGORIES]: ({ commit }) => {
    Axios.get('v1/categories')
      .then((response) => {
        commit(CategoryTypes.SET_CATEGORIES, response)
      })
      .catch((err) => {
        console.log('Error in fetching categories', err)
      })
  }
}
