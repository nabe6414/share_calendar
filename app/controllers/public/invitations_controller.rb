class Public::InvitationsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @invitation = @group.invitations.new
  end

  def create
    @group = Group.find(params[:group_id])
    @invitation = @group.invitations.new(invitation_params)
    @invitation.save
  end

  def edit
    @group = Group.find(params[:group_id])
    @invitation = @group.invitations.find(params[:id])
  end

  def update
    group = Group.find(params[:group_id])
    @invitation = @group.invitations.find(params[:id])
    if @invitation.update(invitation_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def invitation_params
    params.require(:invitation).permit(:owner_id, :user_id, :group_id, :approved)
  end
end
