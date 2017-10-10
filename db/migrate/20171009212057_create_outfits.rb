class CreateOutfits < ActiveRecord::Migration[5.0]
  def change
    create_table :outfits do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
