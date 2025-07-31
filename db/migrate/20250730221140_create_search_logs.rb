class CreateSearchLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :search_logs do |t|
      t.string :ip_address
      t.string :term
      t.string :region
      t.integer :count
      t.references :search_suggestion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
