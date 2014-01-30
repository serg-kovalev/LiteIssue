class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new( comment_params )
    if @comment.save
      redirect_to :back
    else
      #render 'new', notice: 'Project creation failed'
    end
  end

  private

    def comment_params
      params.require( :comment ).permit( :task_id, :user_id, :description )
    end

end
