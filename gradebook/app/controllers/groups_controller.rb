class GroupsController < ApplicationController

  def create
    j = JSON.parse(request.raw_post)
    @group = Group.new
    @group[:name] = j['name']
    @group.save
    render :json => @group, :status => 201
  end

  def index
    @groups = Group.all
    if @groups.any?
         render :json => @groups
       else
         render :json => {}, :status => 400
       end
  end

  def show
    @group = Group.where(id: params[:id])

      if @group.persisted?
        render :json => @group
      else
        render :json => {}, :status => 400
      end
  end

  def update
    @group = Group.find_or_initialize_by(id: params[:id])

    if @group.persisted?
        j = JSON.parse(request.raw_post)
        @group[:name] = j['name']
        @group.save
        render :json => @group, :status => 201
    else
      render :json => {}, :status => 404
    end
  end

  def destroy
    @group = Group.find_or_initialize_by(id: params[:id])

    if @group.persisted?
      render :json => @group, :status => 204

      else
        render :json => {}, :status => 404
      end
      @group.destroy
  end



end
