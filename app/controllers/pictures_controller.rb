class PicturesController < ApplicationController

  def new
    @picture = Picture.new
    @pictures = Picture.all
  end
  
  def create
    d = params[:delete].split(",").map{|i| i.to_i}
    d.sort!{|a,b| b<=>a}
    d.each do |i|
      params[:picture][:image].delete_at(i)
    end
    
    picture_params[:image].each do |image|
      @picture = Picture.new(image: image, item_id: picture_params[:item_id])
      unless @picture.save
        respond_to do |format|
          format.json
          format.html
        end
      end
    end
  end

  private

  
  
end
