class ApplicationController < ActionController::Base
    before_action :set_current_user  #before running any methods/actions call set_current_set
                                    #first thing when making request

    def set_current_user
        if session[:user_id]
          Current.user=User.find_by(id:session[:user_id])
        end
      end
end
