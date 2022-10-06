module VideosManager
  module V1
    class Videos < API
      resources :videos do
        desc 'Fetch all videos'
        get do
          videos = Video.page(params[:page])
          {
            total_pages: videos.total_pages,
            total_videos: videos.total_count,
            videos: videos
          }
        end

        desc 'Add a new video'
        params do
          requires :title, type: :string, allow_blank: false
          requires :category_id, type: :Integer
          requires :video, type: File, allow_blank: false
        end
        post do
          Video.create!(params[:page])
        end

        desc 'Get a video'
        route_param :id do
          get do
            Video.find(params[:id])
          end
        end
      end
    end
  end
end
