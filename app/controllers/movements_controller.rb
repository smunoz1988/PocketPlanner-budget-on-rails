class MovementsController < ApplicationController
  def index
    # Get all movements from the current user and from the current group
    @movements = current_user.movements.where(author_id: current_user.id, group_id: params[:group_id])
  end

  def new
    # Create a new movement
    @movement = Movement.new
  end

  def create
    @movement = Movement.new(post_params)
    @movement.author_id = current_user.id
    @movement.group_id = params[:group_id]
    if @movement.save
      flash[:notice] = 'Movement created'
      redirect_to user_group_movements_path(:user_id => current_user.id, :group_id => params[:group_id])
    else
      flash[:alert] = 'You already have a movement with that name'
      render turbo_stream: turbo_stream.replace('flash_messages', partial: 'shared/flash_messages')
    end
  end

    def post_params
      params.require(:movement).permit(:name, :amount)
    end
end
