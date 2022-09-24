class CreateProductFeatureValues < ActiveRecord::Migration[7.0]
  def change
    create_table :product_feature_values do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :feature_value, null: false, foreign_key: true

      t.timestamps
    end
  end
end
