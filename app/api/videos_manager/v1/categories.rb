module VideosManager
  module V1
    class Categories < API
      resources :categories do
        desc 'Fetch all categories'
        get do
          Category.all
        end
      end
    end
  end
end
