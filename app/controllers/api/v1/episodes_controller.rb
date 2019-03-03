class Api::V1::EpisodesController < ApplicationController
    before_action :find_episode, only: [:update]

    def index
        @episodes = Episode.all
        render json: @episodes
    end

    def update
        @episode.update(episode_params)
        if @episode.save
            render json: @episode, status: :accepted
        else
            render json: { errors: @episode.errors.full_messages }, status: :unprocessible_entity
        end
    end

    private

    def episode_params
        params.permit(:name)
    end

    def find_episode
        @episode = Episode.find_by(id: params[:id])
    end
end
