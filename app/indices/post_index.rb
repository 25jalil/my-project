ThinkingSphinx::Index.define :post, :with => :real_time do
  indexes title, as: :title_content
  has created_at, :type => :timestamp
end
