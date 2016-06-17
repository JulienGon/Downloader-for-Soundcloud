class ArtistsController < ApplicationController
	before_action :set_artist, only: [:show, :edit, :update, :destroy]

	# GET /artists
	# GET /artists.json
	def index
		@artist_name = params[:artist_name]
		downloader = ScDownloader.new
		@artists = downloader.get_artists(@artist_name)
	end

	# GET /artists/1
	# GET /artists/1.json
	def show
		@artist = Artist.find(params[:id])
		downloader = ScDownloader.new
		@tracks = downloader.get_tracks(@artist)
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_artist
		@artist = Artist.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def artist_params
		params.require(:artist).permit(:name, :photo)
	end
end
