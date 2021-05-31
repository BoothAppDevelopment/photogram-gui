class UsersController < ApplicationController


  def index
    matching_users = User.all
    
    @list_of_users = matching_users.order({ :username => :asc})

    render({ :template => "user_templates/index.html.erb"})
  end

  def show
    url_username = params.fetch("path_username")
    @the_user = User.where({ :username => url_username}).first

    if @the_user == nil
      redirect_to("/404")
    else
      render({ :template => "user_templates/show.html.erb"})
    end

  end


  def create
    
    username = params.fetch("query_username")

    new_user = User.new

    new_user.username = username

    new_user.save

    redirect_to("/users/" + new_user.username.to_s )
  end

end