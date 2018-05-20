class TradesController < ApplicationController
  before_action :find_trade, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :index
  
  def clothes
    @trade_per_page = 12
    @clothes = Trade.order(id: :desc).where(:variety => '옷').page(params[:page]).per(@trade_per_page)
    @clothes_length = Trade.order(id: :desc).where(:variety => '옷').length
    @page = params[:page].to_i
  end
  def books
    @trade_per_page = 12
    @books = Trade.order(id: :desc).where(:variety => '책').page(params[:page]).per(@trade_per_page)
    @books_length = Trade.order(id: :desc).where(:variety => '책').length
    @page = params[:page].to_i
  end
  def rests
    @trade_per_page = 12
    @rests = Trade.order(id: :desc).where(:variety => '기타').page(params[:page]).per(@trade_per_page)
    @rests_length = Trade.order(id: :desc).where(:variety => '기타').length
    @page = params[:page].to_i
  end
  def index
    @trades = Trade.order(created_at: :DESC).page(params[:page]).per(16)
  end

  def show
    # TODO: 댓글 달기
    @reply = Reply.new
    @replies = @trade.replies
  end

  def new
    @trade = Trade.new
  end
  def create
    @trade = Trade.new(trade_params)
    if @trade.save
      flash['notice'] = '게시글이 작성되었습니다'
      redirect_to trade_path(@trade.id)
    else
      flash['danger'] = '5자 이상의 글과 사진이 필요합니다' 
      redirect_to new_trade_path
    end
  end

  def edit
  end
  def update
    if @trade.update(trade_params)
      flash['notice'] = '게시글이 수정되었습니다'
      redirect_to trade_path(@trade)
    else
      flash['danger'] = '5자 이상의 글과 사진이 필요합니다'
      redirect_to edit_trade_path(@trade)
    end
  end
  def destroy
    if @trade.destroy
      flash['notice'] = '게시글이 삭제되었습니다'
      redirect_to trades_path
    else
      flash['danger'] = '게시글을 다시 삭제하세요'
      redirect_to trade_path(@trade)
    end
  end
  
  private
    def trade_params
      params.require(:trade).permit(:title, :content, :kakaoid,:user_id, :variety, :image) 
    end
    def find_trade
      @trade = Trade.find(params[:id])
    end
end
