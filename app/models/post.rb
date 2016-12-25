class Post < ActiveRecord::Base
  acts_as_votable
  after_save ThinkingSphinx::RealTime.callback_for(:post)

  belongs_to :category
  has_many :tags_associations
  has_many :tags, through: :tags_associations
  has_many :comments

  validates_presence_of :title, :body

  scope :posts_for_tag, -> (tag) do
    includes(:tags_associations, :tags)
   .joins(:tags)
   .where("tags_associations.tag_id = ?", tag )
  end
end
