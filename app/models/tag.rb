class Tag < ActiveRecord::Base
  has_many :tags_associations, dependent: :destroy
  has_many :posts, through: :tags_associations
  validates :name, uniqueness: true
end
