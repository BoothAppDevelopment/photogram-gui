class PhotosController < ApplicationController

  def index
    @list_of_photos = Photo.all.order({ :created_at => :desc })

    render({ :template => "photo_templates/index.html.erb"})
  end


  def show
    photo_id = params.fetch("path_id")
    @the_photo = Photo.where({ :id => photo_id }).first
    
    render({ :template => "photo_templates/show.html.erb"})
  end


  def delete
    photo_id = params.fetch("photo_id")
    the_photo = Photo.where({ :id => photo_id}).first
    the_photo.destroy

    redirect_to("/photos")
  end


  def create
    #  Parameters: {"query_image"=>"a", "query_caption"=>"b", "query_owner_id"=>"c"}

    image_url = params.fetch("query_image")
    image_caption = params.fetch("query_caption")
    image_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new

    a_new_photo.image = image_url
    a_new_photo.caption = image_caption
    a_new_photo.owner_id = image_owner_id

    a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s)
  end


  def update
    photo_id = params.fetch("photo_id")
    image_url = params.fetch("input_image")
    image_caption = params.fetch("input_caption")

    the_photo = Photo.where({ :id => photo_id }).first

    the_photo.image = image_url
    the_photo.caption = image_caption

    the_photo.save

    redirect_to("/photos/" + the_photo.id.to_s)
  end

end