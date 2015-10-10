class MembershipsController < AuthenticatedController
  def my_memberships
    render json: Membership.where(user_id: current_user.id)
  end

  def index
    group = Group.find(params[:group_id])
    render json: group.memberships
  end
end