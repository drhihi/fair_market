class CreateFeatureValues < ActiveRecord::Migration[7.0]
  def change
    create_table :feature_values do |t|
      t.belongs_to :feature, null: false, foreign_key: true
      t.belongs_to :valuable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
