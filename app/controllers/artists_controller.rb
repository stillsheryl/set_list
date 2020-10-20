class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def new
    @artist_id = params[:artist_id]
  end

  def create
    artist = Artist.create(artist_params)
    if artist.save
      redirect_to '/artists'
    else
      flash[:notice] = "Artist not created: Required information missing."
      # render :new
      redirect_to '/artists/new'
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    artist = Artist.find(params[:id])
    artist.update(name: params[:name])
    artist.save
    redirect_to '/artists'
  end

  def destroy
    Artist.destroy(params[:id])
    redirect_to '/artists'
  end

  private
  def artist_params
    params.permit(:name)
  end
end
