class AddUserIdToCategories < ActiveRecord::Migration[5.0]
  def change
    add_reference :categories, :user, index: true
  end
end
