class CreateUserPodcasts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_podcasts do |t|
      t.integer :user_id
      t.integer :podcast_id

      t.timestamps
    end
  end
end
