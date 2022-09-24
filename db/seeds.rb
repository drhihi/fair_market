# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

data = []
1.upto(20) do |v|
  data.append({
                id: v,
                title: Faker::Food.unique.dish,
                description: Faker::Food.description,
                price: rand(1..100) })
end
Product.upsert_all(data)

data = []
1.upto(5) do |v|
  data.append({
                id: v,
                value: "str #{ v }" })

end
StringValue.upsert_all(data)

data = []
1.upto(5) do |v|
  data.append({
                id: v,
                value: v })

end
IntegerValue.upsert_all(data)

data = []
Feature.upsert({ id: 1, title: 'feature 1' })
StringValue.all.map.with_index do |r, i|
  # data.append({
  #               id: i + 1,
  #               feature: feature,
  #               valuable: r })
  data.append({
                id: i + 1,
                feature_id: 1,
                valuable_type: 'StringValue',
                valuable_id: r.id })
end
FeatureValue.upsert_all(data)

data = []
Feature.upsert({ id: 2, title: 'feature 2' })
IntegerValue.all.map.with_index do |r, i|
  # data.append({
  #               id: i + 6,
  #               feature: feature,
  #               valuable: r })
  data.append({
                id: i + 6,
                feature_id: 2,
                valuable_type: 'IntegerValue',
                valuable_id: r.id })
end
FeatureValue.upsert_all(data)

