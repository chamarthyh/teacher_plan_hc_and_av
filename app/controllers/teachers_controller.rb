class TeachersController < ApplicationController
  def index
    @teachers = Teacher.page(params[:page]).per(10)

    render("teacher_templates/index.html.erb")
  end

  def show
    @teacher = Teacher.find(params.fetch("id_to_display"))

    render("teacher_templates/show.html.erb")
  end
end
