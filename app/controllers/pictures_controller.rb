class PicturesController < ApplicationController

  def new
    @picture = Picture.new
    @pictures = Picture.all
  end
  
  def create
    binding.pry
    d = params[:delete].split(",").map{|i| i.to_i}
    d.sort!{|a,b| b<=>a}
    d.each do |i|
      params[:picture][:image].delete_at(i)
    end
    
    picture_params[:image].each do |image|
      @picture = Picture.new(image: image, item_id: picture_params[:item_id])
      binding.pry
      unless @picture.save
        respond_to do |format|
          format.json
          format.html
        end
      end
    end
  end

  private

  def picture_params
    params[:picture][:item_id] = 1
    params.require(:picture).permit({image:[]}, :item_id)
  end
end
