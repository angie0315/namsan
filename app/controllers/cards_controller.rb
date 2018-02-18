class CardsController < ApplicationController
   before_action :find_card, only: [:show, :edit, :update, :destroy]
   before_action :authenticate_user!, except: :index
  
  def index
    @cards = Card.order(created_at: :DESC).page(params[:page]).per(16)
  end

  def show
    @reply = Reply.new
    @replies = @card.replies
  end

  def new
    @card = Card.new
  end
  def create
    @card = Card.new(card_params)
    if @card.save
      flash['notice'] = '게시글이 작성되었습니다'
      redirect_to card_path(@card.id)
    else
      flash['danger'] = '내용을 5자 이상과 사진이 필요합니다' 
      redirect_to new_card_path
    end
  end

  def edit
  end
  def update
    if @card.update(card_params)
      flash['notice'] = '게시글이 수정되었습니다'
      redirect_to card_path(@card)
    else
      flash['danger'] = '내용을 5자 이상과 사진이 필요합니다'
      redirect_to edit_card_path(@card)
    end
  end
  def destroy
    if @card.destroy
      flash['notice'] = '게시글이 삭제되었습니다'
      redirect_to cards_path
    else
      flash['danger'] = '게시글을 다시 삭제하세요'
      redirect_to card_path(@card)
    end
  end
  
  private
    def card_params
      params.require(:card).permit(:title, :content, :user_id, :image) 
    end
    def find_card
      @card = Card.find(params[:id])
    end
end
