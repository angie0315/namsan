class MemosController < ApplicationController
  before_action :find_memo, only: [:show, :edit, :update, :destroy]
  
  def index
    @memos = Memo.all.reverse
  end

  def show
    
  end

  def new
    @memo = Memo.new
  end
  def create
    @memo = Memo.create(memo_params)
    redirect_to memo_path(@memo)
  end

  def edit
  end
  def update
    @memo.update(memo_params)
    redirect_to memo_path(@memo)
  end
  def destroy
    @memo.destroy
    redirect_to root_path
  end
  
  private
    def memo_params
      params.require(:memo).permit(:title, :content) 
    end
    def find_memo
      @memo = Memo.find(params[:id])
    end
end
