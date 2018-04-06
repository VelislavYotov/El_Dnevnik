class SubjectGroupsController < ApplicationController


  def create
    j = JSON.parse(request.raw_post)
    @subgjectgroup = SubjectGroup.new
    @subgjectgroup[:group_id] = j['group_id']
    @subgjectgroup[:subject_id] = j['subject_id']
    @subgjectgroup.save
    render :json => @subgjectgroup, :status => 201
  end

  def index
    @subgjectgroups = SubgjectGroup.all

    @subjectgroups = @subjectgroups.group_id(params[:group_id]) if params[:group_id].present?
    @subjectgroups = @subjectgroups.subject_id(params[:subject_id]) if params[:subject_id].present?
    if @subgjectgroups.any?
         render :json => @subgjectgroups
       else
         render :json => {}, :status => 400
       end
  end

  def show
    @subgjectgroup = SubgjectGroup.where(id: params[:id])

      if @subgjectgroup.persisted?
        render :json => @subgjectgroup
      else
        render :json => {}, :status => 400
      end
  end

  def update
    @subgjectgroup = SubgjectGroup.find_or_initialize_by(id: params[:id])

    if @subgjectgroup.persisted?
        j = JSON.parse(request.raw_post)
        @subgjectgroup[:group_id] = j['group_id']
        @subgjectgroup[:subject_id] = j['subject_id']
        @subgjectgroup.save
        render :json => @subgjectgroup, :status => 201
    else
      render :json => {}, :status => 404
    end
  end

  def destroy
    @subgjectgroup = SubgjectGroup.find_or_initialize_by(id: params[:id])

    if @subgjectgroup.persisted?
      render :json => @subgjectgroup, :status => 204

      else
        render :json => {}, :status => 404
      end
      @subgjectgroup.destroy
  end




end
