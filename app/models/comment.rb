class Comment < ActiveRecord::Base
  after_save ThinkingSphinx::RealTime.callback_for(:article, [:article])
  belongs_to :user
  belongs_to :post
end
