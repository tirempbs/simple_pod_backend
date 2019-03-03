class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :episode_id
end
