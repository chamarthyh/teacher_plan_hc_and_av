class CoachesController < ApplicationController
  def index
    @coaches = Coach.all

    render("coach_templates/index.html.erb")
  end

  def show
    @coach = Coach.find(params.fetch("id_to_display"))

    render("coach_templates/show.html.erb")
  end
end
