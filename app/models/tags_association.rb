class TagsAssociation < ActiveRecord::Base
  belongs_to :post
  belongs_to :tag
end
