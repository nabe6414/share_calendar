class Public::UsersController < ApplicationController
  def show
    @user = current_user
    @invitations = current_user.invitations.all
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
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
