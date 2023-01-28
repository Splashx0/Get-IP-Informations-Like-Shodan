class UsersController < ApplicationController
  before_action:require_user
  before_action:only_admin

    def index
      @users=User.all
    end

    private
    def require_user
      @user = User.find_by(id:session[:user_id])
      if @user.nil?
      redirect_to root_url,notice:"Your are not logged"
      end
    end
    
    private
    def only_admin
      @user = User.find_by(id:session[:user_id])
      if @user.role!="admin"
        redirect_to root_url,notice:"Your are not an admin"
      end
    end  
   
  
  end
  