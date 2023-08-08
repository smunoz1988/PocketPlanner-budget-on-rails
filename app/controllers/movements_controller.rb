class MovementsController < ApplicationController
  def index
    # Get all movements from the current user and from the current group
    @movements = current_user.movements.where(author_id: current_user.id, group_id: params[:group_id])
  end
end
