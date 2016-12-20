ThinkingSphinx::Index.define :post, :with => :real_time do
  indexes title, as: :title_content
  has tag_ids, type: :integer, multi: true
  has created_at, type: :timestamp
end


