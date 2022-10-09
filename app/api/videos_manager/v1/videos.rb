module VideosManager
  module V1
    class Videos < API
      resources :videos do
        desc 'Fetch all videos'
        get do
          videos = Video.order("id desc").page(params[:page])
          {
            total_pages: videos.total_pages,
            total_videos: videos.total_count,
            videos: videos
          }
        end

        desc 'Add a new video'
        params do
          requires :title, type: String, allow_blank: false
          requires :category_id, type: Integer, allow_blank: false
          requires :video, type: File, allow_blank: false
        end
        post do
          params[:video] = {
            io: File.open(params[:video][:tempfile].path),
            filename: params[:video][:filename],
            content_type: params[:video][:type],
            identify: false
          }
          video = Video.new(params)
          if video.save
            status 201
          else
            error!({ error: video.errors.full_messages.to_sentence }, 400)
          end
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
