class GradesController < ApplicationController

   #devise_token_auth_group :member, contains: [:student, :admin, :teacher]
   #before_action :authenticate_member!, :except => [:show, :index]
   before_action :authenticate_student!, :only => [:show, :index]
   before_action :authenticate_teacher!
   before_action :authenticate_admin!

  def create
    j = JSON.parse(request.raw_post)


    @grade = Grade.new
    @grade[:subject_id] = j['subject_id']
    @grade[:student_id] = j['student_id']
    @grade[:mark] = j['mark']
    @grade[:exam_date] = j['exam_date']
    @grade.save


    render :json => @grade , :status => 201
  end

  def index
    @grades = Grade.all
    @grades = @grades.subject_id(params[:subject_id]) if params[:subject_id].present?
    @grades = @grades.student_id(params[:student_id]) if params[:student_id].present?

    if @grades.any?
       render :json => @grades
     else
       render :json => {}, :status => 400
     end
  end

  def show
    @grade = Grade.where(id: params[:id])

    if @grade.persisted?
      render :json =>@grade
    else
      render :json => {}, :status => 400
    end
  end

  def update
    @grade = Grade.find_or_initialize_by(id: params[:id])

    if @grade.persisted?
        j = JSON.parse(request.raw_post)
        @grade[:student_id] = j['student_id']
        @grade[:mark] = j['mark']
        @grade[:exam_date] = j['exam_date']
        @grade.save
        render :json => @grade, :status => 201
    else
      render :json => {}, :status => 404
    end
  end

  def destroy
    @grade = Grade.find_or_initialize_by(id: params[:id])

    if @grade.persisted?
      render :json => @grade, :status => 204

      else
        render :json => {}, :status => 404
      end
      @grade.destroy
  end



end
