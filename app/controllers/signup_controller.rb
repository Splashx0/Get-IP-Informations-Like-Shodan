class SignupController < ApplicationController
    before_action:require_user
    before_action:only_admin

    def new
        @user=User.new #create a new user instance
    end

    def create
        @user=User.new(user_params)#create a new user instance
        if @user.save
            redirect_to users_path, notice:"User created successfully." 
        else
            render :new
        end
    end     

    private
    def user_params
        params.require(:user).permit(:email,:password,:password_confirmation)#permit ,only allowed params to set
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
  