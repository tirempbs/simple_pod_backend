class UserPodcastSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :podcast_id
end
