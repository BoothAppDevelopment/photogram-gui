class CommentsController < ApplicationController

  def create
    # Parameters: {"query_photo_id"=>"785", "query_author_id"=>"117", "query_comment_body"=>"testing", "photo_id"=>"785"}

    photo_id = params.fetch("query_photo_id")
    author_id = params.fetch("query_author_id")
    comment_body = params.fetch("query_comment_body")
    
    new_comment = Comment.new
    
    new_comment.photo_id = photo_id
    new_comment.author_id = author_id
    new_comment.body = comment_body
    
    new_comment.save
    
    redirect_to("/photos/" + photo_id.to_s )
  end


end
