class CommentsController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @comment = @job.comments.create(comment_params)

    redirect_to job_path(@comment.job)
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
