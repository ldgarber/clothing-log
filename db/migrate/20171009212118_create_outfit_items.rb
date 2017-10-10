class CreateOutfitItems < ActiveRecord::Migration[5.0]
  def change
    create_table :outfit_items do |t|
      t.references :outfit, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
