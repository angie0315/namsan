class CommentsController < ApplicationController
  def create
    if @comment = Comment.create(comment_params)
      flash['notice'] = '댓글이 작성되었습니다'
      redirect_to memo_path(@comment.memo)
    else
      flash['danger'] = '댓글을 다시 작성하세요'
      redirect_to memo_path(@comment.memo)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash['notice'] = '댓글이 삭제되었습니다'
      redirect_to memo_path(@comment.memo)
    else
      flash['danger'] = '댓글을 다시 삭제하세요'
      redirect_to memo_path(@comment.memo)
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:content,:memo_id)
  end
end
