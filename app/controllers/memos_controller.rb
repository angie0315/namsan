class MemosController < ApplicationController
  before_action :find_memo, only: [:show, :edit, :update, :destroy]
  
  def index
    @memos = Memo.order(created_at: :DESC).page(params[:page]).per(12)
  end

  def show
    @comment = Comment.new
    @comments = @memo.comments
  end

  def new
    @memo = Memo.new
  end
  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      flash['notice'] = '게시글이 작성되었습니다'
      redirect_to memo_path(@memo.id)
    else
      flash['danger'] = '내용을 5자 이상 써주세요'
      redirect_to new_memo_path
    end
  end

  def edit
  end
  def update
    if @memo.update(memo_params)
      flash['notice'] = '게시글이 수정되었습니다'
      redirect_to memo_path(@memo)
    else
      flash['danger'] = '내용을 5자 이상 써서 수정하세요'
      redirect_to edit_memo_path(@memo)
    end
  end
  def destroy
    if @memo.destroy
      flash['notice'] = '게시글이 삭제되었습니다'
      redirect_to memos_path
    else
      flash['danger'] = '게시글을 다시 삭제하세요'
      redirect_to memo_path(@memo)
    end
  end
  
  private
    def memo_params
      params.require(:memo).permit(:title, :content) 
    end
    def find_memo
      @memo = Memo.find(params[:id])
    end
end
