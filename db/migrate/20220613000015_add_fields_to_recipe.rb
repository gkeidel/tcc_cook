class AddFieldsToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :kind, :string
    add_column :recipes, :portion, :string
    add_column :recipes, :duration, :datetime
    add_column :recipes, :poster, :string
  end
end
