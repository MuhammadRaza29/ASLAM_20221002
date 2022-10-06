import { createRouter, createWebHashHistory } from 'vue-router'
import VideoRoutes from "./video-routes"

const routes = [...VideoRoutes]

const router = createRouter({
  history: createWebHashHistory('http://localhost:3000/'),
  routes
})

export default router