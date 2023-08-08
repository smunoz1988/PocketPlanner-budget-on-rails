class MovementsController < ApplicationController
  def index
    # Get all movements from the current user and from the current group
    @group = Group.find(params[:group_id])
    @movements = current_user.movements.where(author_id: current_user.id, group_id: params[:group_id]).order(created_at: :desc)
  end

  def new
    @groups = current_user.groups.pluck(:name, :id)
    # Create a new movement
    @movement = Movement.new
  end

  def create
    @movement = Movement.new(post_params)
    @movement.author_id = current_user.id
    if @movement.save
      flash[:notice] = 'Transaction created'
      redirect_to user_group_movements_path(:user_id => current_user.id, :group_id => @movement.group_id)
    else
      flash[:alert] = 'Missing fields / repeated transaction name'
      render turbo_stream: turbo_stream.replace('flash_messages', partial: 'shared/flash_messages')
    end
  end

    def post_params
      params.require(:movement).permit(:name, :amount, :group_id)
    end
end
