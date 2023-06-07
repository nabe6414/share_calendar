class Public::GroupsController < ApplicationController
  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to group_path(@group.id)
    else
      @user = current_user
      @invitations = current_user.invitations.all
      @groups = current_user.belong_groups.all
      @group = Group.new
      render 'public/users/show'
    end
  end

  def show
    @group = Group.find(params[:id])
    @users = @group.users.all
    @group_owner = User.find_by(id: @group.owner_id)
    @invitations = @group.invitations.all
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
  end

  def delete_member
    @group = Group.find(params[:group_id])
    @group.users.delete(current_user.id)
    redirect_to user_path(current_user.id)
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :owner_id, invitations_attributes: [:owner_id, :user_id, :group_id, :approved] )
  end
end
