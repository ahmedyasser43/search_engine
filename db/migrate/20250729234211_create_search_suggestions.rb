class CreateSearchSuggestions < ActiveRecord::Migration[8.0]
  def change
    create_table :search_suggestions do |t|
      t.string :term
      t.integer :count

      t.timestamps
    end
  end
end
