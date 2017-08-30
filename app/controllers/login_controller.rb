class LoginController < ApplicationController
    def index
      @user = User.new()
    end
 
    def sign_in
      # params[:password]
      tmp_user = User.new(user_params)
      @user = User.find_by(login: tmp_user.login)
      
       if !@user
         @user = tmp_user
         flash[:notice] = "User not found " + tmp_user.login.to_s
         render 'index'
       else
         session[:current_user_id] = @user.id
         redirect_to '/protected/index'
       end
    end

  private
    def user_params
      params.require(:user).permit(:login, :text)
    end
end
