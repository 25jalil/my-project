class Post < ActiveRecord::Base
  validates_presence_of :title, :body
  belongs_to :category
  has_many :tags_associations
  has_many :tags, through: :tags_associations
end
