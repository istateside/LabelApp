class ChangeAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :type, :live
    add_column :albums, :live, :boolean, null:false
  end
end
