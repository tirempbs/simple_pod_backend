class AddPodcastIdToEpidsodes < ActiveRecord::Migration[5.2]
  def change
    add_column :episodes, :podcast_id, :integer
  end
end
