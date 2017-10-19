class AddDescriptionToOutfits < ActiveRecord::Migration[5.0]
  def change
    add_column :outfits, :description, :text
  end
end
