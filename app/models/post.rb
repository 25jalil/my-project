class Post < ActiveRecord::Base
  validates_presence_of :title, :body
  belongs_to :category
  has_and_belongs_to_many :tags
end
