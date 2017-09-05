class LoginController < ApplicationController

    def index
      @user = User.new()
    end
 
    def sign_in
      tmp_user = User.new(user_params)
      @user = User.find_by(login: tmp_user.login)
      
       if !@user
         @user = tmp_user
         flash[:notice] =t("user-not-found") + tmp_user.login.to_s
         render 'index'
       else
         session[:user_id] = @user.id
         redirect_to '/protected/index'
       end
    end

    def sign_up
      @user = User.new()
    end

    def sign_up_save
      @user = User.new(user_params)

      if @user.password != params[:password2]
        flash[:notice] = "Passwords must be the same "+ params[:password2]
        redirect_to '/login/sign_up'
      elsif User.find_by(login: @user.login)
        flash[:notice] = "User already exists: " + @user.login.to_s
        render 'sign_up'
      elsif @user.save()
        flash[:notice] = "Please login with your new user: " + @user.login
        redirect_to '/login/index'
      else
        flash[:notice] = "Login name not valid "
        redirect_to '/login/sign_up'
      end
    end

    def sign_out
      session[:user_id] = nil
      redirect_to '/home/index'
    end

  private
    def user_params
      params.require(:user).permit(:login, :password, :password2)
    end
end
