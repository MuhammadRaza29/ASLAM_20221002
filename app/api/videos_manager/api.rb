module VideosManager
  class API < Grape::API
    format :json
    version 'v1', using: :path
    prefix :api

    mount V1::Videos
    mount V1::Categories
  end
end