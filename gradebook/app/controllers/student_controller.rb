class StudentController < ApplicationController

  before_action :authenticate_admin!

  def update
    @student = Student.find_or_initialize_by(id: params[:id])

    if @Student.persisted?
        j = JSON.parse(request.raw_post)
        @student[:name] = j['name']
        @student[:clas] = j['class']
        @student[:clas_number] = j['class_number']
        @student[:group_id] = j['group_id']
        @student.save
        render :json => @student, :status => 201
    else
      render :json => {}, :status => 404
    end
  end
end
