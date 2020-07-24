class SessionsController < ApplicationController
  
    def create
      user = User.find_by(name: params[:user][:name])
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to '/homepage'
      else 
        redirect_to '/login', alert: "Invalid, try again"
      end
    end
   
end