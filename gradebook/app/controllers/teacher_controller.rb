class TeacherController < ApplicationController

  before_action :authenticate_admin!

  def update
    @teacher = Teacher.find_or_initialize_by(id: params[:id])

    if @teacher.persisted?
        j = JSON.parse(request.raw_post)
        @teacher[:name] = j['name']
        @teacher[:subject_id] = j['subject_id']
        @teacher.save
        render :json => @teacher, :status => 201
    else
      render :json => {}, :status => 404
    end
  end
end
