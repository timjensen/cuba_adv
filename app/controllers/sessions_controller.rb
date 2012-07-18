class SessionsController < ApplicationController
  def new
    render :layout => 'login'
  end
  
  def create
    user = User.find_by_name(params[:session][:name])
  if user && user.authenticate(params[:session][:password])
    sign_in user
    redirect_to admin_path
  else
    flash[:error] = 'Invalid email/password combination' 
    redirect_to login_path
  end
end
  
  def destroy
    sign_out
    redirect_to root_path
  end
  
  
end
