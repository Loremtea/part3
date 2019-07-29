class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    
  end
  
  def new
    # debugger
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    # @user = User.new(params[:user])    # 実装は終わっていないことに注意!
    if @user.save
      # 保存の成功をここで扱う。
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      flash.now[:alert] = @user.errors.full_messages.join($RS)
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
