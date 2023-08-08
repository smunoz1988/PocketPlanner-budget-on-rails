class GroupsController < ApplicationController
  def index
    @groups = Group.where(author_id: current_user.id)
    p @groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(post_params)
    @group.author_id = current_user.id
    if @group.save
      flash[:notice] = "Group created"
      redirect_to user_groups_path(current_user)
    else
      flash[:alert] = "You already have a group with that name"
      render turbo_stream: turbo_stream.replace('flash_messages', partial: 'shared/flash_messages')
    end
  end

  def post_params
    params.require(:group).permit(:name, :icon)
  end
end
