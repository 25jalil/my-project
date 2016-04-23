# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
i = 0
25.times do
   i += 1
   posts = Post.create(title: "text #{i}", body: "This file should contain all the record creation needed to seed the database with its default values
   The data can then be loaded with the rake db:seed")
end
