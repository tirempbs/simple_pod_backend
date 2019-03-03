class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.integer :user_id
      t.integer :epidsode_id

      t.timestamps
    end
  end
end
