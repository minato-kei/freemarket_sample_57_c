class PicturesController < ApplicationController

  def new
    @picture = Picture.new
    @pictures = Picture.all
  end
  
  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to root_path
    else
      render 'shippai'
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:image)
  end
end
