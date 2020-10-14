class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def new
    @artist_id = params[:artist_id]
  end

  def create
    Artist.create(artist_params)
    redirect_to '/artists'
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
