class Api::V1::UserPodcastsController < ApplicationController
    before_action :find_userpodcast, only: [:update]

    def index
        @userpodcasts = UserPodcast.all
        render json: @userpodcasts
    end

    def update
        @userpodcast.update(userpodcast_params)
        if @userpodcast.save
            render json: @userpodcast, status: :accepted
        else
            render json: { errors: @userpodcast.errors.full_messages }, status: :unprocessible_entity
        end
    end

    private

    def userpodcast_params
        params.permit(:name)
    end

    def find_userpodcast
        @userpodcast = UserPodcast.find_by(id: params[:id])
    end
end
