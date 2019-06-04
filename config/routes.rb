Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "plans#index"
  # Routes for the Plans to coach resource:

  # CREATE
  get("/plans_to_coaches/new", { :controller => "plans_to_coaches", :action => "new_form" })
  post("/create_plans_to_coach", { :controller => "plans_to_coaches", :action => "create_row" })
  post("/create_plans_to_coach_from_plan", { :controller => "plans_to_coaches", :action => "create_row_from_plan" })

  # READ
  get("/plans_to_coaches", { :controller => "plans_to_coaches", :action => "index" })
  get("/plans_to_coaches/:id_to_display", { :controller => "plans_to_coaches", :action => "show" })

  # UPDATE
  get("/plans_to_coaches/:prefill_with_id/edit", { :controller => "plans_to_coaches", :action => "edit_form" })
  post("/update_plans_to_coach/:id_to_modify", { :controller => "plans_to_coaches", :action => "update_row" })

  # DELETE
  get("/delete_plans_to_coach/:id_to_remove", { :controller => "plans_to_coaches", :action => "destroy_row" })
  get("/delete_plans_to_coach_from_plan/:id_to_remove", { :controller => "plans_to_coaches", :action => "destroy_row_from_plan" })
  get("/delete_plans_to_coach_from_coach/:id_to_remove", { :controller => "plans_to_coaches", :action => "destroy_row_from_coach" })

  #------------------------------

  # Routes for the Action step resource:

  # CREATE
  get("/action_steps/new", { :controller => "action_steps", :action => "new_form" })
  post("/create_action_step", { :controller => "action_steps", :action => "create_row" })
  post("/create_action_step_from_goal", { :controller => "action_steps", :action => "create_row_from_goal" })

  # READ
  get("/action_steps", { :controller => "action_steps", :action => "index" })
  get("/action_steps/:id_to_display", { :controller => "action_steps", :action => "show" })

  # UPDATE
  get("/action_steps/:prefill_with_id/edit", { :controller => "action_steps", :action => "edit_form" })
  post("/update_action_step/:id_to_modify", { :controller => "action_steps", :action => "update_row" })

  # DELETE
  get("/delete_action_step/:id_to_remove", { :controller => "action_steps", :action => "destroy_row" })
  get("/delete_action_step_from_goal/:id_to_remove", { :controller => "action_steps", :action => "destroy_row_from_goal" })

  #------------------------------

  # Routes for the Goal resource:

  # CREATE
  get("/goals/new", { :controller => "goals", :action => "new_form" })
  post("/create_goal", { :controller => "goals", :action => "create_row" })
  post("/create_goal_from_plan", { :controller => "goals", :action => "create_row_from_plan" })

  # READ
  get("/goals", { :controller => "goals", :action => "index" })
  get("/goals/:id_to_display", { :controller => "goals", :action => "show" })

  # UPDATE
  get("/goals/:prefill_with_id/edit", { :controller => "goals", :action => "edit_form" })
  post("/update_goal/:id_to_modify", { :controller => "goals", :action => "update_row" })

  # DELETE
  get("/delete_goal/:id_to_remove", { :controller => "goals", :action => "destroy_row" })
  get("/delete_goal_from_plan/:id_to_remove", { :controller => "goals", :action => "destroy_row_from_plan" })

  #------------------------------

  # Routes for the Plan resource:

  # CREATE
  get("/plans/new", { :controller => "plans", :action => "new_form" })
  post("/create_plan", { :controller => "plans", :action => "create_row" })

  # READ
  get("/plans", { :controller => "plans", :action => "index" })
  get("/plans/:id_to_display", { :controller => "plans", :action => "show" })

  # UPDATE
  get("/plans/:prefill_with_id/edit", { :controller => "plans", :action => "edit_form" })
  post("/update_plan/:id_to_modify", { :controller => "plans", :action => "update_row" })

  # DELETE
  get("/delete_plan/:id_to_remove", { :controller => "plans", :action => "destroy_row" })
  get("/delete_plan_from_teacher/:id_to_remove", { :controller => "plans", :action => "destroy_row_from_teacher" })

  #------------------------------

  devise_for :coaches
  # Routes for the Coach resource:

  # READ
  get("/coaches", { :controller => "coaches", :action => "index" })
  get("/coaches/:id_to_display", { :controller => "coaches", :action => "show" })

  #------------------------------

  devise_for :teachers
  # Routes for the Teacher resource:

  # READ
  get("/teachers", { :controller => "teachers", :action => "index" })
  get("/teachers/:id_to_display", { :controller => "teachers", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
