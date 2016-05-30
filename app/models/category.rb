class Category < ActiveRecord::Base
  acts_as_tree order: 'created_at DESC'
  has_many :posts, dependent: :delete_all
end
