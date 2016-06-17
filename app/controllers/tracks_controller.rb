require "open-uri"


class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]


  # GET /tracks/1
  # GET /tracks/1.json
  def show
	track = Track.find(params[:id])

	stream_url = track.stream_url ? track.stream_url : ''
	filename   = track.artist.name + ' - ' + track.title

	downloader = SoundCloud::Downloader::Client.new(client_id: "e713c46023d1b1d92c262e6ba915d4d0")
	url = downloader.resolve(stream_url)



	# Makes the browser download the file
	send_data open(url).read,
		:type => "audio/mpeg",
		:disposition => "attachment; filename=\"#{filename}.mp3\""
  end

  private
   
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:title, :url)
    end
end
