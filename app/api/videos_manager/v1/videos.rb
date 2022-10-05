module VideosManager
  module V1
    class Videos < API
      resources :videos do
        desc 'Fetch All Videos'
        get do
          videos = Video.page(params[:page])
          { total_pages: videos.total_pages, total_videos: videos.total_count, videos: videos }
        end
      end
    end
  end
end
