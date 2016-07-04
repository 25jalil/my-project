class Tag < ActiveRecord::Base
 has_many :tags_assosiations
 has_many :posts, through: :tags_assosiations
end
