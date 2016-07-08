class Post < ActiveRecord::Base
  validates_presence_of :title, :body
  belongs_to :category
  has_many :tags_associations
  has_many :tags, through: :tags_associations

  scope :posts_for_tag, -> (tag) do
    includes(:tags_associations, :tags)
   .joins(:tags)
   .where("tags_associations.tag_id = ?", tag )
  end
end
