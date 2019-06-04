Rails.application.routes.draw do
  devise_for :teachers
  # Routes for the Teacher resource:

  # READ
  get("/teachers", { :controller => "teachers", :action => "index" })
  get("/teachers/:id_to_display", { :controller => "teachers", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
