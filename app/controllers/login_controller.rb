class LoginController < ApplicationController
    def index
      @user = User.new()
    end
 
    def sign_in
      @user = User.new(user_params)
      
       if !User.find_by(login:@user.login)
         render 'index'
       else
         redirect_to '/protected/index'
       end
    end

  private
    def user_params
      params.require(:user).permit(:login, :text)
    end
end
