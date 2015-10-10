class GroupsController < AuthenticatedController
  def show
    group = Group.find(params[:id])
    render json: [group]
  end
end