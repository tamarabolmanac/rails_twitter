class UserSessionsController < ApplicationController
	def new
  	end

	def create
	  @current_user = current_user
	  if login(params[:username], params[:password])
	    redirect_back_or_to(user_path(current_user), notice: 'Logged in successfully.')
	  else
	    flash.now.alert = "Login failed."
	    render action: :new
	  end
	end

	def destroy
	  logout
	  redirect_to(new_user_session_path, notice: 'Logged out!')
	end

end
