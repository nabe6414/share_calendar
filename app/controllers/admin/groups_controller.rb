class Admin::GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    @group_owner = User.find_by(id: @group.owner_id)
    @new_plans = @group.plans.order(created_at: :desc).limit(10)
    @users = @group.users.all
    @invitations = @group.invitations.all
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to admin_path
  end
end
