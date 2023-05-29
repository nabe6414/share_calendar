class Public::InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
    @group = Group.find(params[:group_id])
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.save
  end

  def edit
    @invitation = Invitation.find(params[:id])
    @group = Group.find(params[:group_id])
  end
  
  def update
    @invitation = Invitation.find(params[:id])
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
