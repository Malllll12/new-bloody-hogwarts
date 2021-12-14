Rails.application.routes.draw do

  # get "/students/:id", to: "students#index"
  get "/students", to: "students#index"
end
