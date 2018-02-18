class RepliesController < ApplicationController
  def create
    if @reply = Reply.create(reply_params)
      flash['notice'] = '댓글이 작성되었습니다'
      redirect_to card_path(@reply.card)
    else
      flash['danger'] = '댓글을 다시 작성하세요'
      redirect_to card_path(@reply.card)
    end
  end

  def destroy
    @reply = Reply.find(params[:id])
    if @reply.destroy
      flash['notice'] = '댓글이 삭제되었습니다'
      redirect_to card_path(@reply.card)
    else
      flash['danger'] = '댓글을 다시 삭제하세요'
      redirect_to card_path(@reply.card)
    end
  end
  private
  def reply_params
    params.require(:reply).permit(:content,:card_id, :user_id)
  end
end
