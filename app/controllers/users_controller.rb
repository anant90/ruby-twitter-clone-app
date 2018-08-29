class UsersController < ApplicationController
    def profile
        @userid = params[:user_id]
        @userinfo = User.find(params[:user_id])
        @usercount = @userinfo.tweets
        @tweets=Tweet.all
    end

    before_filter :configure_permitted_parameters
    protected
    # my custom fields are :name, :heard_how
    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) do |u|
            u.permit(:name, :heard_how, :email, :password, :password_confirmation)
        end
        devise_parameter_sanitizer.for(:account_update) do |u|
            u.permit(:name, :email, :password, :password_confirmation, :current_password)
        end
    end

end
