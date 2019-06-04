class PlansController < ApplicationController
  before_action :current_teacher_must_be_plan_teacher, :only => [:edit_form, :update_row, :destroy_row]

  def current_teacher_must_be_plan_teacher
    plan = Plan.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_teacher == plan.teacher
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Plan.ransack(params[:q])
    @plans = @q.result(:distinct => true).includes(:teacher, :goals, :plans_to_coaches, :coaches).page(params[:page]).per(10)

    render("plan_templates/index.html.erb")
  end

  def show
    @plans_to_coach = PlansToCoach.new
    @goal = Goal.new
    @plan = Plan.find(params.fetch("id_to_display"))

    render("plan_templates/show.html.erb")
  end

  def new_form
    @plan = Plan.new

    render("plan_templates/new_form.html.erb")
  end

  def create_row
    @plan = Plan.new

    @plan.plan_name = params.fetch("plan_name")
    @plan.teacher_id = params.fetch("teacher_id")
    @plan.coach_id = params.fetch("coach_id")
    @plan.status = params.fetch("status")

    if @plan.valid?
      @plan.save

      redirect_back(:fallback_location => "/plans", :notice => "Plan created successfully.")
    else
      render("plan_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @plan = Plan.find(params.fetch("prefill_with_id"))

    render("plan_templates/edit_form.html.erb")
  end

  def update_row
    @plan = Plan.find(params.fetch("id_to_modify"))

    @plan.plan_name = params.fetch("plan_name")
    
    @plan.coach_id = params.fetch("coach_id")
    @plan.status = params.fetch("status")

    if @plan.valid?
      @plan.save

      redirect_to("/plans/#{@plan.id}", :notice => "Plan updated successfully.")
    else
      render("plan_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_teacher
    @plan = Plan.find(params.fetch("id_to_remove"))

    @plan.destroy

    redirect_to("/teachers/#{@plan.teacher_id}", notice: "Plan deleted successfully.")
  end

  def destroy_row
    @plan = Plan.find(params.fetch("id_to_remove"))

    @plan.destroy

    redirect_to("/plans", :notice => "Plan deleted successfully.")
  end
end
