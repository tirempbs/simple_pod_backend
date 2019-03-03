class Api::V1::PlaylistsController < ApplicationController
    before_action :find_playlist, only: [:update]

    def index
        @playlists = Playlist.all
        render json: @playlists
    end

    def update
        @playlist.update(playlist_params)
        if @playlist.save
            render json: @playlist, status: :accepted
        else
            render json: { errors: @playlist.errors.full_messages }, status: :unprocessible_entity
        end
    end

    private

    def playlist_params
        params.permit(:name)
    end

    def find_playlist
        @playlist = Playlist.find_by(id: params[:id])
    end
end
