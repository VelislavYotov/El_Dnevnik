class GradesController < ApplicationController
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
end
