class EpisodeSerializer < ActiveModel::Serializer
  attributes :id, :podcast_id, :name, :audio

  belongs_to :podcast
end
