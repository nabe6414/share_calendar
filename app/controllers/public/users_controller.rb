class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @invitations = Invitation.where(user_id: current_user.id).all
    @groups = current_user.belong_groups.all
    @group = Group.new
    @my_group = Group.where(owner_id: current_user.id)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:update_user] = "ユーザー情報が更新されました"
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end
  
  def destroy
    @user = current_user
    if @user.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
