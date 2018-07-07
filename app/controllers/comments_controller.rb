class CommentController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
