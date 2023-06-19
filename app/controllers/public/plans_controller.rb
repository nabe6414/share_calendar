class Public::PlansController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @plan = Plan.new
    @plan.group_id = @group.id
    render plain: render_to_string(partial: 'form_new', layout: false, locals: { plan: @plan })
  end

  def create
    @group = Group.find(params[:group_id])
    @plan = @group.plans.new(plan_params)
    @plan.save
    redirect_to group_path(@group.id)
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

  private

  def plan_params
    params.require(:plan).permit(:user_id, :group_id, :title, :start, :end)
  end
end
