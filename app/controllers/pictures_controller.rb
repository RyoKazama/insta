class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_picture, only:[:edit,:update,:destroy]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(pictures_params)
    @picture.user_id = current_user.id
    if @picture.save
    redirect_to pictures_path, notice:"写真を投稿しました！"
    else
    render 'new'
    end
  end

  def show
  end

  def edit
    set_picture
  end

  def update
    set_picture
    @picture.update(pictures_params)
    if @picture.save
    redirect_to pictures_path, notice:"編集しました！"
    else
    render 'new'
    end
  end

  def destroy
    set_picture
    @picture.destroy
    redirect_to pictures_path, notice:"削除しました！"
  end

  private
    def pictures_params
      params.require(:picture).permit(:title,:picture)
    end

    def set_picture
      @picture = Picture.find(params[:id])
    end
end
