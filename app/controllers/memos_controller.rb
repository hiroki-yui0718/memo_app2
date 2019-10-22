class MemosController < ApplicationController
  helper_method :search_memo
  before_action :search_memo
  before_action :set_memo,only:[:show,:destroy,:edit,:update]
  def index
    @memos = current_user.memos.recent
  end
  def new
    @memo = current_user.memos.new
  end
  def create
    @memo = current_user.memos.new(memo_params)
    if @memo.save
      redirect_to memos_path,notice:"メモ「#{@memo.article}」を登録しました"
    else
      render 'new'
    end
  end
  def show
  end
  def destroy
    @memo.destroy
    redirect_to root_path,notice:"メモ「#{@memo.article}」を削除しました"
  end
  def edit
    
  end
  def update
    @memo.update!(memo_params)
      redirect_to root_path,notice:"メモ「#{@memo.article}」を更新しました"
  end

  private def memo_params
    params.require(:memo).permit(
      :article,
      :memo1,
      :memo2,
      :memo3,
      :memo4,
      :image
    )
  end
  private def search_memo
    @q = current_user.memos.ransack(params[:q])
    @memos = @q.result(distinct: true).recent
  end
  private def set_memo
    @memo = current_user.memos.find(params[:id])
  end
end
