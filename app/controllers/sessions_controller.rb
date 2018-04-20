class SessionsController < ApplicationController
  before_action :private_access, only: [:destroy]
  before_action :public_access, except: [:destroy]
  def new
  end

  def create
  	@user = User.find_by(email: params[:email])
  	@password = params[:password]
  	@confirm_password = params[:confirm_password]
  	if @user && @password == @confirm_password && @user.authenticate(params[:password])
  		sign_in(@user)
  		redirect_to root_path
  	else
  		if @user == nil || @password != @confirm_password
  			@user = 'No existe el usuario en nuestra base de datos'
  			@error_confirmation = 'Las contraseñas no son validas rectifiquelas'
  			render :new
  		end
  	end
  end

  def destroy
	sign_out
	redirect_to root_path
  end
  
end
