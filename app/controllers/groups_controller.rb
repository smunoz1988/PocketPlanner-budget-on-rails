class GroupsController < ApplicationController
  def index
    @groups = Group.where(author_id: current_user.id)
    p @groups
  end

  def new
    @group = Group.new
  end
end
