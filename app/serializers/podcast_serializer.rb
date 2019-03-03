class PodcastSerializer < ActiveModel::Serializer
  attributes :id, :name, :image

  has_many :episodes
end
