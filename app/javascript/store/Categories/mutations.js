import * as CategoryTypes from './types'

export default {
  [CategoryTypes.SET_CATEGORIES]: (state, payload) => {
    state.categories = payload.data
  }
}
