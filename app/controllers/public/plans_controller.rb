class Public::PlansController < ApplicationController
  before_action :authenticate_user!
  def new
    @group = Group.find(params[:group_id])
    @plan = Plan.new
    @plan.group_id = @group.id
  end

  def create
    @group = Group.find(params[:group_id])
    @plan = @group.plans.new(plan_params)
    @plan.save
    redirect_to group_plans_path(@group.id)
  end

  def index
    @group = Group.find(params[:group_id])
    @plan = Plan.new
    @plan.group_id = @group.id
    @plans = @group.plans.all
    @group_owner = User.find_by(id: @group.owner_id)
    @users = @group.users.all
    @invitations = @group.invitations.all
    @new_plans = @group.plans.order(created_at: :desc).limit(10)
  end

  def destroy
    @group = Group.find(params[:group_id])
    @plan = @group.plans.find(params[:id])
    @plan.destroy
    redirect_to group_plans_path(@group.id)
  end

  private

  def plan_params
    params.require(:plan).permit(:user_id, :group_id, :title, :start, :end)
  end
end
