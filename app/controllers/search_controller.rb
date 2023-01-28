require 'httparty'
class SearchController < ApplicationController
    before_action:require_user
    def search
    end
    
    def retrieve
        if params[:ip].present?
            @data = find_info(params[:ip])
            @city=@data['city']
            @hostnames=@data['hostnames']
            @country=@data['country_name']
            @isp=@data['isp']
            @org=@data['org']
            @asn=@data['asn']
            @ports=@data['ports']
            if @data.nil?
                flash.now[:alert] = 'Something went wrong!'
                render :search
            else

                flash.now[:notice] = "Informations successfully retrieved"
                render :search
            end    
        else
          flash.now[:alert] = 'Please fill the input'
          render :search

        end
    end

   private
   def find_info(ip)
       response = HTTParty.get("https://api.shodan.io/shodan/host/#{ip}?key=")
        return json= JSON.parse(response.body)
       
    end
    private
    def require_user
        @user = User.find_by(id:session[:user_id])
        if @user.nil?
        redirect_to root_url,notice:"Your are not logged"
        end
      end
      
end
  
