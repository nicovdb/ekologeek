class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.article = Article.first

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
        # format.json { render json: @photo, status: :created }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end

  end

  def show
    @photo = Photo.find(params[:id])
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end
end
