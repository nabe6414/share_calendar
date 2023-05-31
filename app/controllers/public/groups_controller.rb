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
  end

  def edit
    @group = Group.find(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :owner_id)
  end
end
