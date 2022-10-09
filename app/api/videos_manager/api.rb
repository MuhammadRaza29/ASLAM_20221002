module VideosManager
  class API < Grape::API
    format :json
    version 'v1', using: :path
    prefix :api

    helpers VideosManager::V1::Helpers::AuthenticationHelper

    before do
      authenticate_user
    end

    mount V1::Videos
    mount V1::Categories
  end
end