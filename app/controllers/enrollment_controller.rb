class EnrollmentController < ApplicationController
  def create
    @enrollment = Enrollment.new
    @enrollment.student_id = params.fetch("query_student_id")
    @enrollment.course_id = params.fetch("query_course_id")

    if @enrollment.valid?
      @enrollment.save
      redirect_to("/students/#{@enrollment.student_id}", { :notice => "Enrollment created successfully." })
    else
      redirect_to("/students/#{@enrollment.student_id}", { :notice => "Enrollment failed to create successfully." })
    end
  end
end
