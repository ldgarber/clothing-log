class AddFitpicColumnToOutfits < ActiveRecord::Migration[5.0]
  def up
    add_attachment :outfits, :fitpic
  end

  def down
    remove_attachment :outfits, :fitpic
  end
end
