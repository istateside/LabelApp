class ChangeTracks < ActiveRecord::Migration
  def change
    remove_column :tracks, :type

    add_column :tracks, :bonus, :boolean, null:false
  end
end
