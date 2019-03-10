class Api::V1::PodcastsController < ApplicationController
    before_action :find_podcast, only: [:update, :show, :edit, :destroy]

    def index
        @podcasts = Podcast.all
        render json: @podcasts
    end

    def show
        render json: @podcast
    end

    def new
        @podcast = Podcast.new
    end

    def create
        @podcast = Podcast.create(podcast_params)
        if @podcast.valid?
            render json: @podcast
        else
            render json: @podcast.errors.full_messages
        end
    end

    def edit
    end

    def update
        if @podcast.update_attributes(podcast_params)
            render json: @podcast, status: :accepted
        else
            render json: { errors: @podcast.errors.full_messages }, status: :unprocessible_entity
        end
    end

    def destroy
        @podcast.destroy
        render json: @sightings
    end

    def search
        q = params[:q]
        response = RestClient.get("https://listennotes.p.rapidapi.com/api/v1/search?sort_by_date=0&type=podcast&offset=0&language=English&safe_mode=0&q=#{q}", :'X-RapidAPI-Key' => '8l6hDCXGyVmshMAHyPH3qzr1wJQop1XTpdhjsnpxpnu2K2vnzx' )
        @results = JSON.parse(response)['results']
        render json: @results
    end

    def getPodcasts
      id = params[:id]
      response = RestClient.get("https://listennotes.p.rapidapi.com/api/v1/podcasts/#{id}?sort=recent_first", :'X-RapidAPI-Key' => '8l6hDCXGyVmshMAHyPH3qzr1wJQop1XTpdhjsnpxpnu2K2vnzx' )
      @results = JSON.parse(response)
      render json: @results
    end

    def getEpisode
      id = params[:id]
      response = RestClient.get("https://listennotes.p.rapidapi.com/api/v1/episodes/#{id}", :'X-RapidAPI-Key' => '8l6hDCXGyVmshMAHyPH3qzr1wJQop1XTpdhjsnpxpnu2K2vnzx')
      @results = JSON.parse(response)
      render json: @results
    end

    private

    def podcast_params
        params.require(:podcast).permit(:name)
    end

    def find_podcast
        @podcast = Podcast.find_by(id: params[:id])
    end
end
