module VideosManager
  module V1
    module Helpers
      module AuthenticationHelper
        extend Grape::API::Helpers

        def authenticate_user
          error!('Unauthorized', 401) unless warden.authenticate?
        end

        def current_user
          warden.user
        end

        def warden
          unless @warden
            @warden = env['warden']
          end
          @warden
        end
      end
    end
  end
end
