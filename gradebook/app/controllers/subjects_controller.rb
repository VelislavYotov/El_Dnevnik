class SubjectsController < ApplicationController

   #devise_token_auth_group :member, contains: [:student, :admin, :teacher]
   before_action :authenticate_student!

  def create
    j = JSON.parse(request.raw_post)


    @subject = Subject.new
    @subject[:teacher_id] = j['teacher_id']
    @subject[:name] = j['name']
    @subject[:clas] = j['clas']
    @subject[:type] = j['type']
    @subject.save


    render :json => @subject , :status => 201
  end

  def index
    @subjects = Subject.all
    @subjects = @subjects.teacher_id(params[:teacher_id]) if params[:teacher_id].present?
    @subjects = @subjects.clas(params[:clas]) if params[:clas].present?
    @subjects = @subjects.type(params[:type]) if params[:type].present?

    if @subjects.any?
       render :json => @subjects
     else
       render :json => {}, :status => 400
     end
  end

  def show
    @subject = Subject.where(id: params[:id])

    if @subject.persisted?
      render :json => @subject
    else
      render :json => {}, :status => 400
    end

  end

  def update
    @subject = Subject.find_or_initialize_by(id: params[:id])

    if @subject.persisted?
        j = JSON.parse(request.raw_post)
        @subject[:name] = j['name']
        @subject[:clas] = j['clas']
        @subject[:type] = j['type']
        @subject[:teacher_id] = j['teacher_id']

        @subject.save
        render :json => @subject, :status => 201
    else
      render :json => {}, :status => 404
    end
  end

  def destroy
    @subject = Subject.find_or_initialize_by(id: params[:id])

    if @subject.persisted?
      render :json => @subject, :status => 204

      else
        render :json => {}, :status => 404
      end
      @subject.destroy
  end


end
