class ProductFetchJob < ApplicationJob
  queue_as :default

  def perform(*args)
    10.times do
      category = Category.find_or_create_by(title: Faker::Commerce.unique.brand)
      50.times do
        Product.create(
          title: Faker::Commerce::product_name,
          description: Faker::Commerce.promotion_code,
          price: rand(1..1000),
          categories: [category])
      end
    end
  end
end
