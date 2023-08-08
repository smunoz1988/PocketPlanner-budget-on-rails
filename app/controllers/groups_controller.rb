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
      redirect_to user_groups_path(current_user)
    else
      render 'new'
    end
  end

  def post_params
    params.require(:group).permit(:name, :icon)
  end
end
