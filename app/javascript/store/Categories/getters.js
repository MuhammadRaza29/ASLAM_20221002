import * as CategoryTypes from './types'

export default {
  [CategoryTypes.GET_CATEGORIES]: (state) => {
    return state.categories
  }
}
