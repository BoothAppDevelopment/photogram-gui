Rails.application.routes.draw do

  get("/", {:controller => "users", :action => "index"})

  # Users
  get("/users", {:controller => "users", :action => "index"})
  get("/users/:path_username", {:controller => "users", :action => "show"})

  # Photos
  get("/photos", {:controller => "photos", :action => "index"})
  get("/users/:path_photo_id", {:controller => "photos", :action => "show"})
end
