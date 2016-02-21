require 'csv'

# CSV.foreach(Rails.root.join("categories.csv"), headers: true) do |row|
# 	Category.create! do |category|
# 		category.id = row[0]
# 		category.name = row[1]
# 	end
# end

# CSV.foreach(Rails.root.join("subcategories.csv"), headers: true) do |row|
# 	Subcategory.create! do |subcategory|
# 		subcategory.id = row[0]
# 		subcategory.name = row[1]
# 		subcategory.category_id = row[2]
# 	end
# end