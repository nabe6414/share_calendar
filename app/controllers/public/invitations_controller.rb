class Public::InvitationsController < ApplicationController
  before_action :authenticate_user!
  def new
    @group = Group.find(params[:group_id])
    @invitation = @group.invitations.new
  end

  def create
    @group = Group.find(params[:group_id])
    @invitation = @group.invitations.new(new_invitation_params)
    @invitation.save
    redirect_to group_invitations_path(@group.id)
  end

  def index
    @group = Group.find(params[:group_id])
    @invitation = @group.invitations.new
    @invitations = @group.invitations.all
  end

  def edit
    @group = Group.find(params[:group_id])
    @invitation = @group.invitations.find(params[:id])
  end

  def update
    @group = Group.find(params[:group_id])
    @invitation = @group.invitations.find(params[:id])
    if @invitation.update(invitation_params)
      if @invitation.approved = true
        @group.users << current_user
        @invitation.destroy
      end
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    if @group.owner_id == current_user.id # オーナーが招待を取り消すとき
      @invitation = @group.invitations.find(params[:id])
      @invitation.destroy
      redirect_to group_invitations_path(@group.id)
    else
      @invitation = @group.invitations.find(params[:id]) # 招待されたユーザが参加を断る時
      @invitation.destroy
      redirect_to user_path(current_user.id)
    end
  end

  private

  def new_invitation_params
    params.require(:invitation).permit(:owner_id, :user_id, :group_id, :approved)
  end

  def invitation_params
    params.permit(:owner_id, :user_id, :group_id, :approved)
  end
end
