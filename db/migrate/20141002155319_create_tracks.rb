class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title, null:false
      t.integer :album_id, null:false
      t.string :type, null:false

      t.timestamps
    end
  end
end
