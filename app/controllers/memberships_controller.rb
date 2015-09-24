class MembershipsController < AuthenticatedController

  def my_memberships
    render json: Membership.where(user_id: current_user.id)
  end

end