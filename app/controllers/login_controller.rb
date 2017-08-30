class LoginController < ApplicationController
    def index
      @user = User.new()
    end
 
    def sign_in
      # params[:password]
      @user = User.new(user_params)

      
       if !User.find_by(login:@user.login)
         flash[:notice] = "User not found"
         render 'index'
       else
         @user = User.find_by(login:@user.login)
         session[:current_user_id] = @user.id
         redirect_to '/protected/index'
       end
    end

  private
    def user_params
      params.require(:user).permit(:login, :text)
    end
end
