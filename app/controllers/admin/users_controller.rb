class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @invitations = Invitation.where(user_id: @user.id).all
    @groups = @user.belong_groups.all
    @my_group = Group.where(owner_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:update_user] = "ユーザー情報が更新されました"
      redirect_to admin_user_path(@user.id)
    else
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to admin_users_path
    else
      render :show
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
