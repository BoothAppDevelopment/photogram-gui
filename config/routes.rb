Rails.application.routes.draw do

  get("/", {:controller => "users", :action => "index"})

  # Users
  get("/users", {:controller => "users", :action => "index"})
  get("/users/:path_username", {:controller => "users", :action => "show"})
  get("/create_user", {:controller => "users", :action => "create"})

  # Photos
  get("/photos", {:controller => "photos", :action => "index"})
  get("/photos/:path_id", {:controller => "photos", :action => "show"})
  get("/delete_photo/:photo_id", {:controller => "photos", :action => "delete"})
  get("/create_photo", {:controller => "photos", :action => "create"})
  get("/update_photo/:photo_id", {:controller => "photos", :action => "update"})

  # Comments
  get("/create_comment", {:controller => "comments", :action => "create"})


end
