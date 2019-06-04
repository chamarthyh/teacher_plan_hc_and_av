class PlansToCoachesController < ApplicationController
  def index
    @plans_to_coaches = PlansToCoach.all

    render("plans_to_coach_templates/index.html.erb")
  end

  def show
    @plans_to_coach = PlansToCoach.find(params.fetch("id_to_display"))

    render("plans_to_coach_templates/show.html.erb")
  end

  def new_form
    @plans_to_coach = PlansToCoach.new

    render("plans_to_coach_templates/new_form.html.erb")
  end

  def create_row
    @plans_to_coach = PlansToCoach.new

    @plans_to_coach.plan_id = params.fetch("plan_id")
    @plans_to_coach.coach_id = params.fetch("coach_id")

    if @plans_to_coach.valid?
      @plans_to_coach.save

      redirect_back(:fallback_location => "/plans_to_coaches", :notice => "Plans to coach created successfully.")
    else
      render("plans_to_coach_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_plan
    @plans_to_coach = PlansToCoach.new

    @plans_to_coach.plan_id = params.fetch("plan_id")
    @plans_to_coach.coach_id = params.fetch("coach_id")

    if @plans_to_coach.valid?
      @plans_to_coach.save

      redirect_to("/plans/#{@plans_to_coach.plan_id}", notice: "PlansToCoach created successfully.")
    else
      render("plans_to_coach_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @plans_to_coach = PlansToCoach.find(params.fetch("prefill_with_id"))

    render("plans_to_coach_templates/edit_form.html.erb")
  end

  def update_row
    @plans_to_coach = PlansToCoach.find(params.fetch("id_to_modify"))

    @plans_to_coach.plan_id = params.fetch("plan_id")
    @plans_to_coach.coach_id = params.fetch("coach_id")

    if @plans_to_coach.valid?
      @plans_to_coach.save

      redirect_to("/plans_to_coaches/#{@plans_to_coach.id}", :notice => "Plans to coach updated successfully.")
    else
      render("plans_to_coach_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_coach
    @plans_to_coach = PlansToCoach.find(params.fetch("id_to_remove"))

    @plans_to_coach.destroy

    redirect_to("/coaches/#{@plans_to_coach.coach_id}", notice: "PlansToCoach deleted successfully.")
  end

  def destroy_row_from_plan
    @plans_to_coach = PlansToCoach.find(params.fetch("id_to_remove"))

    @plans_to_coach.destroy

    redirect_to("/plans/#{@plans_to_coach.plan_id}", notice: "PlansToCoach deleted successfully.")
  end

  def destroy_row
    @plans_to_coach = PlansToCoach.find(params.fetch("id_to_remove"))

    @plans_to_coach.destroy

    redirect_to("/plans_to_coaches", :notice => "Plans to coach deleted successfully.")
  end
end
