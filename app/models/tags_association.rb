class TagsAssociation < ActiveRecord::Base
  after_save ThinkingSphinx::RealTime.callback_for(:post, [:post])
  belongs_to :post
  belongs_to :tag
end
